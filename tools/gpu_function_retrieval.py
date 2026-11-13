#!/usr/bin/env python3
"""Retrieve exact-C donor functions for unfinished MIPS functions on CUDA.

This is a research aid, not a matching oracle.  It hashes opcode/funct sequence
shingles and coarse control-flow/size features, then performs a GPU cosine
search from every unfinished function to the exact-C donor corpus.  Suggested
sources still require provenance review, genuine-C adaptation, compilation,
and byte-exact matching.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import struct
from pathlib import Path


BUCKETS = 1 << 14


def stable_hash(value: str, buckets: int = BUCKETS) -> int:
    return int.from_bytes(hashlib.blake2s(value.encode(), digest_size=8).digest(),
                          "little") % buckets


def operation(word: int) -> int:
    opcode = word >> 26
    if opcode == 0:
        return (opcode << 6) | (word & 0x3F)
    if opcode == 1:
        return (opcode << 6) | ((word >> 16) & 0x1F)
    return opcode << 6


def feature_indices(blob: bytes, buckets: int = BUCKETS) -> dict[int, float]:
    if len(blob) % 4:
        raise ValueError("MIPS function size is not word aligned")
    words = struct.unpack(f">{len(blob) // 4}I", blob)
    ops = [operation(word) for word in words]
    values: dict[int, float] = {}

    def add(name: str, weight: float = 1.0) -> None:
        index = stable_hash(name, buckets)
        values[index] = values.get(index, 0.0) + weight

    add(f"size-log:{int(math.log2(max(1, len(words))))}", 3.0)
    add(f"size-16:{min(255, len(words) // 4)}", 2.0)
    for n, weight in ((1, 1.0), (2, 1.5), (3, 2.0), (4, 2.5)):
        for index in range(max(0, len(ops) - n + 1)):
            add(f"op{n}:" + ",".join(map(str, ops[index:index + n])), weight)
    for index, op in enumerate(ops[:24]):
        add(f"prefix:{index}:{op}", 1.5)
    calls = sum((word >> 26) == 3 or
                ((word >> 26) == 0 and (word & 0x3F) == 9) for word in words)
    branches = sum((word >> 26) in (1, 4, 5, 6, 7, 0x14, 0x15)
                   for word in words)
    add(f"calls:{min(calls, 31)}", 2.0)
    add(f"branches:{min(branches, 63)}", 2.0)
    return values


def load_blobs(root: Path, catalog: dict) -> list[tuple[dict, bytes]]:
    images = {
        "resident": root / "build/us/main_unpacked.z64",
        "overlay_1": root / "build/us/audit/overlay_1.z64",
        "overlay_2": root / "build/us/audit/overlay_2.z64",
        "overlay_4": root / "build/us/audit/overlay_4.z64",
        "overlay_5": root / "build/us/audit/overlay_5.z64",
        "boot_loader": root / "Madden Football 64 (USA).z64",
    }
    cache = {name: path.read_bytes() for name, path in images.items()}
    result = []
    for entry in catalog["entries"]:
        start, size = int(entry["image_offset"], 0), int(entry["size"])
        blob = cache[entry["module"]][start:start + size]
        if len(blob) != size:
            raise ValueError(f"short image slice for {entry['module']}:{entry['name']}")
        result.append((entry, blob))
    return result


def retrieve(root: Path, catalog_path: Path, output: Path,
             neighbors: int = 20) -> dict:
    try:
        import torch
    except ImportError as exc:
        raise SystemExit("PyTorch is required; run on the Desktop GPU") from exc
    catalog = json.loads(catalog_path.read_text())
    rows = load_blobs(root, catalog)
    donors = [(entry, blob) for entry, blob in rows if entry["matched"]]
    queries = [(entry, blob) for entry, blob in rows if not entry["matched"]]
    if not donors or not queries:
        raise SystemExit("catalog needs both exact-C donors and unfinished queries")
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    def matrix(items):
        tensor = torch.zeros((len(items), BUCKETS), dtype=torch.float32,
                             device=device)
        for row, (_, blob) in enumerate(items):
            features = feature_indices(blob)
            cols = list(features)
            tensor[row, cols] = torch.tensor(list(features.values()), device=device)
        return torch.nn.functional.normalize(tensor, dim=1)

    donor_matrix = matrix(donors)
    k = min(max(1, neighbors), len(donors))
    output_rows = []
    # Chunk queries so the dense feature matrix and similarity matrix remain
    # comfortably inside an 8 GiB RTX 2070.
    for start in range(0, len(queries), 256):
        chunk = queries[start:start + 256]
        similarities = matrix(chunk) @ donor_matrix.T
        # Penalize gross size differences without erasing useful structural
        # similarity between sibling functions.
        query_sizes = torch.tensor([len(blob) for _, blob in chunk],
                                   dtype=torch.float32, device=device)[:, None]
        donor_sizes = torch.tensor([len(blob) for _, blob in donors],
                                   dtype=torch.float32, device=device)[None, :]
        similarities -= 0.20 * torch.abs(torch.log2(query_sizes / donor_sizes))
        scores, indices = torch.topk(similarities, k=k, dim=1)
        for (entry, _), row_scores, row_indices in zip(
                chunk, scores.cpu().tolist(), indices.cpu().tolist()):
            matches = []
            for score, donor_index in zip(row_scores, row_indices):
                donor = donors[donor_index][0]
                matches.append({"score": score, "module": donor["module"],
                                "name": donor["name"], "vram": donor["vram"],
                                "size": donor["size"],
                                "source": donor.get("matching_source")})
            output_rows.append({"module": entry["module"], "name": entry["name"],
                                "vram": entry["vram"], "size": entry["size"],
                                "donors": matches})
    output.write_text("".join(json.dumps(row, sort_keys=True) + "\n"
                              for row in output_rows))
    return {"device": str(device), "donors": len(donors),
            "queries": len(queries), "neighbors": k}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path("."))
    parser.add_argument("--catalog", type=Path,
                        default=Path("build/research/function_catalog.json"))
    parser.add_argument("--output", type=Path,
                        default=Path("build/research/gpu_function_donors.jsonl"))
    parser.add_argument("--neighbors", type=int, default=20)
    args = parser.parse_args()
    result = retrieve(args.root.resolve(), args.catalog.resolve(),
                      args.output.resolve(), args.neighbors)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
