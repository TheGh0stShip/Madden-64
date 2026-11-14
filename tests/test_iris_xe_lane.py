import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

import numpy as np


ROOT = Path(__file__).resolve().parents[1]


def load(name, relative):
    spec = importlib.util.spec_from_file_location(name, ROOT / relative)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


LANE = load("iris_xe_lane", "tools/iris_xe_lane.py")
WORKER = load("iris_xe_worker", "tools/iris_xe_directml_worker.py")
EXPORTER = load("iris_xe_exporter", "tools/export_gpu_surrogate_onnx.py")


class IrisXeLaneTests(unittest.TestCase):
    def test_request_hash_excludes_only_hash_field(self):
        request = {"schema": LANE.REQUEST_SCHEMA, "model": "x", "request_sha256": "bad"}
        digest = LANE.canonical_request_hash(request)
        request["request_sha256"] = digest
        self.assertEqual(digest, WORKER.canonical_request_hash(request))
        request["model"] = "y"
        self.assertNotEqual(digest, WORKER.canonical_request_hash(request))

    def test_worker_rejects_manifest_hash_mismatch(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "model.onnx").write_bytes(b"model")
            (root / "inputs.npz").write_bytes(b"inputs")
            (root / "manifest.json").write_text(json.dumps({
                "schema": "madden64-iris-xe-model-v1", "model_sha256": "unused"}))
            request = {
                "schema": WORKER.SCHEMA, "advisory_only": True,
                "model": "model.onnx", "tensors": "inputs.npz",
                "manifest": "manifest.json",
                "model_sha256": WORKER.sha256(root / "model.onnx"),
                "tensors_sha256": WORKER.sha256(root / "inputs.npz"),
                "manifest_sha256": "0" * 64,
            }
            request["request_sha256"] = WORKER.canonical_request_hash(request)
            with self.assertRaisesRegex(ValueError, "manifest hash mismatch"):
                WORKER.validate_request(request, root)

    def test_containment_rejects_escape(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with self.assertRaisesRegex(ValueError, "escapes"):
                WORKER.contained(root, "../outside")

    def test_canonical_ties_use_candidate_id(self):
        self.assertEqual(LANE.canonical_order([1.0, 1.0, 2.0], ["b", "a", "c"]),
                         [2, 1, 0])
        with self.assertRaisesRegex(ValueError, "unique"):
            LANE.canonical_order([1.0, 2.0], ["same", "same"])

    def test_ordering_parity_accepts_near_ties_and_rejects_top_k_change(self):
        ids = ["a", "b", "c"]
        near = LANE.ordering_parity(
            np.asarray([1.0, 1.00001, 0.0]),
            np.asarray([1.00001, 1.0, 0.0]), ids, 0.0001, 2)
        self.assertTrue(near["differences_within_epsilon"])
        self.assertTrue(near["top_k_set_equal"])
        far = LANE.ordering_parity(
            np.asarray([3.0, 2.0, 1.0]),
            np.asarray([0.0, 2.0, 3.0]), ids, 0.0001, 1)
        self.assertFalse(far["differences_within_epsilon"])
        self.assertFalse(far["top_k_set_equal"])

    def test_load_inputs_rejects_object_arrays(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "bad.npz"
            np.savez(path, features=np.asarray([{"unsafe": True}], dtype=object))
            manifest = {"inputs": [{"name": "features", "dtype": "object",
                                      "shape": [-1]}]}
            with self.assertRaises(ValueError):
                WORKER.load_inputs(path, manifest)

    def test_surrogate_scores_are_finite_and_rank_exact_head_higher(self):
        weights = {"exact": 1.0, "prefix": 0.5, "residual": 0.5,
                   "save": 0.25, "frame": 0.1}
        raw = np.asarray([[0, 0, 0, 0, -4], [1, -1, 0, 1, 4]], dtype=np.float32)
        scores = LANE.surrogate_scores(raw, weights)
        self.assertTrue(np.isfinite(scores).all())
        self.assertGreater(scores[1], scores[0])
        with self.assertRaisesRegex(ValueError, r"\[N,5\]"):
            LANE.surrogate_scores(np.zeros((2, 4)), weights)

    def test_prepare_builds_tensors_in_wsl_and_rejects_duplicate_ids(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            tool = root / "fake_surrogate.py"
            tool.write_text(
                "import json\nDENSE_DIM=2\n"
                "def read_jsonl(p): return [json.loads(x) for x in open(p) if x.strip()]\n"
                "def featurize(row,buckets): return ([1,2],[.5,1.], [3.,4.])\n")
            output = root / "out"
            output.mkdir()
            (output / "manifest.json").write_text(json.dumps({
                "max_token_features": 4, "surrogate_config": {"buckets": 8},
                "tensor_file": "inputs.npz", "candidate_ids_file": "ids.json"}))
            candidates = root / "candidates.jsonl"
            candidates.write_text('{"candidate_id":"a"}\n{"candidate_id":"b"}\n')
            result = EXPORTER.prepare(tool, candidates, output)
            self.assertEqual(result["candidates"], 2)
            with np.load(output / "inputs.npz", allow_pickle=False) as arrays:
                self.assertEqual(arrays["ids"].shape, (2, 4))
                self.assertEqual(arrays["dense"].shape, (2, 2))
            candidates.write_text('{"candidate_id":"a"}\n{"candidate_id":"a"}\n')
            with self.assertRaisesRegex(ValueError, "duplicate"):
                EXPORTER.prepare(tool, candidates, output)


if __name__ == "__main__":
    unittest.main()
