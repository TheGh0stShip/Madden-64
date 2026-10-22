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
    image: Path


MODULES = (
    Module("overlay1", ROOT / "config/us/functions_overlay1.toml",
           ROOT / "config/us/overlay1_boundary_findings.tsv",
           ROOT / "config/us/matching_overlay1_kmc_units.tsv",
           ROOT / "build/us/audit/overlay_1.z64"),
    Module("overlay4", ROOT / "config/us/functions_overlay4.toml",
           ROOT / "config/us/overlay4_boundary_findings.tsv",
           ROOT / "config/us/matching_overlay4_kmc_units.tsv",
           ROOT / "build/us/audit/overlay_4.z64"),
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


def has_closed_predecessor(image: bytes, offset: int) -> bool:
    """Return whether the preceding instruction pair cannot fall through.

    MIPS jumps and returns execute the following delay-slot instruction.  A
    catalogue start immediately after a call or ordinary instruction is an
    internal continuation, even if an earlier boundary sweep did not flag it.
    Requiring an unconditional jump or ``jr`` before the delay slot is a
    deliberately conservative quick-win filter.
    """
    if offset == 0x1000:
        return True
    if offset < 0x1008 or offset > len(image):
        return False
    word = int.from_bytes(image[offset - 8:offset - 4], "big")
    opcode = word >> 26
    if opcode == 2:  # j target
        return True
    return opcode == 0 and (word & 0x3F) == 8  # jr register


def has_complete_exit(image: bytes, offset: int, size: int) -> bool:
    """Require a conventional standalone return before the delay slot.

    Direct jumps are frequently switch arms or branches to shared epilogues in
    these catalogues.  They remain useful reverse-engineering labels, but are
    too ambiguous for the conservative C quick-win queue.
    """
    if size < 8 or offset + size > len(image):
        return False
    word = int.from_bytes(image[offset + size - 8:offset + size - 4], "big")
    opcode = word >> 26
    return opcode == 0 and (word & 0x3F) == 8


def uses_saved_context(image: bytes, offset: int, size: int) -> bool:
    """Detect fragments that depend on a containing function's saved state.

    Tiny standalone leaves do not use ``s0``-``s7``, ``fp`` or ``sp`` without
    their own save/restore frame.  Treating any occurrence as disqualifying is
    conservative and removes switch arms and shared internal continuations.
    """
    saved = set(range(16, 24)) | {29, 30}
    for cursor in range(offset, offset + size, 4):
        word = int.from_bytes(image[cursor:cursor + 4], "big")
        opcode = word >> 26
        if opcode in (2, 3):
            continue
        registers = {(word >> 21) & 0x1F, (word >> 16) & 0x1F}
        if opcode == 0:
            registers.add((word >> 11) & 0x1F)
        if registers & saved:
            return True
    return False


def rank_module(module: Module, maximum_size: int = 0x100) -> list[dict]:
    document = tomllib.loads(module.catalogue.read_text())
    section = document["section"][0]
    base_vram = section["vram"]
    base_rom = section["rom"]
    matched = matched_ranges(module.manifest)
    rejected = rejected_starts(module.findings)
    image = module.image.read_bytes()
    rows = []
    for function in section["functions"]:
        vram = function["vram"]
        size = function["size"]
        rom = base_rom + vram - base_vram
        if any(start <= rom and rom + size <= end for start, end in matched):
            continue
        if (vram in rejected or size > maximum_size or
                not has_closed_predecessor(image, rom) or
                not has_complete_exit(image, rom, size) or
                uses_saved_context(image, rom, size)):
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
