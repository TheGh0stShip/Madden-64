#!/usr/bin/env python3
"""Generate the objdiff v2 progress report used by public trackers."""

from __future__ import annotations

import argparse
import json
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / "config/us/progress.toml"
LOADER_MAP = ROOT / "config/us/loader_map.tsv"


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


def manifest_ranges(paths: list[Path]) -> list[tuple[int, int, str]]:
    ranges = []
    for path in paths:
        for number, line in enumerate(path.read_text().splitlines(), 1):
            if not line or line.startswith("#"):
                continue
            fields = line.split("\t")
            if len(fields) < 3:
                raise ValueError(f"{path}:{number}: malformed manifest row")
            start, size = int(fields[0], 0), int(fields[1], 0)
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
    ranges = manifest_ranges(manifests)
    overlay_configs = progress.get("overlay_manifests", [])
    loader_ranges = manifest_ranges([ROOT / progress["loader_manifest"]])
    vram_base, rom_base = image["vram"], image["rom"]
    units = []

    resident_functions = catalogue(ROOT / progress["resident_functions"], 0x8000047C)
    for function in resident_functions:
        rom_start = rom_base + int(function["vram"]) - vram_base
        units.append(function_unit("resident", function, rom_start, ranges))

    for overlay in overlay_configs:
        overlay_ranges = manifest_ranges([ROOT / overlay["path"]])
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
                        for start, end, _source in
                        manifest_ranges([ROOT / overlay["path"]])) +
                    sum(end - start for start, end, _source in loader_ranges))
    total_functions = len(units)
    matched_functions = sum(int(unit["measures"]["complete_units"])
                            for unit in units)
    if total_functions != image["total_functions"]:
        raise ValueError("function catalogues disagree with configured total")
    if matched_functions != progress["matched_functions"]:
        raise ValueError("function catalogues disagree with configured matched count")
    categories = [
        {
            "id": "code",
            "name": "Program code",
            "measures": measures(image["code_size"], matched_code,
                                 total_functions, matched_functions),
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


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=ROOT / "build/report.json")
    args = parser.parse_args()
    report = build_report()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n")
    totals = report["measures"]
    print(f"wrote {args.output}: {totals['matched_code']} / {totals['total_code']} code bytes")


if __name__ == "__main__":
    main()
