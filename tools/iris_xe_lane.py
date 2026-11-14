#!/usr/bin/env python3
"""WSL-side controller and verifier for Transfer's Iris Xe DirectML lane."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys
import time
from pathlib import Path


REQUEST_SCHEMA = "madden64-iris-xe-request-v1"
WINDOWS_PYTHON = Path("/mnt/c/N64Decomp/venvs/iris-xe/Scripts/python.exe")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def canonical_request_hash(request: dict) -> str:
    body = {key: value for key, value in request.items() if key != "request_sha256"}
    encoded = json.dumps(body, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def windows_path(path: Path) -> str:
    result = subprocess.run(["wslpath", "-w", str(path.resolve())], check=True,
                            text=True, capture_output=True)
    return result.stdout.strip()


def worker_command(worker: Path, *arguments: str, timeout: int = 120) -> subprocess.CompletedProcess:
    if not WINDOWS_PYTHON.is_file():
        raise RuntimeError(f"isolated Windows Python missing: {WINDOWS_PYTHON}")
    command = [str(WINDOWS_PYTHON), "-I", windows_path(worker), *arguments]
    try:
        return subprocess.run(command, check=True, text=True, capture_output=True,
                              timeout=timeout)
    except subprocess.CalledProcessError as exc:
        raise RuntimeError(
            f"Iris Xe worker failed ({exc.returncode}): "
            f"{(exc.stderr or exc.stdout or '').strip()}") from exc


def make_request(root: Path, output: str, repeats: int,
                 model_name: str = "smoke.onnx", tensors_name: str = "inputs.npz",
                 manifest_name: str = "manifest.json") -> dict:
    manifest = json.loads((root / manifest_name).read_text())
    request = {
        "schema": REQUEST_SCHEMA,
        "advisory_only": True,
        "model": model_name,
        "manifest": manifest_name,
        "tensors": tensors_name,
        "output": output,
        "model_sha256": sha256(root / model_name),
        "tensors_sha256": sha256(root / tensors_name),
        "manifest_sha256": sha256(root / manifest_name),
        "opset": manifest["opset"],
        "repeats": repeats,
    }
    request["request_sha256"] = canonical_request_hash(request)
    return request


def canonical_order(scores, candidate_ids):
    if len(scores) != len(candidate_ids) or len(set(candidate_ids)) != len(candidate_ids):
        raise ValueError("candidate IDs must be a unique one-to-one score mapping")
    return sorted(range(len(candidate_ids)),
                  key=lambda index: (-float(scores[index]), str(candidate_ids[index])))


def ordering_parity(left, right, candidate_ids, epsilon: float, top_k: int) -> dict:
    import numpy as np

    left = np.asarray(left, dtype=np.float32).reshape(-1)
    right = np.asarray(right, dtype=np.float32).reshape(-1)
    if left.shape != right.shape or not np.isfinite(left).all() or not np.isfinite(right).all():
        raise ValueError("invalid score arrays")
    left_order = canonical_order(left, candidate_ids)
    right_order = canonical_order(right, candidate_ids)
    differing = []
    left_position = {item: position for position, item in enumerate(left_order)}
    right_position = {item: position for position, item in enumerate(right_order)}
    for item in range(len(candidate_ids)):
        if left_position[item] != right_position[item]:
            differing.append(item)
    near_tie_only = all(abs(float(left[item]) - float(right[item])) <= epsilon
                        for item in differing)
    k = min(top_k, len(candidate_ids))
    top_set_equal = set(left_order[:k]) == set(right_order[:k])
    return {
        "max_abs_delta": float(np.max(np.abs(left - right), initial=0.0)),
        "differing_positions": len(differing),
        "differences_within_epsilon": near_tie_only,
        "top_k": k,
        "top_k_set_equal": top_set_equal,
        "permutation_valid": (sorted(left_order) == list(range(len(candidate_ids))) and
                              sorted(right_order) == list(range(len(candidate_ids)))),
    }


def run_worker(worker: Path, root: Path, ep: str, request_name: str,
               response_name: str) -> dict:
    completed = worker_command(
        worker, "run", "--root", windows_path(root),
        "--request", windows_path(root / request_name),
        "--response", windows_path(root / response_name), "--ep", ep, timeout=300)
    response = json.loads((root / response_name).read_text(encoding="utf-8"))
    if response["request_sha256"] != json.loads(
            (root / request_name).read_text())["request_sha256"]:
        raise RuntimeError("worker echoed a different request hash")
    output = root / response["output"]
    if sha256(output) != response["output_sha256"]:
        raise RuntimeError("worker output hash mismatch")
    response["worker_stdout"] = completed.stdout.strip()
    return response


def probe(worker: Path) -> dict:
    completed = worker_command(worker, "probe")
    report = json.loads(completed.stdout)
    if "DmlExecutionProvider" not in report.get("providers", []):
        raise RuntimeError("DirectML provider is unavailable")
    return report


def smoke(worker: Path, root: Path, rows: int, repeats: int,
          epsilon: float, top_k: int) -> dict:
    import numpy as np

    if not str(root.resolve()).startswith("/mnt/c/"):
        raise ValueError("smoke work directory must be on /mnt/c for Windows isolation")
    root.mkdir(parents=True, exist_ok=True)
    worker_command(worker, "make-smoke", "--root", windows_path(root))
    # Integer-derived float inputs avoid platform-specific random generators.
    raw = np.arange(rows * 32, dtype=np.uint32).reshape(rows, 32)
    features = ((raw % 251).astype(np.float32) - np.float32(125.0)) / np.float32(128.0)
    with (root / "inputs.npz").open("wb") as handle:
        np.savez(handle, features=features)
    candidate_ids = [f"candidate-{index:08d}" for index in range(rows)]
    responses = {}
    for ep in ("cpu", "dml"):
        request = make_request(root, f"{ep}-outputs.npz", repeats)
        request_name = f"{ep}-request.json"
        (root / request_name).write_text(json.dumps(request, indent=2, sort_keys=True) + "\n")
        responses[ep] = run_worker(worker, root, ep, request_name, f"{ep}-response.json")
    with np.load(root / "cpu-outputs.npz", allow_pickle=False) as archive:
        cpu_scores = archive["scores"].copy()
    with np.load(root / "dml-outputs.npz", allow_pickle=False) as archive:
        dml_scores = archive["scores"].copy()
    parity = ordering_parity(cpu_scores, dml_scores, candidate_ids, epsilon, top_k)
    cpu_warm = sum(responses["cpu"]["run_seconds"][1:]) / max(1, repeats - 1)
    dml_warm = sum(responses["dml"]["run_seconds"][1:]) / max(1, repeats - 1)
    speedup = cpu_warm / dml_warm if dml_warm else None
    correctness = (
        responses["cpu"]["deterministic_bitwise"] and
        responses["dml"]["deterministic_bitwise"] and
        responses["dml"]["providers_active"][0] == "DmlExecutionProvider" and
        responses["dml"]["strict_no_cpu_fallback"] and
        parity["permutation_valid"] and parity["top_k_set_equal"] and
        parity["differences_within_epsilon"]
    )
    return {
        "schema": "madden64-iris-xe-smoke-report-v1",
        "advisory_only": True,
        "rows": rows,
        "repeats": repeats,
        "epsilon": epsilon,
        "probe": probe(worker),
        "responses": responses,
        "parity": parity,
        "warm_cpu_seconds": cpu_warm,
        "warm_dml_seconds": dml_warm,
        "warm_speedup": speedup,
        "correctness_gate": "pass" if correctness else "fail",
        "performance_gate": "pass" if correctness and speedup is not None and speedup >= 1.10 else "fail",
        "routing_enabled": bool(correctness and speedup is not None and speedup >= 1.10),
        "note": "Advisory ranking only; CPU compilation and byte matching remain authoritative.",
    }


def surrogate_scores(raw_heads, weights):
    import numpy as np

    raw = np.asarray(raw_heads, dtype=np.float32)
    if raw.ndim != 2 or raw.shape[1] != 5 or not np.isfinite(raw).all():
        raise ValueError("surrogate output must be finite [N,5] logits")
    sig = 1.0 / (1.0 + np.exp(-np.clip(raw, -30.0, 30.0)))
    epsilon = np.float32(1e-6)
    exact = np.clip(sig[:, 4], epsilon, 1 - epsilon)
    save = np.clip(sig[:, 3], epsilon, 1 - epsilon)
    return (weights["exact"] * np.log(exact) +
            weights["prefix"] * sig[:, 0] -
            weights["residual"] * sig[:, 1] +
            weights["save"] * np.log(save) -
            weights["frame"] * np.abs(raw[:, 2]) * 4.0)


def rank_surrogate(worker: Path, root: Path, repeats: int,
                   epsilon: float, top_k: int) -> dict:
    import numpy as np

    if not str(root.resolve()).startswith("/mnt/c/"):
        raise ValueError("rank work directory must be on /mnt/c")
    manifest = json.loads((root / "manifest.json").read_text())
    model_name = manifest.get("model_file", "model.onnx")
    tensors_name = manifest.get("tensor_file", "inputs.npz")
    candidate_file = root / manifest.get("candidate_ids_file", "candidate_ids.json")
    candidate_ids = json.loads(candidate_file.read_text())
    if not isinstance(candidate_ids, list) or not all(isinstance(item, str) for item in candidate_ids):
        raise ValueError("candidate IDs must be a JSON string list")
    output_name = manifest.get("ranking_output", "raw_heads")
    responses = {}
    scores = {}
    for ep in ("cpu", "dml"):
        request = make_request(root, f"{ep}-outputs.npz", repeats,
                               model_name=model_name, tensors_name=tensors_name)
        request_name = f"{ep}-request.json"
        (root / request_name).write_text(json.dumps(request, indent=2, sort_keys=True) + "\n")
        responses[ep] = run_worker(worker, root, ep, request_name, f"{ep}-response.json")
        with np.load(root / f"{ep}-outputs.npz", allow_pickle=False) as archive:
            raw = archive[output_name].copy()
            scores[ep] = surrogate_scores(raw, manifest["score_weights"])
            if ep == "cpu":
                cpu_raw = raw
    parity = ordering_parity(scores["cpu"], scores["dml"], candidate_ids, epsilon, top_k)
    export_parity = None
    reference_name = manifest.get("pytorch_reference_file")
    if reference_name:
        reference = root / reference_name
        if sha256(reference) != manifest.get("pytorch_reference_sha256"):
            raise RuntimeError("PyTorch reference hash mismatch")
        with np.load(reference, allow_pickle=False) as archive:
            reference_raw = archive[output_name].copy()
        reference_scores = surrogate_scores(reference_raw, manifest["score_weights"])
        export_parity = ordering_parity(
            reference_scores, scores["cpu"], candidate_ids, epsilon, top_k)
        export_parity["raw_max_abs_delta"] = float(
            np.max(np.abs(np.asarray(reference_raw) - np.asarray(cpu_raw)), initial=0.0))
    cpu_warm = sum(responses["cpu"]["run_seconds"][1:]) / max(1, repeats - 1)
    dml_warm = sum(responses["dml"]["run_seconds"][1:]) / max(1, repeats - 1)
    speedup = cpu_warm / dml_warm if dml_warm else None
    correctness = (
        responses["cpu"]["deterministic_bitwise"] and
        responses["dml"]["deterministic_bitwise"] and
        responses["dml"]["providers_active"][0] == "DmlExecutionProvider" and
        responses["dml"]["strict_no_cpu_fallback"] and
        parity["permutation_valid"] and parity["top_k_set_equal"] and
        parity["differences_within_epsilon"] and
        export_parity is not None and export_parity["permutation_valid"] and
        export_parity["top_k_set_equal"] and export_parity["differences_within_epsilon"]
    )
    order = canonical_order(scores["dml"], candidate_ids)
    ranked = [{"candidate_id": candidate_ids[index], "rank": rank,
               "advisory_score": float(scores["dml"][index])}
              for rank, index in enumerate(order, 1)]
    (root / "ranked.json").write_text(json.dumps(ranked, indent=2) + "\n")
    return {
        "schema": "madden64-iris-xe-surrogate-report-v1",
        "advisory_only": True,
        "candidates": len(candidate_ids),
        "model_sha256": sha256(root / model_name),
        "parity": parity,
        "pytorch_export_parity": export_parity,
        "responses": responses,
        "warm_cpu_seconds": cpu_warm,
        "warm_dml_seconds": dml_warm,
        "warm_speedup": speedup,
        "correctness_gate": "pass" if correctness else "fail",
        "performance_gate": "pass" if correctness and speedup is not None and speedup >= 1.10 else "fail",
        "routing_enabled": bool(correctness and speedup is not None and speedup >= 1.10),
        "ranked_sha256": sha256(root / "ranked.json"),
        "note": "Ranking only; every candidate still requires CPU compile and exact byte match.",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--worker", type=Path,
                        default=Path(__file__).with_name("iris_xe_directml_worker.py"))
    sub = parser.add_subparsers(dest="command", required=True)
    sub.add_parser("probe")
    run = sub.add_parser("smoke")
    run.add_argument("--root", type=Path,
                     default=Path("/mnt/c/N64Decomp/iris-xe/madden64-smoke"))
    run.add_argument("--rows", type=int, default=65536)
    run.add_argument("--repeats", type=int, default=6)
    run.add_argument("--epsilon", type=float, default=1e-4)
    run.add_argument("--top-k", type=int, default=500)
    run.add_argument("--output", type=Path)
    rank = sub.add_parser("rank")
    rank.add_argument("--root", type=Path, required=True)
    rank.add_argument("--repeats", type=int, default=6)
    rank.add_argument("--epsilon", type=float, default=1e-4)
    rank.add_argument("--top-k", type=int, default=500)
    rank.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.command == "probe":
        print(json.dumps(probe(args.worker), indent=2, sort_keys=True))
        return 0
    started = time.perf_counter()
    if args.command == "smoke":
        report = smoke(args.worker, args.root, args.rows, args.repeats,
                       args.epsilon, args.top_k)
    else:
        report = rank_surrogate(args.worker, args.root, args.repeats,
                                args.epsilon, args.top_k)
    report["end_to_end_seconds"] = time.perf_counter() - started
    encoded = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(encoded)
    print(encoded, end="")
    return 0 if report["correctness_gate"] == "pass" else 1


if __name__ == "__main__":
    raise SystemExit(main())
