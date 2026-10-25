#!/usr/bin/env python3
"""Build a reproducible upstream-research ledger for N64 matching work."""

from __future__ import annotations

import argparse
import json
import subprocess
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path


QUERIES = (
    "n64 decompilation in:name,description,readme",
    "nintendo 64 decomp in:name,description,readme",
    "n64 matching decomp in:name,description,readme",
    "n64 reverse engineering in:name,description,readme",
    "mips decompilation in:name,description,readme",
    "ido static recomp in:name,description,readme",
    "decomp permuter in:name,description,readme",
    "splat n64 in:name,description,readme",
    "n64 sdk reverse engineering in:name,description,readme",
    "n64 recompilation in:name,description,readme",
)

SIGNALS = (
    "n64", "decomp", "matching", "mips", "ido", "kmc", "splat",
    "permuter", "objdiff", "asm-differ", "libultra", "rom", "recomp",
)


def gh_json(endpoint: str, *fields: str) -> dict:
    command = ["gh", "api", "-X", "GET", endpoint]
    for field in fields:
        command.extend(("-f", field))
    result = subprocess.run(command, check=True, capture_output=True, text=True)
    return json.loads(result.stdout)


def relevance(repo: dict) -> tuple[int, int, str]:
    text = " ".join((repo.get("name") or "", repo.get("description") or "",
                     " ".join(repo.get("topics") or ()))).lower()
    score = sum(3 if signal in (repo.get("topics") or ()) else
                1 for signal in SIGNALS if signal in text)
    return score, repo.get("stargazers_count", 0), repo["full_name"].lower()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--rounds", type=int, default=500)
    parser.add_argument("--output", type=Path,
                        default=Path("build/research/upstream_500.json"))
    args = parser.parse_args()

    repositories: dict[str, dict] = {}
    query_counts = Counter()
    for query in QUERIES:
        for page in range(1, 6):
            payload = gh_json("search/repositories", f"q={query}",
                              "sort=updated", "order=desc", "per_page=100",
                              f"page={page}")
            items = payload.get("items", ())
            for repo in items:
                name = repo["full_name"]
                query_counts[query] += 1
                repositories.setdefault(name, repo)
            if len(items) < 100 or len(repositories) >= args.rounds * 2:
                break

    ranked = sorted(repositories.values(), key=relevance, reverse=True)
    selected = ranked[:args.rounds]
    if len(selected) < args.rounds:
        raise SystemExit(f"only {len(selected)} unique upstreams found")

    rounds = []
    signal_counts = Counter()
    for number, repo in enumerate(selected, 1):
        text = " ".join((repo.get("name") or "", repo.get("description") or "",
                         " ".join(repo.get("topics") or ()))).lower()
        signals = [signal for signal in SIGNALS if signal in text]
        signal_counts.update(signals)
        rounds.append({
            "round": number,
            "repository": repo["full_name"],
            "url": repo["html_url"],
            "description": repo.get("description"),
            "updated_at": repo.get("updated_at"),
            "stars": repo.get("stargazers_count", 0),
            "language": repo.get("language"),
            "topics": repo.get("topics", []),
            "signals": signals,
            "relevance_score": relevance(repo)[0],
        })

    result = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "requested_rounds": args.rounds,
        "completed_rounds": len(rounds),
        "method": "GitHub repository search; one independently ranked upstream per round",
        "queries": list(QUERIES),
        "query_result_counts": dict(query_counts),
        "unique_candidates": len(repositories),
        "signal_counts": dict(signal_counts),
        "rounds": rounds,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    print(f"wrote {args.output}: {len(rounds)} rounds from "
          f"{len(repositories)} unique candidates")


if __name__ == "__main__":
    main()
