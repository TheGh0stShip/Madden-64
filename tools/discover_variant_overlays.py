#!/usr/bin/env python3
"""Discover functions in the two mixed code/data alternate overlay records.

The normal entry-point-driven scan cannot start these records because each begins
with initialized data. Seed every stack-frame prologue and in-range JAL target,
then let n64dk's strict CFG walker reject non-code hits and recover intervening
leaf functions. Outputs are provisional research catalogues, not matching credit.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from types import SimpleNamespace


ROOT = Path(__file__).resolve().parents[1]
RECORDS = ROOT / "build/us/extracted_records/archive_00"
VARIANTS = {
    2: (RECORDS / "record_0002.overlay-data.bin", 0x8008B8E0, 0x31FE8),
    5: (RECORDS / "record_0005.overlay-data.bin", 0x800C5F48, 0x1E56C),
}


def discover(number: int, n64dk_root: Path) -> None:
    sys.path.insert(0, str(n64dk_root))
    from n64dk.analysis import functions as fn

    path, base, code_size = VARIANTS[number]
    image = fn.Image(path.read_bytes()[:code_size], base)
    analyser = fn.Analyser(image, base, text_hint_end=image.end, text_lo=base)

    seeds = set(analyser.jal_targets)
    seeds.update(pc for pc in range(base, image.end, 4) if analyser.is_prologue(pc))
    for pc in sorted(seeds):
        if base <= pc < image.end:
            analyser.add(pc, "sweep")
    analyser.grow()

    refs = analyser.code_refs()
    data_hits = {
        ref.address for ref in refs
        if ref.kind in ("load", "store") and base <= ref.address < image.end
    }
    analyser.sweep_gaps(data_hits)
    analyser.grow()
    analyser.data_regions = []
    analyser.sweep_gaps(data_hits)

    info = SimpleNamespace(entry=base, main_vram=base, main_rom=0x1000)
    catalogue = fn._assemble(analyser, info, image, image.end)
    out = ROOT / f"build/us/audit/overlay_{number}_functions"
    out.mkdir(parents=True, exist_ok=True)
    (out / "functions.toml").write_text(
        fn.to_toml(catalogue, f"Madden 64 alternate overlay {number}")
    )
    (out / "symbol_addrs.txt").write_text(fn.to_symbol_addrs(catalogue))
    (out / "jump_tables.tsv").write_text(fn.to_jump_tables_tsv(catalogue))
    report = fn.summary(catalogue)
    report["initial_seeds"] = len(seeds)
    (out / "summary.json").write_text(json.dumps(report, indent=2) + "\n")
    print(
        f"overlay_{number}: {len(catalogue.functions)} candidates, "
        f"{sum(item.size for item in catalogue.functions)} catalogued bytes, "
        f"{len(catalogue.data_regions)} data spans"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--n64dk", default="/home/steve/projects/n64-decomp-kit",
        type=Path,
    )
    args = parser.parse_args()
    for number in VARIANTS:
        discover(number, args.n64dk)


if __name__ == "__main__":
    main()
