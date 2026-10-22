#!/usr/bin/env python3
"""Generate the objdiff v2 progress report used by public trackers."""

from __future__ import annotations

import argparse
import json
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / "config/us/progress.toml"


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
    manifests = [ROOT / path for path in progress["manifests"]]
    ranges = manifest_ranges(manifests)
    vram_base, rom_base = image["vram"], image["rom"]
    code_end = rom_base + image["code_size"]
    libultra_start = rom_base + image["libultra_vram"] - vram_base
    category_totals = {
        "game": [libultra_start - rom_base, 0, 0],
        "libultra": [code_end - libultra_start, 0, 0],
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
                "progress_categories": [category],
                "auto_generated": False,
            },
        })
        totals = category_totals[category]
        totals[1] += size
        totals[2] += 1

    matched_code = sum(end - start for start, end, _source in ranges)
    matched_functions = len(ranges)
    categories = []
    for category_id, name in (("game", "Game code"), ("libultra", "libultra")):
        total, matched, count = category_totals[category_id]
        categories.append({
            "id": category_id,
            "name": name,
            "measures": measures(total, matched, count, count),
        })
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
