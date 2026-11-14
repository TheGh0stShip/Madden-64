#!/usr/bin/env python3
"""Export and prepare the pre-compile surrogate for advisory ONNX inference."""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import inspect
import json
import shutil
from pathlib import Path


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def load_surrogate(path: Path):
    spec = importlib.util.spec_from_file_location("gpu_precompile_surrogate", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load surrogate tool: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def export_model(tool: Path, artifact_path: Path, output: Path,
                 max_token_features: int) -> dict:
    if max_token_features < 8:
        raise ValueError("max token features must be at least 8")
    surrogate = load_surrogate(tool)
    artifact = surrogate.load_artifact(artifact_path)
    if artifact.get("backend") != "torch":
        raise ValueError("ONNX export requires a torch surrogate artifact")
    torch = surrogate._torch()
    base = surrogate._build_torch_model(torch, artifact["config"])
    base.load_state_dict(artifact["state"])
    base.eval()

    class DenseBag(torch.nn.Module):
        def __init__(self):
            super().__init__()
            self.embedding = base.bag
            self.trunk = base.trunk
            self.heads = base.heads

        def forward(self, ids, weights, dense):
            gathered = self.embedding.weight[ids]
            pooled = (gathered * weights.unsqueeze(-1)).sum(dim=1)
            return self.heads(self.trunk(torch.cat((pooled, dense), dim=1)))

    model = DenseBag().eval()
    output.mkdir(parents=True, exist_ok=True)
    model_path = output / "model.onnx"
    sample_ids = torch.zeros((2, max_token_features), dtype=torch.long)
    sample_weights = torch.zeros((2, max_token_features), dtype=torch.float32)
    sample_dense = torch.zeros((2, surrogate.DENSE_DIM), dtype=torch.float32)
    export_options = {
        "input_names": ["ids", "weights", "dense"],
        "output_names": ["raw_heads"],
        "opset_version": 17,
        "dynamic_axes": {"ids": {0: "batch"}, "weights": {0: "batch"},
                         "dense": {0: "batch"}, "raw_heads": {0: "batch"}},
        "do_constant_folding": True,
    }
    if "dynamo" in inspect.signature(torch.onnx.export).parameters:
        export_options["dynamo"] = False
    torch.onnx.export(model, (sample_ids, sample_weights, sample_dense),
                      str(model_path), **export_options)
    manifest = {
        "schema": "madden64-iris-xe-model-v1",
        "advisory_only": True,
        "model_file": model_path.name,
        "model_sha256": sha256(model_path),
        "source_artifact_sha256": sha256(artifact_path),
        "opset": 17,
        "max_token_features": max_token_features,
        "inputs": [
            {"name": "ids", "dtype": "int64", "shape": [-1, max_token_features]},
            {"name": "weights", "dtype": "float32", "shape": [-1, max_token_features]},
            {"name": "dense", "dtype": "float32", "shape": [-1, surrogate.DENSE_DIM]},
        ],
        "outputs": [{"name": "raw_heads", "dtype": "float32", "shape": [-1, 5]}],
        "ranking_output": "raw_heads",
        "ranking_direction": "descending",
        "score_weights": artifact["config"]["score_weights"],
        "surrogate_format": artifact["format"],
        "surrogate_config": artifact["config"],
        "tensor_file": "inputs.npz",
        "candidate_ids_file": "candidate_ids.json",
    }
    manifest_path = output / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return manifest


def prepare(tool: Path, candidates: Path, output: Path,
            artifact_path: Path | None = None) -> dict:
    import numpy as np

    surrogate = load_surrogate(tool)
    manifest_path = output / "manifest.json"
    manifest = json.loads(manifest_path.read_text())
    rows = surrogate.read_jsonl(candidates)
    if not rows:
        raise ValueError("no candidates")
    encoded = [surrogate.featurize(row, manifest["surrogate_config"]["buckets"])
               for row in rows]
    width = manifest["max_token_features"]
    longest = max(len(item[0]) for item in encoded)
    if longest > width:
        raise ValueError(
            f"candidate needs {longest} token features but model supports {width}; re-export wider")
    ids = np.zeros((len(rows), width), dtype=np.int64)
    weights = np.zeros((len(rows), width), dtype=np.float32)
    dense = np.zeros((len(rows), surrogate.DENSE_DIM), dtype=np.float32)
    candidate_ids = []
    for index, (row, (row_ids, row_weights, row_dense)) in enumerate(zip(rows, encoded)):
        candidate = row.get("candidate_id")
        if not isinstance(candidate, str) or not candidate:
            raise ValueError(f"candidate row {index + 1} lacks candidate_id")
        candidate_ids.append(candidate)
        ids[index, :len(row_ids)] = row_ids
        weights[index, :len(row_weights)] = row_weights
        dense[index] = row_dense
    if len(set(candidate_ids)) != len(candidate_ids):
        raise ValueError("duplicate candidate_id")
    with (output / manifest["tensor_file"]).open("wb") as handle:
        np.savez(handle, ids=ids, weights=weights, dense=dense)
    (output / manifest["candidate_ids_file"]).write_text(
        json.dumps(candidate_ids, indent=2) + "\n")
    shutil.copyfile(candidates, output / "candidate_rows.jsonl")
    result = {"candidates": len(rows), "longest_token_features": longest,
              "tensors_sha256": sha256(output / manifest["tensor_file"]),
              "candidate_ids_sha256": sha256(output / manifest["candidate_ids_file"])}
    if artifact_path is not None:
        if sha256(artifact_path) != manifest["source_artifact_sha256"]:
            raise ValueError("artifact hash does not match exported model manifest")
        artifact = surrogate.load_artifact(artifact_path)
        if artifact.get("backend") != "torch":
            raise ValueError("reference generation requires a torch artifact")
        torch = surrogate._torch()
        model = surrogate._build_torch_model(torch, artifact["config"])
        model.load_state_dict(artifact["state"])
        model.eval()
        raw = []
        with torch.no_grad():
            for start in range(0, len(rows), 4096):
                indexes = range(start, min(len(rows), start + 4096))
                raw.extend(model(*surrogate._batch_torch(
                    torch, encoded, indexes, "cpu")).cpu().numpy())
        reference = output / "pytorch-reference.npz"
        with reference.open("wb") as handle:
            np.savez(handle, raw_heads=np.asarray(raw, dtype=np.float32))
        manifest["pytorch_reference_file"] = reference.name
        manifest["pytorch_reference_sha256"] = sha256(reference)
        manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
        result["pytorch_reference_sha256"] = manifest["pytorch_reference_sha256"]
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--tool", type=Path,
                        default=Path(__file__).with_name("gpu_precompile_surrogate.py"))
    sub = parser.add_subparsers(dest="command", required=True)
    export = sub.add_parser("export")
    export.add_argument("--artifact", type=Path, required=True)
    export.add_argument("--output", type=Path, required=True)
    export.add_argument("--max-token-features", type=int, default=128)
    prep = sub.add_parser("prepare")
    prep.add_argument("--candidates", type=Path, required=True)
    prep.add_argument("--output", type=Path, required=True)
    prep.add_argument("--artifact", type=Path,
                      help="torch artifact used to emit an export-parity reference")
    args = parser.parse_args()
    if args.command == "export":
        result = export_model(args.tool, args.artifact, args.output,
                              args.max_token_features)
    else:
        result = prepare(args.tool, args.candidates, args.output, args.artifact)
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
