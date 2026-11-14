#!/usr/bin/env python3
"""Evaluate whether a pre-compile ranker saves authoritative compilations.

Input is JSONL with one row per candidate.  Rows sharing ``query_id`` form a
search episode and must include a boolean ``exact`` plus scores for the model
and a cheap CPU baseline.  Lower scores rank first.  This tool never treats a
prediction as proof: it measures how many candidates the real compiler/matcher
would have needed to evaluate before the first exact candidate.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import random
from collections import defaultdict
from pathlib import Path


REQUIRED = {
    "query_id", "candidate_id", "source_project", "source_revision",
    "source_function", "exact", "model_score", "cpu_score", "original_order",
}


def _rank(rows: list[dict], key) -> int | None:
    ordered = sorted(rows, key=lambda row: (key(row), str(row["candidate_id"])))
    return next((index for index, row in enumerate(ordered, 1) if row["exact"]), None)


def _mean(values: list[float]) -> float:
    return sum(values) / len(values) if values else math.nan


def evaluate(rows: list[dict], seed: int = 20261113) -> dict:
    groups: dict[str, list[dict]] = defaultdict(list)
    identities: dict[str, tuple[str, str, str]] = {}
    for number, row in enumerate(rows, 1):
        missing = sorted(REQUIRED - row.keys())
        if missing:
            raise ValueError(f"row {number} missing fields: {', '.join(missing)}")
        if not isinstance(row["exact"], bool):
            raise ValueError(f"row {number} exact must be boolean")
        query = str(row["query_id"])
        identity = (str(row["source_project"]), str(row["source_revision"]),
                    str(row["source_function"]))
        if query in identities and identities[query] != identity:
            raise ValueError(f"query {query} mixes source identities")
        identities[query] = identity
        groups[query].append(row)
    if not groups:
        raise ValueError("no candidate rows")

    ranks = {name: [] for name in ("model", "cpu", "original", "random")}
    unsolved = []
    for query in sorted(groups):
        candidates = groups[query]
        if not any(row["exact"] for row in candidates):
            unsolved.append(query)
            continue
        ranks["model"].append(_rank(candidates, lambda row: float(row["model_score"])))
        ranks["cpu"].append(_rank(candidates, lambda row: float(row["cpu_score"])))
        ranks["original"].append(_rank(candidates, lambda row: int(row["original_order"])))
        shuffled = list(candidates)
        query_seed = int.from_bytes(hashlib.sha256(
            f"{seed}:{query}".encode()).digest()[:8], "big")
        random.Random(query_seed).shuffle(shuffled)
        ranks["random"].append(next(index for index, row in enumerate(shuffled, 1)
                                    if row["exact"]))

    solved = len(ranks["model"])
    if not solved:
        raise ValueError("no query contains an exact candidate")
    metrics = {}
    for name, values in ranks.items():
        numeric = [float(value) for value in values]
        metrics[name] = {
            "mean_compiles_to_first_exact": _mean(numeric),
            "median_compiles_to_first_exact": sorted(numeric)[len(numeric) // 2],
            "mrr": _mean([1.0 / value for value in numeric]),
            "hit_at_1": _mean([value <= 1 for value in numeric]),
            "hit_at_5": _mean([value <= 5 for value in numeric]),
            "hit_at_10": _mean([value <= 10 for value in numeric]),
        }
    model_mean = metrics["model"]["mean_compiles_to_first_exact"]
    speedups = {
        name: metrics[name]["mean_compiles_to_first_exact"] / model_mean
        for name in ("cpu", "original", "random")
    }
    # Acceptance is intentionally strict: the GPU/model route must beat the
    # useful cheap CPU baseline, not merely random ordering.
    accepted = speedups["cpu"] >= 1.25 and speedups["random"] >= 3.0
    return {
        "schema": "precompile-ranker-evaluation-v1",
        "seed": seed,
        "queries": len(groups),
        "solved_queries": solved,
        "unsolved_queries": unsolved,
        "metrics": metrics,
        "speedup_over_model": speedups,
        "accept_gpu_routing": accepted,
        "acceptance": {
            "cpu_speedup_min": 1.25,
            "random_speedup_min": 3.0,
            "metric": "mean authoritative compiles to first exact",
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--seed", type=int, default=20261113)
    args = parser.parse_args()
    rows = [json.loads(line) for line in args.input.read_text().splitlines() if line.strip()]
    report = evaluate(rows, args.seed)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"queries": report["queries"],
                      "accepted": report["accept_gpu_routing"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
