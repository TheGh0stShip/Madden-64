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


def loader_totals() -> tuple[int, int, int]:
    code = data = functions = 0
    for number, line in enumerate(LOADER_MAP.read_text().splitlines()[1:], 2):
        if not line:
            continue
        fields = line.split("\t")
        if len(fields) != 7:
            raise ValueError(f"{LOADER_MAP}:{number}: malformed row")
        size = int(fields[3], 0)
        if fields[4] == "code":
            code += size
            functions += int(fields[5])
        elif fields[4] == "initialized_data":
            data += size
        else:
            raise ValueError(f"{LOADER_MAP}:{number}: unknown kind {fields[4]}")
    return code, data, functions


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


def build_report() -> dict[str, object]:
    config = tomllib.loads(CONFIG.read_text())
    image = config["image"]
    progress = config["progress"]
    inventory = config["inventory"]
    manifests = [ROOT / path for path in progress["manifests"]]
    ranges = manifest_ranges(manifests)
    overlay_configs = progress.get("overlay_manifests", [])
    loader_code, loader_data, loader_functions = loader_totals()
    loader_ranges = manifest_ranges([ROOT / progress["loader_manifest"]])
    vram_base, rom_base = image["vram"], image["rom"]
    code_end = rom_base + image["code_size"]
    libultra_start = rom_base + image["libultra_vram"] - vram_base
    category_totals = {
        "game": [266100, 0, 0],
        "libultra": [127188, 0, 0],
    }
    units = []

    for start, end, source in ranges:
        size = end - start
        vram = vram_base + start - rom_base
        category = "libultra" if vram >= image["libultra_vram"] else "game"
        name = Path(source).stem
        unit_measures = measures(size, size, 1, 1)
        units.append({
            "name": name,
            "measures": unit_measures,
            "functions": [{
                "name": name,
                "size": str(size),
                "fuzzy_match_percent": 100.0,
                "address": str(vram),
                "metadata": {"virtual_address": str(vram)},
            }],
            "metadata": {
                "complete": True,
                "source_path": source,
                "progress_categories": ["code"],
                "auto_generated": False,
            },
        })
        totals = category_totals[category]
        totals[1] += size
        totals[2] += 1

    overlay_matched = 0
    overlay_functions = 0
    for overlay in overlay_configs:
        overlay_ranges = manifest_ranges([ROOT / overlay["path"]])
        overlay_functions += overlay["functions"]
        for start, end, source in overlay_ranges:
            size = end - start
            vram = overlay["vram"] + start - overlay["rom"]
            name = Path(source).stem
            units.append({
                "name": name,
                "measures": measures(size, size, 1, 1),
                "functions": [{
                    "name": name,
                    "size": str(size),
                    "fuzzy_match_percent": 100.0,
                    "address": str(vram),
                    "metadata": {"virtual_address": str(vram)},
                }],
                "metadata": {
                    "complete": True,
                    "source_path": source,
                    "progress_categories": ["code"],
                    "auto_generated": False,
                },
            })
            overlay_matched += size

    loader_matched = 0
    for start, end, source in loader_ranges:
        size = end - start
        vram = 0x80200400 + start - 0x1000
        name = Path(source).stem
        units.append({
            "name": name,
            "measures": measures(size, size, 1, 1),
            "functions": [{
                "name": name,
                "size": str(size),
                "fuzzy_match_percent": 100.0,
                "address": str(vram),
                "metadata": {"virtual_address": str(vram)},
            }],
            "metadata": {
                "complete": True,
                "source_path": source,
                "progress_categories": ["code"],
                "auto_generated": False,
            },
        })
        loader_matched += size

    matched_code = (sum(end - start for start, end, _source in ranges) +
                    overlay_matched + loader_matched)
    matched_functions = progress["matched_functions"]
    matched_unit_functions = len(units)
    grouped_function_credit = matched_functions - matched_unit_functions
    if grouped_function_credit < 0:
        raise ValueError("matching units exceed the reviewed matched-function count")
    if grouped_function_credit:
        units.append({
            "name": "verified_functions_in_grouped_sources",
            "measures": measures(0, 0, grouped_function_credit,
                                 grouped_function_credit),
            "functions": [],
            "metadata": {
                "complete": True,
                "source_path": "config/us/progress.toml",
                "progress_categories": ["code"],
                "auto_generated": False,
            },
        })

    module_progress = (
        ("resident_unmatched", 393288,
         sum(end - start for start, end, _source in ranges),
         1373, matched_functions - len(loader_ranges) - overlay_functions),
        ("boot_loader_unmatched", loader_code, loader_matched,
         loader_functions, len(loader_ranges)),
        ("overlay_1_unmatched", 226784,
         sum(end - start for start, end, _source in
             manifest_ranges([ROOT / overlay_configs[0]["path"]])),
         590, overlay_configs[0]["functions"]),
        ("overlay_4_unmatched", 132704,
         sum(end - start for start, end, _source in
             manifest_ranges([ROOT / overlay_configs[1]["path"]])),
         311, overlay_configs[1]["functions"]),
    )
    for name, total_code, complete_code, total_functions, complete_functions in module_progress:
        unmatched_code = total_code - complete_code
        unmatched_functions = total_functions - complete_functions
        if unmatched_code < 0 or unmatched_functions < 0:
            raise ValueError(f"{name}: matched progress exceeds audited scope")
        units.append({
            "name": name,
            "measures": measures(unmatched_code, 0, unmatched_functions, 0),
            "functions": [],
            "metadata": {
                "complete": False,
                "source_path": f"asm/us/{name}.s",
                "progress_categories": ["code"],
                "auto_generated": True,
            },
        })

    if sum(int(unit["measures"]["total_code"]) for unit in units) != image["code_size"]:
        raise ValueError("report units do not cover the audited executable-byte total")
    if sum(unit["measures"]["total_functions"] for unit in units) != image["total_functions"]:
        raise ValueError("report units do not cover the audited function-candidate total")
    categories = [
        {
            "id": "code",
            "name": "Program code",
            "measures": measures(image["code_size"], matched_code,
                                 image["total_functions"], matched_functions),
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
                             image["total_functions"], matched_functions,
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
