#!/usr/bin/env python3
"""Rank credible unmatched overlay functions for byte-matching work.

The boundary catalogues intentionally contain provisional entries.  This tool
joins them to the retained boundary findings and removes starts contradicted by
control-flow evidence before sorting the remaining functions by size.
"""

from __future__ import annotations

import argparse
import csv
import tomllib
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DISQUALIFYING_KINDS = {
    "falls_through",
    "interior_alias",
    "junk_start",
    "late_start",
    "rejected_start",
    "start_in_delay_slot",
}


@dataclass(frozen=True)
class Module:
    name: str
    catalogue: Path
    findings: Path
    manifest: Path


MODULES = (
    Module("overlay1", ROOT / "config/us/functions_overlay1.toml",
           ROOT / "config/us/overlay1_boundary_findings.tsv",
           ROOT / "config/us/matching_overlay1_kmc_units.tsv"),
    Module("overlay4", ROOT / "config/us/functions_overlay4.toml",
           ROOT / "config/us/overlay4_boundary_findings.tsv",
           ROOT / "config/us/matching_overlay4_kmc_units.tsv"),
)


def matched_ranges(path: Path) -> list[tuple[int, int]]:
    ranges = []
    for line in path.read_text().splitlines():
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t", 2)
        start = int(fields[0], 0)
        ranges.append((start, start + int(fields[1], 0)))
    return ranges


def rejected_starts(path: Path) -> dict[int, set[str]]:
    rejected: dict[int, set[str]] = {}
    with path.open(newline="") as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            if row["kind"] not in DISQUALIFYING_KINDS:
                continue
            values = [row["address"]]
            if row["function"]:
                values.append(row["function"])
            for value in values:
                rejected.setdefault(int(value, 0), set()).add(row["kind"])
    return rejected


def rank_module(module: Module, maximum_size: int = 0x100) -> list[dict]:
    document = tomllib.loads(module.catalogue.read_text())
    section = document["section"][0]
    base_vram = section["vram"]
    base_rom = section["rom"]
    matched = matched_ranges(module.manifest)
    rejected = rejected_starts(module.findings)
    rows = []
    for function in section["functions"]:
        vram = function["vram"]
        size = function["size"]
        rom = base_rom + vram - base_vram
        if any(start <= rom and rom + size <= end for start, end in matched):
            continue
        if vram in rejected or size > maximum_size:
            continue
        rows.append({"module": module.name, "vram": vram, "rom": rom,
                     "size": size, "name": function["name"]})
    return sorted(rows, key=lambda row: (row["size"], row["vram"]))


def ranked_candidates(maximum_size: int = 0x100) -> list[dict]:
    rows = []
    for module in MODULES:
        rows.extend(rank_module(module, maximum_size))
    return sorted(rows, key=lambda row: (row["size"], row["module"], row["vram"]))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--maximum-size", type=lambda value: int(value, 0),
                        default=0x100)
    parser.add_argument("--limit", type=int, default=50)
    args = parser.parse_args()
    print("module\tvram\trom\tsize\tname")
    for row in ranked_candidates(args.maximum_size)[:args.limit]:
        print(f'{row["module"]}\t0x{row["vram"]:08X}\t0x{row["rom"]:X}\t'
              f'0x{row["size"]:X}\t{row["name"]}')
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
