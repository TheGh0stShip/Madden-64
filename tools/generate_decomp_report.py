#!/usr/bin/env python3
"""Generate the objdiff v2 progress report used by public trackers."""

from __future__ import annotations

import argparse
import json
import re
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / "config/us/progress.toml"
LOADER_MAP = ROOT / "config/us/loader_map.tsv"
DECOMPHUB_REPORT = ROOT / "decomphub.progress.json"
INSTRUCTION_ASM = re.compile(
    r'^\s*(?:__asm__|asm)\s*(?:volatile\s*)?\(\s*"([^"]+)',
    re.MULTILINE,
)
AMBIGUOUS_ASM = re.compile(
    r'^\s*(?:__asm__|asm)\s*(?:volatile\s*)?\(\s*(?:""\s*"[^\"]+|[^"\s])',
    re.MULTILINE,
)
ASSEMBLY_SOURCE_ESCAPE = re.compile(
    r'^\s*#\s*include\s*[<"][^>"]+\.(?:s|S|asm|inc)[>"]|'
    r'\.incbin\b|__attribute__\s*\(\(\s*naked\s*\)\)',
    re.MULTILINE,
)
ANY_C_ASM = re.compile(r'\b(?:__asm__|asm)\b')


def measures(total_code: int, matched_code: int, total_functions: int,
             matched_functions: int, total_data: int = 0,
             matched_data: int = 0) -> dict[str, object]:
    code_percent = matched_code * 100.0 / total_code if total_code else 0.0
    data_percent = matched_data * 100.0 / total_data if total_data else 0.0
    function_percent = matched_functions * 100.0 / total_functions if total_functions else 0.0
    return {
        "fuzzy_match_percent": code_percent,
        "total_code": str(total_code),
        "matched_code": str(matched_code),
        "matched_code_percent": code_percent,
        "total_data": str(total_data),
        "matched_data": str(matched_data),
        "matched_data_percent": data_percent,
        "total_functions": total_functions,
        "matched_functions": matched_functions,
        "matched_functions_percent": function_percent,
        "complete_code": str(matched_code),
        "complete_code_percent": code_percent,
        "complete_data": str(matched_data),
        "complete_data_percent": data_percent,
        "total_units": total_functions,
        "complete_units": matched_functions,
    }


def contains_instruction_asm(source: str) -> bool:
    """Return whether a C unit violates genuine compiler-generated provenance."""
    text = (ROOT / source).read_text()
    return bool(ANY_C_ASM.search(text)
                or INSTRUCTION_ASM.search(text) or AMBIGUOUS_ASM.search(text)
                or ASSEMBLY_SOURCE_ESCAPE.search(text))


def manifest_ranges(paths: list[Path], suffix: str | None = None,
                    reject_instruction_asm: bool = False) -> list[tuple[int, int, str]]:
    ranges = []
    for path in paths:
        for number, line in enumerate(path.read_text().splitlines(), 1):
            if not line or line.startswith("#"):
                continue
            fields = line.split("\t")
            if len(fields) < 3:
                raise ValueError(f"{path}:{number}: malformed manifest row")
            start, size = int(fields[0], 0), int(fields[1], 0)
            if suffix is not None and not fields[2].endswith(suffix):
                continue
            if reject_instruction_asm and contains_instruction_asm(fields[2]):
                continue
            if size <= 0:
                raise ValueError(f"{path}:{number}: size must be positive")
            ranges.append((start, start + size, fields[2]))
    ranges.sort()
    for left, right in zip(ranges, ranges[1:]):
        if right[0] < left[1]:
            raise ValueError(f"matching ranges overlap at 0x{right[0]:X}")
    return ranges


def loader_functions() -> list[dict[str, object]]:
    functions = []
    for number, line in enumerate(LOADER_MAP.read_text().splitlines()[1:], 2):
        if not line:
            continue
        fields = line.split("\t")
        if len(fields) != 7:
            raise ValueError(f"{LOADER_MAP}:{number}: malformed row")
        if fields[4] not in ("code", "initialized_data"):
            raise ValueError(f"{LOADER_MAP}:{number}: unknown kind {fields[4]}")
        if fields[4] == "code" and int(fields[5]):
            functions.append({
                "name": fields[6],
                "vram": int(fields[2], 0),
                "rom": int(fields[0], 0),
                "size": int(fields[3], 0),
            })
    return functions


def covered(start: int, end: int,
            ranges: list[tuple[int, int, str]]) -> tuple[int, str | None]:
    spans = sorted((max(start, left), min(end, right), source)
                   for left, right, source in ranges if left < end and right > start)
    total = 0
    cursor = start
    source_path = None
    for left, right, source in spans:
        if right <= cursor:
            continue
        left = max(left, cursor)
        total += right - left
        cursor = right
        source_path = source_path or source
    return total, source_path


def catalogue(path: Path, minimum_vram: int | None = None) -> list[dict[str, object]]:
    section = tomllib.loads(path.read_text())["section"][0]
    functions = section["functions"]
    if minimum_vram is not None:
        functions = [function for function in functions
                     if function["vram"] >= minimum_vram]
    return functions


def function_unit(module: str, function: dict[str, object], rom_start: int,
                  ranges: list[tuple[int, int, str]]) -> dict[str, object]:
    size = int(function["size"])
    matched, source = covered(rom_start, rom_start + size, ranges)
    complete = matched == size
    unit_measures = measures(size, matched, 1, int(complete))
    name = str(function["name"])
    return {
        "name": f"{module}/{name}",
        "measures": unit_measures,
        "functions": [{
            "name": name,
            "size": str(size),
            "fuzzy_match_percent": unit_measures["fuzzy_match_percent"],
            "address": str(function["vram"]),
            "metadata": {"virtual_address": str(function["vram"])},
        }],
        "metadata": {
            "complete": complete,
            "source_path": source or f"asm/us/{module}/{name}.s",
            "progress_categories": ["code"],
            "auto_generated": not complete,
        },
    }


def build_report() -> dict[str, object]:
    config = tomllib.loads(CONFIG.read_text())
    image = config["image"]
    progress = config["progress"]
    manifests = [ROOT / path for path in progress["manifests"]]
    ranges = manifest_ranges(manifests, ".c", reject_instruction_asm=True)
    assembly_assisted_ranges = [
        item for item in manifest_ranges(manifests, ".c") if item not in ranges
    ]
    assembly_ranges = manifest_ranges(manifests, ".s")
    overlay_configs = progress.get("overlay_manifests", [])
    loader_paths = progress.get("loader_manifests")
    if loader_paths is None:
        loader_paths = [progress["loader_manifest"]]
    loader_manifest_paths = [ROOT / path for path in loader_paths]
    loader_ranges = manifest_ranges(loader_manifest_paths, ".c",
                                    reject_instruction_asm=True)
    loader_assisted_ranges = [
        item for item in manifest_ranges(loader_manifest_paths, ".c")
        if item not in loader_ranges
    ]
    loader_assembly_ranges = manifest_ranges(loader_manifest_paths, ".s")
    vram_base, rom_base = image["vram"], image["rom"]
    units = []

    resident_functions = catalogue(ROOT / progress["resident_functions"], 0x8000047C)
    for function in resident_functions:
        rom_start = rom_base + int(function["vram"]) - vram_base
        units.append(function_unit("resident", function, rom_start, ranges))

    for overlay in overlay_configs:
        overlay_paths = [ROOT / overlay["path"]]
        if overlay.get("asm_path"):
            overlay_paths.append(ROOT / overlay["asm_path"])
        overlay_ranges = manifest_ranges(overlay_paths, ".c",
                                         reject_instruction_asm=True)
        functions = catalogue(ROOT / overlay["functions"])
        module = overlay["id"]
        for function in functions:
            rom_start = overlay["rom"] + int(function["vram"]) - overlay["vram"]
            units.append(function_unit(module, function, rom_start, overlay_ranges))

    for function in loader_functions():
        units.append(function_unit("boot_loader", function,
                                   int(function["rom"]), loader_ranges))

    matched_code = (sum(end - start for start, end, _source in ranges) +
                    sum(end - start for overlay in overlay_configs
                        for start, end, _source in manifest_ranges(
                            [ROOT / overlay["path"]] +
                            ([ROOT / overlay["asm_path"]]
                             if overlay.get("asm_path") else []), ".c",
                            reject_instruction_asm=True)) +
                    sum(end - start for start, end, _source in loader_ranges))
    assembly_code = (sum(end - start for start, end, _source in assembly_ranges) +
                     sum(end - start for overlay in overlay_configs
                         for start, end, _source in manifest_ranges(
                             [ROOT / overlay["path"]] +
                             ([ROOT / overlay["asm_path"]]
                              if overlay.get("asm_path") else []), ".s")) +
                     sum(end - start for start, end, _source in loader_assembly_ranges))
    assembly_assisted_code = (
        sum(end - start for start, end, _source in assembly_assisted_ranges) +
        sum(end - start for overlay in overlay_configs
            for start, end, _source in manifest_ranges(
                [ROOT / overlay["path"]] +
                ([ROOT / overlay["asm_path"]]
                 if overlay.get("asm_path") else []), ".c")
            if contains_instruction_asm(_source)) +
        sum(end - start for start, end, _source in loader_assisted_ranges)
    )
    total_functions = len(units)
    matched_functions = sum(int(unit["measures"]["complete_units"])
                            for unit in units)
    if total_functions != image["total_functions"]:
        raise ValueError("function catalogues disagree with configured total")
    if matched_functions != progress["matched_functions"]:
        raise ValueError(
            "function catalogues disagree with configured matched count: "
            f"catalogue={matched_functions}, configured={progress['matched_functions']}"
        )
    categories = [
        {
            "id": "code",
            "name": "Decompiled C",
            "measures": measures(image["code_size"], matched_code,
                                 total_functions, matched_functions),
        },
        {
            "id": "assembly_reference",
            "name": "Matching assembly reference coverage",
            "measures": measures(image["code_size"], assembly_code, 0, 0),
        },
        {
            "id": "assembly_assisted_reference",
            "name": "Assembly-assisted C reference coverage",
            "measures": measures(image["code_size"], assembly_assisted_code, 0, 0),
        },
        {
            "id": "program_data",
            "name": "Initialized program data",
            "measures": measures(0, 0, 0, 0, image["data_size"],
                                 progress["matched_data"]),
        },
    ]
    return {
        "measures": measures(image["code_size"], matched_code,
                             total_functions, matched_functions,
                             image["data_size"], progress["matched_data"]),
        "units": units,
        "version": 2,
        "categories": categories,
    }


def build_decomphub_report(report: dict[str, object]) -> dict[str, object]:
    config = tomllib.loads(CONFIG.read_text())
    inventory = config["inventory"]
    totals = report["measures"]
    records = inventory["records"]
    return {
        "format": "decomphub.progress/v1",
        "repository": "https://github.com/TheGh0stShip/Madden-64",
        "tracks": [
            {
                "id": "matching-code",
                "label": "Matching decompiled C code",
                "scope": (
                    "USA Rev 0 (N8ME) loader, resident executable, and both "
                    "executable overlays; only byte-identical code compiled "
                    "from .c sources counts."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": int(totals["matched_code"]),
                    "total": int(totals["total_code"]),
                    "unit": "bytes",
                },
            },
            {
                "id": "assembly-reference",
                "label": "Matching assembly reference coverage",
                "scope": (
                    "Byte-identical .s units retained as disassembly and "
                    "reverse-engineering reference; excluded from C "
                    "decompilation progress."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": int(next(
                        category["measures"]["matched_code"]
                        for category in report["categories"]
                        if category["id"] == "assembly_reference"
                    )),
                    "total": int(totals["total_code"]),
                    "unit": "bytes",
                },
            },
            {
                "id": "assembly-assisted-reference",
                "label": "Assembly-assisted C reference coverage",
                "scope": (
                    "Byte-identical .c units containing instruction-emitting "
                    "inline assembly; excluded from C decompilation progress."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": int(next(
                        category["measures"]["matched_code"]
                        for category in report["categories"]
                        if category["id"] == "assembly_assisted_reference"
                    )),
                    "total": int(totals["total_code"]),
                    "unit": "bytes",
                },
            },
            {
                "id": "initialized-data",
                "label": "Matching initialized program data",
                "scope": (
                    "USA Rev 0 initialized data across the loader, resident "
                    "image, overlays, and overlay data records; only "
                    "byte-identical reconstructed data counts."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": int(totals["matched_data"]),
                    "total": int(totals["total_data"]),
                    "unit": "bytes",
                },
            },
            {
                "id": "matching-functions",
                "label": "C-decompiled function candidates",
                "scope": (
                    "Audited candidate boundaries across the loader, resident "
                    "image, and both executable overlays; a function counts "
                    "only when its complete machine code is reproduced from "
                    "a compiled .c source."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": totals["matched_functions"],
                    "total": totals["total_functions"],
                    "unit": "functions",
                },
            },
            {
                "id": "physical-rom-map",
                "label": "Physical ROM mapping",
                "scope": (
                    "Gap-free USA Rev 0 physical address map covering headers, "
                    "loader, packed program, overlays, archive tables, payloads, "
                    "and padding; this measures inventory coverage only."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": inventory["rom_size"],
                    "total": inventory["rom_size"],
                    "unit": "bytes",
                },
            },
            {
                "id": "archive-record-inventory",
                "label": "Archive record inventory",
                "scope": (
                    "All physical records in the fourteen non-empty USA Rev 0 "
                    "archives have audited table entries, logical lengths, and "
                    "aligned physical extents; this is not asset reconstruction."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": records,
                    "total": records,
                    "unit": "records",
                },
            },
            {
                "id": "physical-content-classification",
                "label": "Physical content classification",
                "scope": (
                    "Every archive record has a format-family classification "
                    "from ROM evidence; classification does not mean its payload "
                    "has been decoded, extracted, or reconstructed."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": records,
                    "total": records,
                    "unit": "records",
                },
            },
            {
                "id": "archive-payload-extraction",
                "label": "Lossless expanded archive payload extraction",
                "scope": (
                    "Every physical archive record is stripped of alignment, "
                    "expanded with the audited type-1 LZ decoder where needed, "
                    "and covered by stored and expanded SHA-256 provenance; "
                    "this does not claim semantic container reconstruction."
                ),
                "measurement": {
                    "kind": "ratio",
                    "completed": inventory["expanded_payload_bytes"],
                    "total": inventory["expanded_payload_bytes"],
                    "unit": "bytes",
                },
            },
            {
                "id": "asset-reconstruction",
                "label": "Asset reconstruction",
                "scope": (
                    "Reconstruction of the inventoried texture, JPEG, model, "
                    "motion, sprite, audio, auxiliary graphics, gameplay-table, "
                    "and roster payloads; no completion denominator is established."
                ),
                "measurement": None,
            },
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=ROOT / "build/report.json")
    parser.add_argument("--decomphub-output", type=Path,
                        default=DECOMPHUB_REPORT)
    args = parser.parse_args()
    report = build_report()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n")
    decomphub_report = build_decomphub_report(report)
    args.decomphub_output.parent.mkdir(parents=True, exist_ok=True)
    args.decomphub_output.write_text(json.dumps(decomphub_report, indent=2) + "\n")
    totals = report["measures"]
    print(f"wrote {args.output}: {totals['matched_code']} / {totals['total_code']} code bytes")
    print(f"wrote {args.decomphub_output}: {len(decomphub_report['tracks'])} scoped tracks")


if __name__ == "__main__":
    main()
