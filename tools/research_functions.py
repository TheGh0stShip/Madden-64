#!/usr/bin/env python3
"""Run three checkpointed public-source searches for every pending function."""

from __future__ import annotations

import argparse
import json
import subprocess
import time
import urllib.parse
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
CATALOG = ROOT / "build/research/function_catalog.json"
DEFAULT_OUTPUT = ROOT / "build/research/function_search_results.jsonl"
SOURCEGRAPH = "https://sourcegraph.com/.api/search/stream"


def get_json(url: str, timeout: int = 30) -> object:
    request = urllib.request.Request(url, headers={"User-Agent": "Madden64-research/1"})
    with urllib.request.urlopen(request, timeout=timeout) as response:
        return json.loads(response.read())


def sourcegraph(query: str) -> dict[str, object]:
    url = SOURCEGRAPH + "?" + urllib.parse.urlencode({"q": query})
    request = urllib.request.Request(url, headers={"User-Agent": "Madden64-research/1"})
    matches = []
    done = {}
    with urllib.request.urlopen(request, timeout=45) as response:
        for raw in response:
            line = raw.decode("utf-8", "replace").rstrip()
            if not line.startswith("data: "):
                continue
            try:
                payload = json.loads(line[6:])
            except json.JSONDecodeError:
                continue
            if isinstance(payload, list):
                for item in payload:
                    if not isinstance(item, dict) or "repository" not in item:
                        continue
                    matches.append({
                        "repository": item.get("repository"),
                        "path": item.get("path"),
                        "url": item.get("url"),
                        "line_matches": len(item.get("lineMatches", ())),
                    })
            elif isinstance(payload, dict) and payload.get("done"):
                done = payload
    return {
        "query": query,
        "matches": matches[:20],
        "match_count": done.get("matchCount", len(matches)),
        "duration_ms": done.get("durationMs"),
    }


def github(query: str) -> dict[str, object]:
    command = ["gh", "api", "-X", "GET", "search/code", "-f", f"q={query}",
               "-f", "per_page=10"]
    for attempt in range(4):
        process = subprocess.run(command, capture_output=True, text=True)
        if process.returncode == 0:
            break
        if "rate limit exceeded" not in process.stderr.lower() or attempt == 3:
            raise RuntimeError(process.stderr.strip() or "GitHub search failed")
        status = subprocess.run(
            ["gh", "api", "rate_limit", "--jq", ".resources.code_search.reset"],
            capture_output=True, text=True, check=True)
        delay = max(2.0, int(status.stdout.strip()) - time.time() + 2.0)
        time.sleep(min(delay, 60.0))
    payload = json.loads(process.stdout)
    return {
        "query": query,
        "match_count": payload.get("total_count", 0),
        "matches": [{
            "repository": item["repository"]["full_name"],
            "path": item["path"],
            "url": item["html_url"],
        } for item in payload.get("items", ())],
    }


def completed_keys(path: Path) -> set[tuple[str, str]]:
    completed = set()
    if not path.exists():
        return completed
    for line in path.read_text().splitlines():
        try:
            row = json.loads(line)
        except json.JSONDecodeError:
            continue
        if row.get("status") == "ok":
            completed.add((row["key"], row["round"]))
    return completed


def append(path: Path, row: dict[str, object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a") as stream:
        stream.write(json.dumps(row, separators=(",", ":")) + "\n")
        stream.flush()


def terms(entry: dict[str, object]) -> tuple[str, str]:
    constants = entry["rare_immediates"][:3]
    if constants:
        constant = " OR ".join(constants)
    else:
        constant = " OR ".join(entry["word_prefix"][:2])
    opcodes = list(dict.fromkeys(entry["opcode_prefix"][:8]))[:6]
    structure = " ".join(opcodes)
    return constant, structure


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--github-delay", type=float, default=6.2)
    args = parser.parse_args()
    catalog = json.loads(CATALOG.read_text())
    pending = [entry for entry in catalog["entries"] if not entry["matched"]]
    if args.limit is not None:
        pending = pending[:args.limit]
    completed = completed_keys(args.output)
    last_github = 0.0

    for number, entry in enumerate(pending, 1):
        key = f'{entry["module"]}:{entry["vram"]}'
        constant, structure = terms(entry)
        constant_terms = constant.replace(" OR ", " ")
        word_terms = " ".join(entry["word_prefix"][:3])
        rounds = (
            ("github_c_constants", github,
             f'{constant_terms} ultra64 language:C'),
            ("github_asm_structure", github,
             f'{structure} {constant.split(" OR ")[0]} language:Assembly'),
            ("github_asm_words", github,
             f'{word_terms} language:Assembly'),
        )
        for round_name, provider, query in rounds:
            if (key, round_name) in completed:
                continue
            if round_name.startswith("github_"):
                delay = args.github_delay - (time.monotonic() - last_github)
                if delay > 0:
                    time.sleep(delay)
                last_github = time.monotonic()
            started = time.time()
            row = {
                "key": key, "module": entry["module"], "name": entry["name"],
                "vram": entry["vram"], "size": entry["size"],
                "round": round_name, "query": query,
            }
            try:
                row["result"] = provider(query)
                row["status"] = "ok"
            except Exception as error:
                row["status"] = "error"
                row["error"] = str(error)
            row["elapsed_seconds"] = round(time.time() - started, 3)
            append(args.output, row)
        if number % 10 == 0:
            print(f"searched {number}/{len(pending)} pending functions", flush=True)


if __name__ == "__main__":
    main()
