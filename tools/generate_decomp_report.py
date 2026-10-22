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
                "progress_categories": [category],
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
                    "progress_categories": ["overlays"],
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
                "progress_categories": ["boot_loader"],
                "auto_generated": False,
            },
        })
        loader_matched += size

    matched_code = (sum(end - start for start, end, _source in ranges) +
                    overlay_matched + loader_matched)
    matched_functions = progress["matched_functions"]
    categories = []
    for category_id, name in (("game", "Game code"), ("libultra", "libultra")):
        total, matched, count = category_totals[category_id]
        categories.append({
            "id": category_id,
            "name": "Resident " + name.lower(),
            "measures": measures(total, matched, 0, 0),
        })
    categories.extend([
        {
            "id": "boot_loader",
            "name": "Boot-loader code",
            "measures": measures(loader_code, loader_matched, loader_functions,
                                 len(loader_ranges),
                                 loader_data, 0),
        },
        {
            "id": "overlays",
            "name": "Executable overlay code",
            "measures": measures(359488, overlay_matched, 901, overlay_functions),
        },
        {
            "id": "initialized_data",
            "name": "Whole-program initialized data",
            "measures": measures(0, 0, 0, 0,
                                 image["data_size"], progress["matched_data"]),
        },
        {
            "id": "rom_inventory",
            "name": "Physical ROM inventory",
            "measures": measures(0, 0, inventory["records"], inventory["records"]),
        },
        {
            "id": "inventory_audio",
            "name": "Inventory: audio streams",
            "measures": measures(0, 0, inventory["audio_records"], inventory["audio_records"],
                                 inventory["audio_bytes"], inventory["audio_bytes"]),
        },
        {
            "id": "inventory_images",
            "name": "Inventory: JPEG images",
            "measures": measures(0, 0, inventory["jpeg_records"], inventory["jpeg_records"],
                                 inventory["jpeg_bytes"], inventory["jpeg_bytes"]),
        },
        {
            "id": "inventory_textures",
            "name": "Inventory: canonical textures",
            "measures": measures(0, 0, inventory["texture_records"], inventory["texture_records"],
                                 inventory["texture_bytes"], inventory["texture_bytes"]),
        },
        {
            "id": "inventory_models",
            "name": "Inventory: TNMF models",
            "measures": measures(0, 0, inventory["model_records"], inventory["model_records"],
                                 inventory["model_bytes"], inventory["model_bytes"]),
        },
        {
            "id": "inventory_animations",
            "name": "Inventory: TMot animations",
            "measures": measures(0, 0, inventory["animation_records"], inventory["animation_records"],
                                 inventory["animation_bytes"], inventory["animation_bytes"]),
        },
        {
            "id": "inventory_sprites",
            "name": "Inventory: TSpr sprites",
            "measures": measures(0, 0, inventory["sprite_records"], inventory["sprite_records"],
                                 inventory["sprite_bytes"], inventory["sprite_bytes"]),
        },
        {
            "id": "inventory_graphics_auxiliary",
            "name": "Inventory: auxiliary graphics records",
            "measures": measures(0, 0, inventory["graphics_auxiliary_records"],
                                 inventory["graphics_auxiliary_records"],
                                 inventory["graphics_auxiliary_bytes"],
                                 inventory["graphics_auxiliary_bytes"]),
        },
        {
            "id": "inventory_game_data",
            "name": "Inventory: gameplay and roster databases",
            "measures": measures(0, 0,
                                 inventory["gameplay_table_records"] +
                                 inventory["roster_database_records"],
                                 inventory["gameplay_table_records"] +
                                 inventory["roster_database_records"],
                                 inventory["gameplay_table_bytes"] +
                                 inventory["roster_database_bytes"],
                                 inventory["gameplay_table_bytes"] +
                                 inventory["roster_database_bytes"]),
        },
        {
            "id": "rom_mapping",
            "name": "Physical ROM byte mapping",
            "measures": measures(0, 0, 0, 0,
                                 inventory["rom_size"], inventory["rom_size"]),
        },
    ])
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
