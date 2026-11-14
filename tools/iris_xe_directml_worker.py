#!/usr/bin/env python3
"""Isolated Windows ONNX Runtime worker for the Transfer Iris Xe lane.

This process consumes tensors only.  It never reads C sources, ROM images, or
compiler output, and its results are advisory.  Exactness remains the job of
the legacy CPU compiler and byte matcher.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import platform
import subprocess
import sys
import time
from pathlib import Path


SCHEMA = "madden64-iris-xe-request-v1"
RESPONSE_SCHEMA = "madden64-iris-xe-response-v1"
MAX_TENSOR_BYTES = 512 << 20


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def contained(root: Path, value: str) -> Path:
    root = root.resolve()
    path = (root / value).resolve()
    try:
        path.relative_to(root)
    except ValueError as exc:
        raise ValueError(f"path escapes request root: {value}") from exc
    if not path.is_file():
        raise ValueError(f"request file missing: {value}")
    return path


def canonical_request_hash(request: dict) -> str:
    body = {key: value for key, value in request.items() if key != "request_sha256"}
    encoded = json.dumps(body, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def validate_request(request: dict, root: Path) -> tuple[Path, Path, Path, dict]:
    if request.get("schema") != SCHEMA:
        raise ValueError("unsupported request schema")
    if request.get("advisory_only") is not True:
        raise ValueError("advisory_only must be true")
    if request.get("request_sha256") != canonical_request_hash(request):
        raise ValueError("request hash mismatch")
    model = contained(root, request["model"])
    tensors = contained(root, request["tensors"])
    manifest_path = contained(root, request["manifest"])
    if sha256(model) != request["model_sha256"]:
        raise ValueError("model hash mismatch")
    if sha256(tensors) != request["tensors_sha256"]:
        raise ValueError("tensor hash mismatch")
    if sha256(manifest_path) != request["manifest_sha256"]:
        raise ValueError("manifest hash mismatch")
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest.get("schema") != "madden64-iris-xe-model-v1":
        raise ValueError("unsupported model manifest")
    if manifest.get("model_sha256") != request["model_sha256"]:
        raise ValueError("manifest/model hash mismatch")
    return model, tensors, manifest_path, manifest


def load_inputs(path: Path, manifest: dict):
    import numpy as np

    if path.stat().st_size > MAX_TENSOR_BYTES:
        raise ValueError("tensor archive exceeds safety limit")
    expected = manifest.get("inputs")
    if not isinstance(expected, list) or not expected:
        raise ValueError("manifest inputs missing")
    result = {}
    with np.load(path, allow_pickle=False) as archive:
        if set(archive.files) != {item["name"] for item in expected}:
            raise ValueError("tensor names do not match manifest")
        for item in expected:
            array = archive[item["name"]]
            if array.dtype.name != item["dtype"]:
                raise ValueError(f"dtype mismatch for {item['name']}")
            shape = item["shape"]
            if len(array.shape) != len(shape) or any(
                    wanted != -1 and actual != wanted
                    for wanted, actual in zip(shape, array.shape)):
                raise ValueError(f"shape mismatch for {item['name']}")
            if array.nbytes > MAX_TENSOR_BYTES:
                raise ValueError(f"tensor {item['name']} exceeds safety limit")
            if array.dtype.kind == "f" and not np.isfinite(array).all():
                raise ValueError(f"non-finite input {item['name']}")
            result[item["name"]] = np.ascontiguousarray(array)
    return result


def provider_name(ep: str) -> str:
    return {"dml": "DmlExecutionProvider", "cpu": "CPUExecutionProvider"}[ep]


def session_options(ort, strict: bool):
    options = ort.SessionOptions()
    options.enable_mem_pattern = False
    options.execution_mode = ort.ExecutionMode.ORT_SEQUENTIAL
    options.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_EXTENDED
    options.intra_op_num_threads = 1
    options.inter_op_num_threads = 1
    if strict:
        options.add_session_config_entry("session.disable_cpu_ep_fallback", "1")
    return options


def run(request_path: Path, response_path: Path, root: Path, ep: str) -> dict:
    import numpy as np
    import onnxruntime as ort

    request = json.loads(request_path.read_text(encoding="utf-8"))
    model, tensors, _, manifest = validate_request(request, root)
    inputs = load_inputs(tensors, manifest)
    provider = provider_name(ep)
    available = ort.get_available_providers()
    if provider not in available:
        raise RuntimeError(f"provider unavailable: {provider}; have {available}")
    started = time.perf_counter()
    strict = ep == "dml"
    session = ort.InferenceSession(
        str(model), sess_options=session_options(ort, strict=strict), providers=[provider])
    create_seconds = time.perf_counter() - started
    active = session.get_providers()
    if not active or active[0] != provider:
        raise RuntimeError(f"provider was not selected first: {active}")
    expected_outputs = [item["name"] for item in manifest.get("outputs", [])]
    if not expected_outputs:
        raise ValueError("manifest outputs missing")
    repeats = int(request.get("repeats", 5))
    if not 1 <= repeats <= 100:
        raise ValueError("repeats outside safe range")
    runs = []
    elapsed = []
    for _ in range(repeats):
        before = time.perf_counter()
        values = session.run(expected_outputs, inputs)
        elapsed.append(time.perf_counter() - before)
        runs.append([np.asarray(value) for value in values])
    for number, outputs in enumerate(runs):
        for name, array in zip(expected_outputs, outputs):
            if array.dtype.kind == "f" and not np.isfinite(array).all():
                raise ValueError(f"non-finite output {name} on run {number}")
            if array.shape != runs[0][expected_outputs.index(name)].shape:
                raise ValueError(f"unstable output shape for {name}")
    deterministic = all(
        left.dtype == right.dtype and left.shape == right.shape and
        left.tobytes() == right.tobytes()
        for outputs in runs[1:] for left, right in zip(runs[0], outputs)
    )
    output_name = request.get("output", "outputs.npz")
    if Path(output_name).name != output_name:
        raise ValueError("output must be a file name")
    output_path = root.resolve() / output_name
    temporary = output_path.with_suffix(output_path.suffix + ".tmp")
    with temporary.open("wb") as handle:
        np.savez(handle, **dict(zip(expected_outputs, runs[0])))
    os.replace(temporary, output_path)
    response = {
        "schema": RESPONSE_SCHEMA,
        "request_sha256": request["request_sha256"],
        "model_sha256": request["model_sha256"],
        "tensors_sha256": request["tensors_sha256"],
        "output": output_path.name,
        "output_sha256": sha256(output_path),
        "advisory_only": True,
        "provider_requested": provider,
        "providers_active": active,
        "providers_available": available,
        "strict_no_cpu_fallback": strict,
        "deterministic_bitwise": deterministic,
        "repeats": repeats,
        "session_create_seconds": create_seconds,
        "run_seconds": elapsed,
        "python": sys.version,
        "platform": platform.platform(),
        "onnxruntime": ort.__version__,
    }
    response_path.write_text(json.dumps(response, indent=2, sort_keys=True) + "\n",
                             encoding="utf-8")
    return response


def probe() -> dict:
    import onnxruntime as ort

    directml = Path(os.environ.get("SystemRoot", r"C:\Windows")) / "System32" / "directml.dll"
    adapter = None
    if os.name == "nt":
        command = [
            "powershell.exe", "-NoLogo", "-NoProfile", "-NonInteractive", "-Command",
            "Get-CimInstance Win32_VideoController | "
            "Where-Object {$_.PNPDeviceID -like 'PCI\\VEN_8086*'} | "
            "Select-Object -First 1 Name,DriverVersion,PNPDeviceID | ConvertTo-Json -Compress",
        ]
        try:
            completed = subprocess.run(command, check=True, text=True, capture_output=True,
                                       timeout=15)
            adapter = json.loads(completed.stdout) if completed.stdout.strip() else None
        except (OSError, subprocess.SubprocessError, json.JSONDecodeError):
            adapter = None
    return {
        "schema": "madden64-iris-xe-probe-v1",
        "python": sys.version,
        "platform": platform.platform(),
        "onnxruntime": ort.__version__,
        "providers": ort.get_available_providers(),
        "directml_dll": str(directml),
        "directml_sha256": sha256(directml) if directml.is_file() else None,
        "adapter": adapter,
        "gil_disabled": bool(getattr(sys, "_is_gil_enabled", lambda: True)() is False),
    }


def make_smoke(root: Path, rows: int = 4096, repeats: int = 10) -> dict:
    """Create a deterministic, portable MLP used only to validate the lane."""
    import numpy as np
    import onnx
    from onnx import TensorProto, helper, numpy_helper

    root.mkdir(parents=True, exist_ok=True)
    width, hidden = 32, 64
    w1 = (np.arange(width * hidden, dtype=np.float32).reshape(width, hidden) % 31 - 15) / 64
    b1 = np.linspace(-0.1, 0.1, hidden, dtype=np.float32)
    w2 = (np.arange(hidden, dtype=np.float32).reshape(hidden, 1) % 13 - 6) / 32
    b2 = np.asarray([0.03125], dtype=np.float32)
    nodes = [
        helper.make_node("MatMul", ["features", "w1"], ["hidden0"]),
        helper.make_node("Add", ["hidden0", "b1"], ["hidden1"]),
        helper.make_node("Relu", ["hidden1"], ["hidden2"]),
        helper.make_node("MatMul", ["hidden2", "w2"], ["score0"]),
        helper.make_node("Add", ["score0", "b2"], ["scores"]),
    ]
    graph = helper.make_graph(
        nodes, "iris-xe-smoke",
        [helper.make_tensor_value_info("features", TensorProto.FLOAT, [None, width])],
        [helper.make_tensor_value_info("scores", TensorProto.FLOAT, [None, 1])],
        [numpy_helper.from_array(value, name) for name, value in
         (("w1", w1), ("b1", b1), ("w2", w2), ("b2", b2))])
    model = helper.make_model(graph, opset_imports=[helper.make_opsetid("", 17)],
                              producer_name="madden64-iris-xe-smoke")
    model.ir_version = 10
    onnx.checker.check_model(model)
    model_path = root / "smoke.onnx"
    onnx.save_model(model, model_path)
    manifest = {
        "schema": "madden64-iris-xe-model-v1",
        "model_sha256": sha256(model_path),
        "opset": 17,
        "advisory_only": True,
        "inputs": [{"name": "features", "dtype": "float32", "shape": [-1, width]}],
        "outputs": [{"name": "scores", "dtype": "float32", "shape": [-1, 1]}],
        "ranking_output": "scores",
        "ranking_direction": "descending",
    }
    manifest_path = root / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n",
                             encoding="utf-8")
    if not 1 <= rows <= 2_000_000:
        raise ValueError("smoke rows outside safe range")
    if not 1 <= repeats <= 100:
        raise ValueError("smoke repeats outside safe range")
    features = np.arange(rows * width, dtype=np.float32).reshape(rows, width)
    features = (features % 251 - 125) / 128
    tensors_path = root / "inputs.npz"
    np.savez(tensors_path, features=features)
    request = {
        "schema": SCHEMA,
        "advisory_only": True,
        "model": model_path.name,
        "model_sha256": manifest["model_sha256"],
        "tensors": tensors_path.name,
        "tensors_sha256": sha256(tensors_path),
        "manifest": manifest_path.name,
        "manifest_sha256": sha256(manifest_path),
        "output": "outputs.npz",
        "repeats": repeats,
    }
    request["request_sha256"] = canonical_request_hash(request)
    request_path = root / "request.json"
    request_path.write_text(json.dumps(request, indent=2, sort_keys=True) + "\n",
                            encoding="utf-8")
    return {"model": model_path.name, "manifest": manifest_path.name,
            "request": request_path.name, "model_sha256": manifest["model_sha256"],
            "tensors_sha256": request["tensors_sha256"]}


def main() -> int:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    sub.add_parser("probe")
    smoke = sub.add_parser("make-smoke")
    smoke.add_argument("--root", type=Path, required=True)
    smoke.add_argument("--rows", type=int, default=4096)
    smoke.add_argument("--repeats", type=int, default=10)
    execute = sub.add_parser("run")
    execute.add_argument("--root", type=Path, required=True)
    execute.add_argument("--request", type=Path, required=True)
    execute.add_argument("--response", type=Path, required=True)
    execute.add_argument("--ep", choices=("dml", "cpu"), required=True)
    args = parser.parse_args()
    if args.command == "probe":
        print(json.dumps(probe(), indent=2, sort_keys=True))
        return 0
    if args.command == "make-smoke":
        print(json.dumps(make_smoke(args.root, args.rows, args.repeats), sort_keys=True))
        return 0
    result = run(args.request, args.response, args.root, args.ep)
    print(json.dumps({"provider": result["provider_requested"],
                      "deterministic": result["deterministic_bitwise"],
                      "output_sha256": result["output_sha256"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
