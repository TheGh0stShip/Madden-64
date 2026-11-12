#!/usr/bin/env python3
"""Materialize the top ranked GPU proposals for the authoritative CPU matcher."""
from __future__ import annotations

import argparse
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("ranked", type=Path)
    parser.add_argument("out", type=Path)
    parser.add_argument("--count", type=int, default=512)
    parser.add_argument("--vram", required=True)
    parser.add_argument("--size", required=True)
    args = parser.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)
    manifest = []
    selected = []
    with args.ranked.open() as stream:
        for line in stream:
            if len(selected) >= args.count:
                break
            row = json.loads(line)
            selected.append(row)
    for index, row in enumerate(selected):
        name = f"candidate_{index:04d}_{row['id'][:12]}.c"
        header = "".join(
            f"/* LDSYM {symbol}=0x{int(address):08X} */\n"
            for symbol, address in sorted(row.get("symbols", {}).items()))
        (args.out / name).write_text(header + row["source"] + "\n")
        source_path = (args.out / name).as_posix()
        manifest.append("\t".join((source_path, args.vram, args.size)) + "\n")
    (args.out / "candidates.tsv").write_text("# KMC GPU-ranked candidate pool\n" + "".join(manifest))
    (args.out / "selected.jsonl").write_text(
        "".join(json.dumps(row, sort_keys=True) + "\n" for row in selected))
    print(json.dumps({"selected": len(selected), "manifest": str(args.out / 'candidates.tsv')}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
