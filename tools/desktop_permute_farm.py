#!/usr/bin/env python3
"""Run independent n64dk genuine-C permutation lanes across Desktop CPUs."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import signal
import shutil
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

# pycparser's AST deepcopy is recursive.  Large genuine-C candidates can
# exceed Python's default depth long before their syntax is pathological.
sys.setrecursionlimit(20000)

MODULES = {
    "resident": ("build/us/main_unpacked.z64", ["build/us/survey/symbol_addrs.txt"]),
    "overlay_1": ("build/us/audit/overlay_1_composite.z64", ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_1_functions/symbol_addrs.txt"]),
    "overlay_2": ("build/us/audit/overlay_2_composite.z64", ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_2_functions/symbol_addrs.txt"]),
    "overlay_4": ("build/us/audit/overlay_4_composite.z64", ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_4_functions/symbol_addrs.txt"]),
    "overlay_5": ("build/us/audit/overlay_5_composite.z64", ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_5_functions/symbol_addrs.txt"]),
}


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run_lane_process(command: list[str], root: Path, env: dict[str, str], timeout: int):
    process = subprocess.Popen(command, cwd=root, env=env, stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE, text=True, start_new_session=True)
    try:
        stdout, stderr = process.communicate(timeout=timeout)
    except subprocess.TimeoutExpired as exc:
        os.killpg(process.pid, signal.SIGKILL); stdout, stderr = process.communicate()
        raise subprocess.TimeoutExpired(command, timeout, stdout or exc.stdout,
                                        stderr or exc.stderr) from exc
    return subprocess.CompletedProcess(command, process.returncode, stdout, stderr)


def lane(root: Path, output: Path, job: dict, seed: int, python: str,
         pythonpath: str | None, timeout: int) -> dict:
    lane_id = f"{job['id']}-{seed}"
    lane_dir = output / lane_id; lane_dir.mkdir(parents=True, exist_ok=True)
    record_path = lane_dir / "result.json"
    source = (root / job["source"]).resolve()
    input_hash = sha(source)
    if record_path.exists():
        prior = json.loads(record_path.read_text())
        if prior.get("input_sha256") == input_hash and prior.get("state") == "succeeded":
            return prior | {"resumed": True}
    image, symbols = MODULES[job["module"]]
    best = lane_dir / "best"
    command = [python, "-m", "n64dk", "--format", "json", "match-permute", str(source),
               "--project", str(root), "--rom", str(root / image), "--addr", str(job["vram"]),
               "--size", str(job["size"]), "--pipeline", job.get("pipeline", "kmc+builtin"),
               "--flags", job["flags"], "--iterations", str(job.get("iterations", 3000)),
               "--seed", str(seed), "--max-mutations", str(job.get("max_mutations", 4)),
               "--temperature", str(job.get("temperature", 1.0)), "--jobs", "1",
               "--out", str(best)]
    if job.get("function"):
        command.extend(("--function", job["function"]))
    for symbols_file in symbols:
        command.extend(("--symbols", str(root / symbols_file)))
    env = dict(os.environ, OMP_NUM_THREADS="1", OPENBLAS_NUM_THREADS="1", MKL_NUM_THREADS="1")
    if pythonpath: env["PYTHONPATH"] = pythonpath
    try:
        proc = run_lane_process(command, root, env, timeout)
        candidates = sorted(best.rglob("*.c")) if best.exists() else []
        record = {"id": job["id"], "seed": seed, "state": "succeeded" if proc.returncode == 0 else "failed",
                  "exit_code": proc.returncode, "input_sha256": input_hash,
                  "stdout": proc.stdout[-8000:], "stderr": proc.stderr[-8000:],
                  "candidates": [{"path": str(path.relative_to(output)), "sha256": sha(path)} for path in candidates]}
        try:
            match_result = json.loads(proc.stdout)
        except json.JSONDecodeError:
            match_result = {}
        record["exact"] = bool(match_result.get("exact"))
        integration_source = None
        if record["exact"] and (best / "best.c").is_file():
            integration_source = best / "integration.c"
            text = (best / "best.c").read_text()
            original = job.get("function")
            target_name = job["target_function"]
            if original:
                text, replacements = re.subn(rf"\b{re.escape(original)}\b", target_name, text)
                if replacements == 0:
                    raise ValueError(f"exact source does not define requested function {original}")
            integration_source.write_text(text)
        record["integration"] = ({"module": job["module"],
                                  "source": str(integration_source.relative_to(root)),
                                  "destination": job["destination"], "vram": str(job["vram"]),
                                  "size": str(job["size"]),
                                  "function": target_name,
                                  "pipeline": job.get("pipeline", "kmc+builtin"),
                                  "flags": job["flags"]}
                                 if integration_source else None)
    except subprocess.TimeoutExpired as exc:
        record = {"id": job["id"], "seed": seed, "state": "timed_out", "exit_code": None,
                  "input_sha256": input_hash, "stdout": (exc.stdout or "")[-8000:],
                  "stderr": (exc.stderr or "")[-8000:], "candidates": []}
    record_path.write_text(json.dumps(record, indent=2, sort_keys=True) + "\n")
    return record


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("jobs", type=Path); ap.add_argument("output", type=Path)
    ap.add_argument("--root", type=Path, default=Path(".")); ap.add_argument("--workers", type=int, default=32)
    ap.add_argument("--python", default=sys.executable)
    ap.add_argument("--pythonpath", default=os.environ.get("PYTHONPATH"))
    ap.add_argument("--lane-timeout", type=int, default=21600)
    ap.add_argument("--checkpoint-mirror", type=Path,
                    help="durable directory receiving each completed lane")
    args = ap.parse_args(); root = args.root.resolve(); output = args.output.resolve()
    try:
        output.relative_to(root)
    except ValueError as exc:
        raise SystemExit("output must stay inside the campaign root") from exc
    output.mkdir(parents=True, exist_ok=True)
    jobs = [json.loads(line) for line in args.jobs.read_text().splitlines() if line.strip()]
    work = [(job, seed) for job in jobs for seed in job.get("seeds", [20261113])]
    results = []
    with ThreadPoolExecutor(max_workers=min(32, args.workers)) as pool:
        futures = [pool.submit(lane, root, output, job, seed, args.python, args.pythonpath, args.lane_timeout)
                   for job, seed in work]
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            if args.checkpoint_mirror:
                mirror = args.checkpoint_mirror.resolve()
                mirror.mkdir(parents=True, exist_ok=True)
                lane_id = f"{result['id']}-{result['seed']}"
                shutil.copytree(output / lane_id, mirror / lane_id,
                                dirs_exist_ok=True)
                (mirror / "progress.json").write_text(json.dumps({
                    "completed": len(results),
                    "total": len(work),
                    "exact": sum(bool(row.get("integration")) for row in results),
                }, indent=2, sort_keys=True) + "\n")
    results.sort(key=lambda row: (row["id"], row["seed"])); result_path = output / "results.jsonl"
    result_path.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in results))
    integrations = [row["integration"] for row in results if row.get("integration")]
    (output / "integration-results.jsonl").write_text(
        "".join(json.dumps(row, sort_keys=True) + "\n" for row in integrations))
    counts = {state: sum(row["state"] == state for row in results) for state in ("succeeded", "failed", "timed_out")}
    print(json.dumps({"lanes": len(results), **counts, "exact": len(integrations),
                      "results": str(result_path)}, sort_keys=True))
    return 0 if not counts["failed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
