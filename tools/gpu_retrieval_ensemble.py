#!/usr/bin/env python3
"""CUDA-resident ensemble retrieval for unfinished Madden 64 functions.

Random feature masks expose donor rankings that are stable across opcode-shingle
subspaces instead of trusting one hashed projection.  The matrix stays resident
on CUDA; output includes consensus frequency, mean score, and score variance.
This is a research/routing aid only: every suggested C donor must still compile
and byte-match under an evidenced toolchain.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import gpu_function_retrieval as base


def dense(items, device):
    import torch
    out = torch.zeros((len(items), base.BUCKETS), dtype=torch.float16, device=device)
    for row, (_, blob) in enumerate(items):
        features = base.feature_indices(blob)
        cols = list(features)
        out[row, cols] = torch.tensor(list(features.values()), dtype=torch.float16,
                                      device=device)
    return torch.nn.functional.normalize(out, dim=1)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", type=Path, default=Path("."))
    ap.add_argument("--catalog", type=Path,
                    default=Path("build/research/function_catalog.json"))
    ap.add_argument("--output", type=Path, required=True)
    ap.add_argument("--iterations", type=int, default=4096)
    ap.add_argument("--neighbors", type=int, default=32)
    ap.add_argument("--seed", type=int, default=20261113)
    args = ap.parse_args()
    try:
        import torch
    except ImportError as exc:
        raise SystemExit("PyTorch is required; run this on Desktop") from exc
    if not torch.cuda.is_available():
        raise SystemExit("CUDA is required; run this on Desktop")

    root = args.root.resolve()
    catalog = json.loads(args.catalog.read_text())
    rows = base.load_blobs(root, catalog)
    eligible = base.genuine_sources(root)
    donors = [(e, b) for e, b in rows
              if e["matched"] and e.get("matching_source") in eligible]
    queries = [(e, b) for e, b in rows if not e["matched"]]
    device = torch.device("cuda")
    dm, qm = dense(donors, device), dense(queries, device)
    counts = torch.zeros((len(queries), len(donors)), dtype=torch.int16, device=device)
    sums = torch.zeros_like(counts, dtype=torch.float32)
    sums2 = torch.zeros_like(sums)
    gen = torch.Generator(device=device).manual_seed(args.seed)
    k = min(args.neighbors, len(donors))

    # Random positive diagonal projections preserve opcode evidence while
    # measuring ranking stability under different feature emphases.
    for _ in range(args.iterations):
        weights = torch.empty(base.BUCKETS, dtype=torch.float16, device=device)
        weights.log_normal_(mean=0.0, std=0.35, generator=gen)
        projected_d = torch.nn.functional.normalize(dm * weights, dim=1)
        projected_q = torch.nn.functional.normalize(qm * weights, dim=1)
        sim = projected_q @ projected_d.T
        vals, idx = torch.topk(sim, k=k, dim=1)
        counts.scatter_add_(1, idx, torch.ones_like(idx, dtype=torch.int16))
        sums.scatter_add_(1, idx, vals.float())
        sums2.scatter_add_(1, idx, vals.float().square())

    best_counts, best_idx = torch.topk(counts, k=k, dim=1)
    result = []
    for qn, ((entry, _), indices, frequencies) in enumerate(
            zip(queries, best_idx.cpu().tolist(), best_counts.cpu().tolist())):
        choices = []
        for di, freq in zip(indices, frequencies):
            denom = max(1, freq)
            mean = float(sums[qn, di].item() / denom)
            var = max(0.0, float(sums2[qn, di].item() / denom - mean * mean))
            donor = donors[di][0]
            choices.append({"frequency": freq, "mean_score": mean,
                            "variance": var, "module": donor["module"],
                            "name": donor["name"], "vram": donor["vram"],
                            "size": donor["size"],
                            "source": donor.get("matching_source")})
        result.append({"module": entry["module"], "name": entry["name"],
                       "vram": entry["vram"], "size": entry["size"],
                       "donors": choices})
    args.output.write_text("".join(json.dumps(r, sort_keys=True) + "\n" for r in result))
    print(json.dumps({"device": str(device), "iterations": args.iterations,
                      "donors": len(donors), "queries": len(queries),
                      "neighbors": k}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
