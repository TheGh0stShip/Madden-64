#!/usr/bin/env python3
"""Generate deterministic residual-router examples from exact-C text.

Each mutation changes one compiler-visible dimension while retaining the exact
text as the target.  These examples bootstrap routing; real failed compiler
candidates can be appended using the same JSONL contract and retrained.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import random
import struct
from pathlib import Path


def words(blob: bytes) -> list[int]:
    return list(struct.unpack(f">{len(blob)//4}I", blob))


def pack(items: list[int]) -> bytes:
    return struct.pack(f">{len(items)}I", *items)


def mutations(blob: bytes, seed: int) -> list[tuple[str, bytes]]:
    source = words(blob)
    if len(source) < 2:
        return []
    rng = random.Random(seed)
    index = rng.randrange(len(source))
    result = []
    register = source.copy()
    register[index] ^= 1 << rng.choice((11, 16, 21))
    result.append(("declaration-lifetime", pack(register)))
    immediate = source.copy()
    immediate[index] ^= 1 << rng.randrange(16)
    result.append(("type-cast-constant", pack(immediate)))
    if len(source) >= 3:
        order = source.copy(); swap = rng.randrange(len(source) - 1)
        order[swap], order[swap + 1] = order[swap + 1], order[swap]
        result.append(("statement-order-scheduling", pack(order)))
    control = source.copy()
    branch_indices = [i for i, word in enumerate(source)
                      if word >> 26 in (1, 4, 5, 6, 7, 0x14, 0x15)]
    bi = rng.choice(branch_indices) if branch_indices else index
    control[bi] ^= 1 << 26
    result.append(("control-flow-loop-form", pack(control)))
    result.append(("frame-size-dead-local", pack(source + [0])))
    return result


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("corpus", type=Path)
    ap.add_argument("output", type=Path)
    ap.add_argument("blobs", type=Path)
    ap.add_argument("--limit", type=int, default=2000)
    ap.add_argument("--seed", type=int, default=20261113)
    args = ap.parse_args()
    rows = [json.loads(line) for line in args.corpus.read_text().splitlines() if line.strip()]
    args.blobs.mkdir(parents=True, exist_ok=True); emitted = []
    for ordinal, row in enumerate(rows[:args.limit]):
        target = (args.corpus.parent / row["text_path"]).resolve()
        blob = target.read_bytes()
        for family, candidate in mutations(blob, args.seed + ordinal):
            digest = hashlib.sha256(candidate).hexdigest()
            candidate_path = args.blobs / f"{digest}.bin"
            if not candidate_path.exists():
                candidate_path.write_bytes(candidate)
            emitted.append({"target": str(target), "candidate": str(candidate_path.resolve()),
                            "mutation_family": family, "source_project": row["project"],
                            "source_function": row["function"], "synthetic": True})
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in emitted))
    print(json.dumps({"exact_functions": min(len(rows), args.limit), "examples": len(emitted),
                      "families": sorted({row['mutation_family'] for row in emitted})}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
