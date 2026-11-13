#!/usr/bin/env python3
"""Rank large pools of compiled MIPS candidates on CUDA.

Input JSONL rows contain ``path`` plus arbitrary provenance fields.  Candidate
files are raw relocated .text bytes.  The output preserves provenance and adds
bit/byte/word distances and coarse MIPS residual classes useful for routing the
next source mutation.  Compilation remains CPU-side and exact matches still
require the project's independent matcher/gates.
"""
from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path

def words(blob: bytes) -> list[int]:
    return list(struct.unpack(f">{len(blob) // 4}I", blob[:len(blob) // 4 * 4]))


def residual_classes(target: bytes, candidate: bytes) -> dict[str, int]:
    out = {"opcode": 0, "register": 0, "immediate": 0, "other": 0}
    for a, b in zip(words(target), words(candidate)):
        if a == b:
            continue
        if (a >> 26) != (b >> 26):
            out["opcode"] += 1
        elif (a & 0xFC00003F) == (b & 0xFC00003F):
            out["register"] += 1
        elif (a & 0xFFFF0000) == (b & 0xFFFF0000):
            out["immediate"] += 1
        else:
            out["other"] += 1
    out["length_bytes"] = abs(len(target) - len(candidate))
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("target", type=Path)
    ap.add_argument("candidates", type=Path, help="JSONL rows with a path field")
    ap.add_argument("output", type=Path)
    ap.add_argument("--batch", type=int, default=65536)
    ap.add_argument("--limit", type=int, default=1024)
    args = ap.parse_args()
    try:
        import torch
    except ImportError as exc:
        raise SystemExit("PyTorch is required; run this on Desktop") from exc
    if not torch.cuda.is_available():
        raise SystemExit("CUDA is required; run on Desktop")
    target = args.target.read_bytes()
    rows = [json.loads(line) for line in args.candidates.read_text().splitlines() if line.strip()]
    pop = torch.tensor([i.bit_count() for i in range(256)], dtype=torch.int16, device="cuda")
    t = torch.tensor(list(target), dtype=torch.uint8, device="cuda")
    ranked: list[tuple[int, int, int, dict, bytes]] = []
    for start in range(0, len(rows), args.batch):
        chunk = rows[start:start + args.batch]
        blobs = [Path(r["path"]).read_bytes() for r in chunk]
        width = max([len(target), *(len(b) for b in blobs)])
        matrix = torch.zeros((len(blobs), width), dtype=torch.uint8, device="cuda")
        present = torch.zeros((len(blobs), width), dtype=torch.bool, device="cuda")
        for i, blob in enumerate(blobs):
            matrix[i, :len(blob)] = torch.tensor(list(blob), dtype=torch.uint8, device="cuda")
            present[i, :len(blob)] = True
        padded_target = torch.zeros(width, dtype=torch.uint8, device="cuda")
        padded_target[:len(target)] = t
        xor = torch.bitwise_xor(matrix, padded_target)
        byte_diff = ((xor != 0) | ~present).sum(dim=1)
        bit_diff = pop[xor.long()].sum(dim=1) + (~present).sum(dim=1) * 8
        word_diff = ((xor.reshape(len(blobs), -1, 4) != 0).any(dim=2).sum(dim=1)
                     if width % 4 == 0 else byte_diff)
        for r, blob, bd, bits, wd in zip(chunk, blobs, byte_diff.cpu().tolist(),
                                         bit_diff.cpu().tolist(), word_diff.cpu().tolist()):
            ranked.append((bd, bits, wd, r, blob))
    ranked.sort(key=lambda x: x[:3])
    with args.output.open("w") as f:
        for bd, bits, wd, row, blob in ranked[:args.limit]:
            result = dict(row)
            result.update(exact=bd == 0 and len(blob) == len(target), byte_diff=bd,
                          bit_diff=bits, word_diff=wd,
                          residual=residual_classes(target, blob))
            f.write(json.dumps(result, sort_keys=True) + "\n")
    print(json.dumps({"device": "cuda", "candidates": len(rows),
                      "retained": min(args.limit, len(rows)),
                      "best_byte_diff": ranked[0][0] if ranked else None}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
