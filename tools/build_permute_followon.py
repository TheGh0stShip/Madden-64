#!/usr/bin/env python3
"""Build diversified follow-on lanes from a completed Desktop permutation farm."""
from __future__ import annotations

import argparse
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("jobs", type=Path)
    parser.add_argument("results", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--score-limit", type=int, default=30)
    parser.add_argument("--iterations", type=int, default=240000)
    parser.add_argument("--seeds", type=int, default=8)
    parser.add_argument("--seed-base", type=int, default=20261201)
    args = parser.parse_args()

    output = []
    for job in json.loads(args.jobs.read_text()):
        result_dir = args.results / job["name"]
        record_path = result_dir / "result.json"
        scores_path = result_dir / "scores.json"
        if not record_path.is_file() or not scores_path.is_file():
            continue
        record = json.loads(record_path.read_text())
        if str(record.get("state", "")).startswith("exact"):
            continue
        scores = json.loads(scores_path.read_text())
        if not scores or int(scores[0]["score"]) > args.score_limit:
            continue
        best = scores[0]
        output.append({
            "destination": f"src/overlays/overlay1/{job['name']}.c",
            "flags": best["flags"],
            "function": job["name"],
            "id": f"overlay1-followon-{job['name']}",
            "iterations": args.iterations,
            "max_mutations": 12,
            "module": "overlay_1",
            "pipeline": best["pipeline"],
            "seeds": [args.seed_base + index for index in range(args.seeds)],
            "size": hex(int(job["size"])),
            "source": best["source"],
            "target_function": job["name"],
            "temperature": 1.35,
            "vram": job["vram"],
        })
    args.output.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in output))
    print(json.dumps({"functions": len(output), "lanes": len(output) * args.seeds,
                      "iterations_per_lane": args.iterations}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
