#!/usr/bin/env python3
"""GPU-assisted PRE-COMPILE pruning for matching-decompilation candidate C mutations.

This tool ranks already-generated C mutation candidates *before* they are compiled
so that the scarce authoritative CPU compile slots are spent on the most promising
candidates first.  It never emits code bytes, never rewrites assembler output and
is not a compiler: the legacy CPU compiler plus the exact byte matcher remain the
only proof of exactness.  Every "exact" in this tool's inputs is an authoritative
label produced by that CPU pipeline (see tools/build_gpu_surrogate_dataset.py).

Model: hashed mutation-token / compiler-lane / structural features -> weighted
EmbeddingBag -> small shared MLP trunk -> five heads
  prefix_quality  matching_prefix_words / target_words           (sigmoid)
  residual        min(1, word_distance / target_words)            (sigmoid)
  frame_delta     signed log1p(|frame_size_delta|) / 4            (linear)
  save_mask_ok    P(save_mask_xor == 0)                           (sigmoid)
  exact_prob      P(exact)                                        (sigmoid)
Default size is ~4.2M parameters (cap 10M) which trains comfortably on an
RTX 2070 8GB.  A numpy linear multi-head backend exists only so unit tests and
CPU-only smoke runs work without PyTorch; it is not the GPU model.

Commands:
  train     --train TRAIN.jsonl [--valid VALID.jsonl] [--hard-negatives HN.jsonl] --out MODEL
  evaluate  --model MODEL --test TEST.jsonl [--manifest manifest.json] [--criteria C.json] --out REPORT.json
  rank      --model MODEL --candidates PENDING.jsonl --out RANKED.jsonl [--top N]
  selftest  (synthetic end-to-end run on the CPU fallback; never claims savings)
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
import random
import re
import sys
import time
from pathlib import Path

MODEL_FORMAT = "n64-precompile-surrogate-model/v1"
REPORT_FORMAT = "n64-precompile-surrogate-report/v1"
MAX_PARAMETERS = 10_000_000
DEFAULT_KS = (25, 50, 150, 500)
HEADS = ("prefix_quality", "residual", "frame_delta", "save_mask_ok", "exact_prob")
DENSE_DIM = 6
DEFAULT_CONFIG = {
    "buckets": 1 << 16,
    "embed_dim": 64,
    "hidden": 128,
    "trunk": 64,
    "epochs": 30,
    "batch_size": 256,
    "lr": 3e-3,
    "weight_decay": 1e-5,
    "seed": 0,
    "hard_negative_weight": 2.0,
    "exact_pos_weight": "auto",
    # Ranking score = weighted combination of head outputs (all label-free at rank time).
    "score_weights": {"exact": 1.0, "prefix": 0.5, "residual": 0.5, "save": 0.25, "frame": 0.1},
}
DEFAULT_CRITERIA = {
    "required_split_mode": "repo",
    "min_factor": 3.0,
    "min_relative_reduction": 0.20,
    "recall_k": 150,
    "min_pools_with_exact": 10,
    "baselines": ["original", "random", "heuristic"],
    "candidate_ordering": "model",
}
# Structural keys that would smuggle post-compile labels into the features are ignored.
LABEL_KEYS = frozenset({"exact", "first_mismatch_word", "matching_prefix_words", "word_distance", "byte_distance",
                        "target_words", "candidate_words", "frame_size_delta", "save_mask_xor", "score",
                        "distance", "prefix", "mismatch", "frame", "save_mask"})
_TOKEN = re.compile(r"0[xX][0-9A-Fa-f]+|\d+|[A-Za-z_]\w*|==|!=|<=|>=|<<|>>|&&|\|\||->|\+\+|--|[^\s\w]")


# --------------------------------------------------------------------------- helpers

def _builder():
    """Load the sibling dataset builder (contract validation + leakage checks)."""
    path = Path(__file__).resolve().with_name("build_gpu_surrogate_dataset.py")
    spec = importlib.util.spec_from_file_location("build_gpu_surrogate_dataset", path)
    if spec is None or spec.loader is None:
        raise SystemExit(f"cannot load dataset builder at {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules.setdefault("build_gpu_surrogate_dataset", module)
    spec.loader.exec_module(module)
    return module


def _torch():
    try:
        import torch
    except ImportError as exc:  # pragma: no cover - depends on environment
        raise SystemExit(
            "PyTorch is required for --backend torch (install a CUDA build for the RTX 2070 host); "
            "use --backend numpy only for CPU smoke tests") from exc
    return torch


def _numpy():
    try:
        import numpy
    except ImportError as exc:  # pragma: no cover
        raise SystemExit("numpy is required for the CPU fallback backend") from exc
    return numpy


def _hash(text: str, buckets: int) -> int:
    digest = hashlib.blake2b(text.encode("utf-8"), digest_size=8).digest()
    return int.from_bytes(digest, "little") % buckets


def _stable_seed(*parts) -> int:
    digest = hashlib.sha256("\x1f".join(str(p) for p in parts).encode()).digest()
    return int.from_bytes(digest[:8], "little")


def read_jsonl(path) -> list[dict]:
    rows = []
    with open(path, encoding="utf-8") as handle:
        for number, line in enumerate(handle, 1):
            line = line.strip()
            if not line:
                continue
            try:
                rows.append(json.loads(line))
            except json.JSONDecodeError as exc:
                raise SystemExit(f"{path}:{number}: invalid JSON: {exc}") from exc
    return rows


def write_json(path, payload) -> None:
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    Path(path).write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def pool_key(row: dict) -> tuple:
    function = row.get("function") or {}
    return (str(row.get("repo", "")), str(row.get("source_revision", "")),
            str(function.get("canonical_hash", function.get("name", ""))), str(row.get("compiler_lane", "")))


def _family(row: dict) -> str:
    return str((row.get("mutation") or {}).get("family", "unknown"))


def _tokens(row: dict) -> list[str]:
    tokens = (row.get("mutation") or {}).get("tokens") or []
    return [str(t) for t in tokens]


def is_synthetic(row: dict) -> bool:
    prov = row.get("provenance") or {}
    return (bool(prov.get("synthetic"))
            or any(str(prov.get(key, "")).lower().startswith("synthetic") for key in ("compiler", "matcher"))
            or any(str(row.get(key, "")).lower().startswith("synthetic") for key in ("project", "repo")))


# --------------------------------------------------------------------------- features

def canonical_token(token: str) -> list[str]:
    """Canonicalize a mutation token: lower-case, numbers collapsed, C sub-tokens split."""
    pieces = _TOKEN.findall(token.lower())
    out = []
    for piece in pieces:
        if piece[:2] == "0x" or piece.isdigit():
            out.append("<num>")
        else:
            out.append(piece)
    return out or ["<empty>"]


def featurize(row: dict, buckets: int = DEFAULT_CONFIG["buckets"]) -> tuple[list[int], list[float], list[float]]:
    """Return (bucket ids, per-bucket weights, dense features) from PRE-COMPILE fields only.

    Reads only ``mutation``, ``compiler_lane``, ``structural`` and ``generation_index``.
    Labels, provenance, byte paths and function identity are never read, so the
    surrogate cannot see the answer and cannot memorise per-function identities.
    """
    family = _family(row).lower()
    lane = str(row.get("compiler_lane", "")).lower()
    raw_tokens = _tokens(row)
    names: list[tuple[str, float]] = [("fam:" + family, 1.0), ("lane:" + lane, 1.0), ("lanefam:" + lane + "|" + family, 1.0)]
    lane_parts = [p for p in re.split(r"[:\s,]+", lane) if p]
    names.extend(("lanepart:" + p, 0.5) for p in lane_parts)
    canon: list[str] = []
    for token in raw_tokens:
        parts = canonical_token(token)
        whole = "_".join(parts)
        canon.append(whole)
        names.append(("tok:" + whole, 1.0))
        names.append(("famtok:" + family + "|" + whole, 1.0))
        names.extend(("sub:" + p, 0.5) for p in parts)
    for first, second in zip(canon, canon[1:]):
        names.append(("bi:" + first + ">" + second, 0.5))
    names.append(("ntok:%d" % min(len(raw_tokens), 12), 1.0))
    structural = row.get("structural") or {}
    for key in sorted(structural):
        lowered = str(key).lower()
        if lowered in LABEL_KEYS or any(part in lowered for part in ("mismatch", "distance", "exact", "prefix")):
            continue
        value = structural[key]
        if isinstance(value, bool):
            value = float(value)
        if not isinstance(value, (int, float)) or not math.isfinite(value):
            continue
        magnitude = math.copysign(math.log1p(abs(value)), value)
        names.append(("s:" + str(key).lower(), magnitude))
        names.append(("sb:%s:%d" % (str(key).lower(), min(int(abs(value)).bit_length(), 16)), 1.0))
    ids = [_hash(name, buckets) for name, _ in names]
    weights = [float(w) for _, w in names]
    n_struct = sum(1 for k in structural if isinstance(structural[k], (int, float)))
    generation = row.get("generation_index", 0)
    generation = generation if isinstance(generation, int) and generation >= 0 else 0
    dense = [1.0, math.log1p(len(raw_tokens)), math.log1p(generation) / 8.0,
             1.0 if n_struct else 0.0, math.log1p(n_struct) / 4.0, math.log1p(len(set(canon))) / 2.0]
    return ids, weights, dense


def targets(row: dict) -> list[float]:
    labels = row["labels"]
    total = max(int(labels.get("target_words") or 0), 1)
    prefix = min(1.0, max(0.0, labels["matching_prefix_words"] / total))
    residual = min(1.0, max(0.0, labels["word_distance"] / total))
    frame = labels.get("frame_size_delta", 0) or 0
    frame_t = math.copysign(math.log1p(abs(frame)), frame) / 4.0
    save_ok = 1.0 if (labels.get("save_mask_xor", 0) or 0) == 0 else 0.0
    exact = 1.0 if labels["exact"] else 0.0
    return [prefix, residual, frame_t, save_ok, exact]


def combine_score(heads: dict, weights: dict) -> float:
    eps = 1e-6
    p_exact = min(max(heads["exact_prob"], eps), 1 - eps)
    p_save = min(max(heads["save_mask_ok"], eps), 1 - eps)
    return (weights["exact"] * math.log(p_exact)
            + weights["prefix"] * heads["prefix_quality"]
            - weights["residual"] * heads["residual"]
            + weights["save"] * math.log(p_save)
            - weights["frame"] * abs(heads["frame_delta"]) * 4.0)


# --------------------------------------------------------------------------- model sizing

def parameter_count(config: dict) -> int:
    buckets, dim, hidden, trunk = config["buckets"], config["embed_dim"], config["hidden"], config["trunk"]
    return (buckets * dim + (dim + DENSE_DIM) * hidden + hidden + hidden * trunk + trunk
            + trunk * len(HEADS) + len(HEADS))


def numpy_parameter_count(config: dict) -> int:
    return len(HEADS) * (config["buckets"] + DENSE_DIM)


def resolve_config(config: dict | None) -> dict:
    merged = json.loads(json.dumps(DEFAULT_CONFIG))
    for key, value in (config or {}).items():
        if key == "score_weights":
            merged["score_weights"].update(value)
        else:
            merged[key] = value
    count = parameter_count(merged)
    if count >= MAX_PARAMETERS:
        raise ValueError(f"model would have {count} parameters; cap is {MAX_PARAMETERS}")
    return merged


def _build_torch_model(torch, config: dict):
    nn = torch.nn

    class SurrogateRanker(nn.Module):
        def __init__(self) -> None:
            super().__init__()
            self.bag = nn.EmbeddingBag(config["buckets"], config["embed_dim"], mode="sum")
            self.trunk = nn.Sequential(
                nn.Linear(config["embed_dim"] + DENSE_DIM, config["hidden"]), nn.ReLU(),
                nn.Linear(config["hidden"], config["trunk"]), nn.ReLU())
            self.heads = nn.Linear(config["trunk"], len(HEADS))
            nn.init.normal_(self.bag.weight, std=0.02)

        def forward(self, ids, offsets, weights, dense):
            pooled = self.bag(ids, offsets, per_sample_weights=weights)
            return self.heads(self.trunk(torch.cat([pooled, dense], dim=1)))

    model = SurrogateRanker()
    actual = sum(p.numel() for p in model.parameters())
    if actual >= MAX_PARAMETERS:
        raise ValueError(f"model has {actual} parameters; cap is {MAX_PARAMETERS}")
    return model


# --------------------------------------------------------------------------- training

def _select_backend(backend: str) -> str:
    if backend in ("torch", "numpy"):
        return backend
    if backend != "auto":
        raise ValueError(f"unknown backend {backend!r}")
    return "torch" if importlib.util.find_spec("torch") is not None else "numpy"


def _encode(rows, buckets):
    return [featurize(row, buckets) for row in rows]


def _sample_weights(rows, config, hard_ids):
    out = []
    for row in rows:
        weight = 1.0
        if row.get("hard_negative") or row.get("candidate_id") in hard_ids:
            weight = float(config["hard_negative_weight"])
        out.append(weight)
    return out


def _pos_weight(rows, config) -> float:
    if config["exact_pos_weight"] != "auto":
        return float(config["exact_pos_weight"])
    positives = sum(1 for r in rows if r["labels"]["exact"])
    negatives = len(rows) - positives
    return float(min(50.0, max(1.0, negatives / max(positives, 1))))


def train_model(train_rows, valid_rows=None, config=None, backend="auto", device="auto",
                hard_negative_ids=()) -> dict:
    """Train the ranker and return an in-memory artifact dict."""
    config = resolve_config(config)
    if not train_rows:
        raise ValueError("no training rows")
    backend = _select_backend(backend)
    if backend == "numpy" and numpy_parameter_count(config) >= MAX_PARAMETERS:
        raise ValueError(f"numpy model would have {numpy_parameter_count(config)} parameters; cap is {MAX_PARAMETERS}")
    hard_ids = set(hard_negative_ids)
    started = time.perf_counter()
    if backend == "torch":
        torch = _torch()
        previous_threads = torch.get_num_threads()
        cpu_run = device == "cpu" or (device == "auto" and not torch.cuda.is_available())
        if cpu_run:
            # Multi-threaded CPU float reductions occasionally differ in the last bit; one thread
            # makes CPU (test/fallback) training bitwise reproducible.  CUDA runs are unaffected.
            torch.set_num_threads(1)
        try:
            state, history, used_device = _train_torch(train_rows, valid_rows or [], config, device, hard_ids)
        finally:
            torch.set_num_threads(previous_threads)
        params = parameter_count(config)
    else:
        state, history = _train_numpy(train_rows, valid_rows or [], config, hard_ids)
        used_device = "cpu"
        params = numpy_parameter_count(config)
    return {
        "format": MODEL_FORMAT,
        "backend": backend,
        "device": used_device,
        "config": config,
        "parameters": params,
        "state": state,
        "history": history,
        "train_seconds": round(time.perf_counter() - started, 4),
        "train_rows": len(train_rows),
        "train_canonical_hashes": sorted({pool_key(r)[2] for r in train_rows + list(valid_rows or [])}),
        "train_repos": sorted({str(r.get("repo", "")) for r in train_rows + list(valid_rows or [])}),
        "train_source_digests": sorted({str(r["candidate_source_digest"]) for r in train_rows + list(valid_rows or [])
                                        if r.get("candidate_source_digest")}),
    }


def _batch_torch(torch, encoded, index, device):
    ids, offsets, weights, dense = [], [], [], []
    for i in index:
        b_ids, b_w, b_dense = encoded[i]
        offsets.append(len(ids))
        ids.extend(b_ids)
        weights.extend(b_w)
        dense.append(b_dense)
    return (torch.tensor(ids, dtype=torch.long, device=device),
            torch.tensor(offsets, dtype=torch.long, device=device),
            torch.tensor(weights, dtype=torch.float32, device=device),
            torch.tensor(dense, dtype=torch.float32, device=device))


def _torch_loss(torch, out, target, sample_w, pos_weight):
    functional = torch.nn.functional
    bce_cols = [0, 1, 3]
    loss = functional.binary_cross_entropy_with_logits(out[:, bce_cols], target[:, bce_cols], reduction="none").sum(1)
    loss = loss + functional.mse_loss(out[:, 2], target[:, 2], reduction="none")
    pw = torch.tensor(pos_weight, device=out.device)
    loss = loss + 2.0 * functional.binary_cross_entropy_with_logits(out[:, 4], target[:, 4], pos_weight=pw, reduction="none")
    return (loss * sample_w).sum() / sample_w.sum()


def _train_torch(train_rows, valid_rows, config, device, hard_ids):
    import os
    # Required by cuBLAS for deterministic GEMMs; must be set before the first CUDA matmul.
    os.environ.setdefault("CUBLAS_WORKSPACE_CONFIG", ":4096:8")
    torch = _torch()
    if device == "auto":
        device = "cuda" if torch.cuda.is_available() else "cpu"
    torch.manual_seed(config["seed"])
    if device.startswith("cuda"):
        torch.cuda.manual_seed_all(config["seed"])
    torch.use_deterministic_algorithms(True, warn_only=True)
    model = _build_torch_model(torch, config).to(device)
    opt = torch.optim.AdamW(model.parameters(), lr=config["lr"], weight_decay=config["weight_decay"])
    enc = _encode(train_rows, config["buckets"])
    tgt = torch.tensor([targets(r) for r in train_rows], dtype=torch.float32, device=device)
    sw = torch.tensor(_sample_weights(train_rows, config, hard_ids), dtype=torch.float32, device=device)
    pos_weight = _pos_weight(train_rows, config)
    v_enc = _encode(valid_rows, config["buckets"]) if valid_rows else []
    v_tgt = torch.tensor([targets(r) for r in valid_rows], dtype=torch.float32, device=device) if valid_rows else None
    rng = random.Random(config["seed"])
    order = list(range(len(train_rows)))
    history, best_state, best_loss = [], None, math.inf
    for epoch in range(int(config["epochs"])):
        model.train()
        rng.shuffle(order)
        total = 0.0
        for start in range(0, len(order), config["batch_size"]):
            index = order[start:start + config["batch_size"]]
            out = model(*_batch_torch(torch, enc, index, device))
            idx = torch.tensor(index, device=device)
            loss = _torch_loss(torch, out, tgt[idx], sw[idx], pos_weight)
            opt.zero_grad()
            loss.backward()
            opt.step()
            total += float(loss.detach()) * len(index)
        entry = {"epoch": epoch, "train_loss": round(total / len(order), 6)}
        if valid_rows:
            model.eval()
            v_total = 0.0
            with torch.no_grad():  # chunked so validation memory is bounded on an 8GB card
                for start in range(0, len(valid_rows), 4096):
                    index = range(start, min(len(valid_rows), start + 4096))
                    out = model(*_batch_torch(torch, v_enc, index, device))
                    ones = torch.ones(len(index), device=device)
                    chunk = v_tgt[start:start + len(index)]
                    v_total += float(_torch_loss(torch, out, chunk, ones, pos_weight)) * len(index)
            v_loss = v_total / len(valid_rows)
            entry["valid_loss"] = round(v_loss, 6)
            if v_loss < best_loss:
                best_loss = v_loss
                best_state = {k: v.detach().cpu().clone() for k, v in model.state_dict().items()}
        history.append(entry)
    if best_state is None:
        best_state = {k: v.detach().cpu().clone() for k, v in model.state_dict().items()}
    return best_state, history, device


def _numpy_forward(np, state, encoded):
    weights = state["weights"]  # (heads, buckets)
    dense_w = state["dense"]    # (heads, DENSE_DIM)
    out = np.zeros((len(encoded), len(HEADS)), dtype=np.float64)
    for i, (ids, w, dense) in enumerate(encoded):
        out[i] = weights[:, ids] @ np.asarray(w) + dense_w @ np.asarray(dense)
    return out


def _train_numpy(train_rows, valid_rows, config, hard_ids):
    """CPU test fallback: deterministic linear multi-head model trained with Adagrad-style SGD."""
    np = _numpy()
    rng = random.Random(config["seed"])
    heads = len(HEADS)
    weights = np.zeros((heads, config["buckets"]), dtype=np.float64)
    dense_w = np.zeros((heads, DENSE_DIM), dtype=np.float64)
    acc_w = np.full((heads, config["buckets"]), 1e-8)
    acc_d = np.full((heads, DENSE_DIM), 1e-8)
    enc = _encode(train_rows, config["buckets"])
    tgt = np.asarray([targets(r) for r in train_rows], dtype=np.float64)
    sw = np.asarray(_sample_weights(train_rows, config, hard_ids), dtype=np.float64)
    pos_weight = _pos_weight(train_rows, config)
    lr = float(config["lr"]) * 30.0
    order = list(range(len(train_rows)))
    history = []
    epochs = max(1, min(int(config["epochs"]), 40))
    for epoch in range(epochs):
        rng.shuffle(order)
        total = 0.0
        for i in order:
            ids, w, dense = enc[i]
            w_arr = np.asarray(w)
            d_arr = np.asarray(dense)
            z = weights[:, ids] @ w_arr + dense_w @ d_arr
            sig = 1.0 / (1.0 + np.exp(-np.clip(z, -30, 30)))
            grad = sig - tgt[i]
            grad[2] = z[2] - tgt[i, 2]
            if tgt[i, 4] > 0.5:
                grad[4] *= pos_weight
            grad[4] *= 2.0
            grad *= sw[i]
            total += float(np.abs(grad).sum())
            g_w = np.outer(grad, w_arr)
            g_d = np.outer(grad, d_arr) + config["weight_decay"] * dense_w
            np.add.at(acc_w, (slice(None), ids), g_w * g_w)
            acc_d += g_d * g_d
            np.subtract.at(weights, (slice(None), ids), lr * g_w / np.sqrt(acc_w[:, ids]))
            dense_w -= lr * g_d / np.sqrt(acc_d)
        history.append({"epoch": epoch, "train_abs_grad": round(total / len(order), 6)})
    return {"weights": weights, "dense": dense_w}, history


# --------------------------------------------------------------------------- persistence

def save_artifact(artifact: dict, path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    # Wall-clock timing is reported on stdout, not persisted, so artifacts are reproducible.
    meta = {k: v for k, v in artifact.items() if k not in ("state", "train_seconds")}
    if artifact["backend"] == "torch":
        torch = _torch()
        torch.save({"meta": meta, "state": artifact["state"]}, path)
        return
    np = _numpy()
    import io
    import zipfile
    arrays = {"meta": np.asarray(json.dumps(meta, sort_keys=True)),
              "weights": artifact["state"]["weights"], "dense": artifact["state"]["dense"]}
    # Hand-rolled .npz with fixed timestamps so identical training runs give identical files.
    with zipfile.ZipFile(path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for name in sorted(arrays):
            buffer = io.BytesIO()
            np.lib.format.write_array(buffer, np.asarray(arrays[name]), allow_pickle=False)
            info = zipfile.ZipInfo(name + ".npy", date_time=(1980, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(info, buffer.getvalue())


def load_artifact(path) -> dict:
    path = Path(path)
    np = _numpy()
    try:
        with np.load(path, allow_pickle=False) as data:
            if "meta" in data.files:
                meta = json.loads(str(data["meta"]))
                meta["state"] = {"weights": data["weights"], "dense": data["dense"]}
                return meta
    except (ValueError, OSError):
        pass
    torch = _torch()
    blob = torch.load(path, map_location="cpu", weights_only=True)
    meta = dict(blob["meta"])
    meta["state"] = blob["state"]
    if meta.get("format") != MODEL_FORMAT:
        raise SystemExit(f"{path}: not a {MODEL_FORMAT} artifact")
    return meta


# --------------------------------------------------------------------------- inference

def predict(artifact: dict, rows: list[dict], device: str = "auto") -> list[dict]:
    config = artifact["config"]
    encoded = _encode(rows, config["buckets"])
    if not rows:
        return []
    if artifact["backend"] == "torch":
        torch = _torch()
        if device == "auto":
            device = "cuda" if torch.cuda.is_available() else "cpu"
        model = _build_torch_model(torch, config)
        model.load_state_dict(artifact["state"])
        model.to(device).eval()
        outs = []
        with torch.no_grad():
            for start in range(0, len(rows), 4096):
                index = range(start, min(len(rows), start + 4096))
                outs.extend(model(*_batch_torch(torch, encoded, index, device)).cpu().tolist())
    else:
        np = _numpy()
        outs = _numpy_forward(np, artifact["state"], encoded).tolist()
    results = []
    for raw in outs:
        sig = [1.0 / (1.0 + math.exp(-max(-30.0, min(30.0, v)))) for v in raw]
        heads = {"prefix_quality": sig[0], "residual": sig[1], "frame_delta": raw[2],
                 "save_mask_ok": sig[3], "exact_prob": sig[4]}
        heads["score"] = combine_score(heads, config["score_weights"])
        results.append({k: round(v, 8) for k, v in heads.items()})
    return results


def heuristic_scores(rows: list[dict]) -> list[float]:
    """Cheap label-free CPU baseline: smaller edits first (fewer, simpler mutation tokens)."""
    scores = []
    for row in rows:
        tokens = _tokens(row)
        complexity = len(tokens) + 0.1 * sum(len(canonical_token(t)) for t in tokens)
        scores.append(-complexity)
    return scores


def original_scores(rows: list[dict]) -> list[float]:
    return [-float(row.get("generation_index", 0)) for row in rows]


def random_scores(rows: list[dict], seed: int) -> list[float]:
    return [((_stable_seed("random-order", seed, row.get("candidate_id", i)) % (1 << 52)) / float(1 << 52))
            for i, row in enumerate(rows)]


# --------------------------------------------------------------------------- evaluation

def _order(pool: list[int], rows: list[dict], scores: list[float]) -> list[int]:
    return sorted(pool, key=lambda i: (-scores[i], rows[i].get("generation_index", 0), str(rows[i].get("candidate_id", ""))))


def _pool_metrics(pools: dict, rows, scores, ks) -> dict:
    costs, seconds, hits = [], [], {k: 0 for k in ks}
    exact_total, exact_found = 0, {k: 0 for k in ks}
    no_exact_pools, no_exact_spend = 0, 0
    for key in sorted(pools):
        ordered = _order(pools[key], rows, scores)
        flags = [bool(rows[i]["labels"]["exact"]) for i in ordered]
        if not any(flags):
            no_exact_pools += 1
            no_exact_spend += len(ordered)
            continue
        first = flags.index(True) + 1
        costs.append(first)
        timed = [(rows[i].get("provenance") or {}).get("compile_seconds") for i in ordered[:first]]
        if all(isinstance(t, (int, float)) for t in timed):
            seconds.append(float(sum(timed)))
        exact_total += sum(flags)
        for k in ks:
            hits[k] += 1 if first <= k else 0
            exact_found[k] += sum(flags[:k])
    n = len(costs)
    return {
        "pools": len(pools),
        "pools_with_exact": n,
        "pools_without_exact": no_exact_pools,
        "compiles_spent_on_pools_without_exact": no_exact_spend,
        "exact_candidates": exact_total,
        "mean_compiles_to_first_exact": round(sum(costs) / n, 6) if n else None,
        "median_compiles_to_first_exact": (sorted(costs)[n // 2] if n else None),
        "mean_compile_seconds_to_first_exact": (round(sum(seconds) / len(seconds), 6) if seconds and len(seconds) == n else None),
        "exact_recall_at_k": {str(k): (round(hits[k] / n, 6) if n else 0.0) for k in ks},
        "exact_candidate_recall_at_k": {str(k): (round(exact_found[k] / exact_total, 6) if exact_total else 0.0) for k in ks},
    }


def evaluate(rows: list[dict], orderings: dict, ks=DEFAULT_KS) -> dict:
    """Compiles-to-first-exact and top-k exact recall per ordering, overall and per mutation family.

    ``orderings`` maps a name to scores aligned with ``rows`` (higher compiles earlier).
    Ties break on generation_index then candidate_id.  Pools are
    (repo, source_revision, canonical_hash, compiler_lane).
    """
    ks = tuple(int(k) for k in ks)
    pools: dict = {}
    fam_pools: dict = {}
    for i, row in enumerate(rows):
        pools.setdefault(pool_key(row), []).append(i)
        fam_pools.setdefault(_family(row), {}).setdefault(pool_key(row), []).append(i)
    report = {"ks": list(ks), "rows": len(rows), "orderings": {}}
    for name in sorted(orderings):
        scores = orderings[name]
        if isinstance(scores, dict):
            scores = scores["scores"]
        if len(scores) != len(rows):
            raise ValueError(f"ordering {name!r} has {len(scores)} scores for {len(rows)} rows")
        entry = _pool_metrics(pools, rows, scores, ks)
        entry["per_family"] = {fam: _pool_metrics(fam_pools[fam], rows, scores, ks) for fam in sorted(fam_pools)}
        report["orderings"][name] = entry
    return report


def average_random(rows, ks, repeats: int, seed: int) -> dict:
    """Random baseline averaged over seeded repeats (reduces single-shuffle noise)."""
    repeats = max(1, int(repeats))
    runs = [evaluate(rows, {"r": random_scores(rows, seed + r)}, ks)["orderings"]["r"] for r in range(repeats)]
    base = json.loads(json.dumps(runs[0]))

    def avg(get):
        values = [get(run) for run in runs]
        if any(v is None for v in values):
            return None
        return round(sum(values) / len(values), 6)

    def merge(target, source_runs_get):
        for key in ("mean_compiles_to_first_exact", "mean_compile_seconds_to_first_exact"):
            target[key] = avg(lambda run: source_runs_get(run)[key])
        for key in ("exact_recall_at_k", "exact_candidate_recall_at_k"):
            for k in list(target[key]):
                target[key][k] = avg(lambda run: source_runs_get(run)[key][k])
        target["median_compiles_to_first_exact"] = None

    merge(base, lambda run: run)
    for fam in base["per_family"]:
        merge(base["per_family"][fam], lambda run, fam=fam: run["per_family"][fam])
    base["random_repeats"] = repeats
    base["random_seed"] = seed
    return base


def gate(report: dict, criteria: dict | None = None) -> dict:
    """Machine-readable acceptance verdict.  Never claims savings without measured exacts."""
    crit = dict(DEFAULT_CRITERIA)
    reasons: list[str] = []
    unknown = sorted(set(criteria or {}) - set(DEFAULT_CRITERIA))
    if unknown:
        raise ValueError(f"unknown gate criteria keys: {unknown}")
    crit.update(criteria or {})
    for key in ("min_factor", "min_relative_reduction", "recall_k", "min_pools_with_exact"):
        value = crit[key]
        if isinstance(value, bool) or not isinstance(value, (int, float)) or not math.isfinite(value):
            raise ValueError(f"gate criterion {key} must be a finite number, got {value!r}")
    if not isinstance(crit["baselines"], list) or not crit["baselines"]:
        raise ValueError("gate criterion baselines must be a non-empty list")
    # Criteria may be made stricter, never weaker than the defaults, for a savings claim.
    weakened = []
    for key in ("min_factor", "min_relative_reduction", "min_pools_with_exact"):
        if crit[key] < DEFAULT_CRITERIA[key]:
            weakened.append(key)
    if crit["recall_k"] > DEFAULT_CRITERIA["recall_k"]:
        weakened.append("recall_k")
    if not set(DEFAULT_CRITERIA["baselines"]) <= set(crit["baselines"]):
        weakened.append("baselines")
    if crit["required_split_mode"] != "repo":
        weakened.append("required_split_mode")
    if crit["candidate_ordering"] in crit["baselines"]:
        weakened.append("candidate_ordering")
    verdict = {"criteria": crit, "claimed_savings": False, "verdict": "reject", "reasons": reasons,
               "weakened_criteria": weakened}
    if weakened:
        reasons.append(f"criteria weaker than defaults ({', '.join(weakened)}); informational only, no claim")
    orderings = report.get("orderings") or {}
    candidate = orderings.get(crit["candidate_ordering"])
    if report.get("split_mode") != crit["required_split_mode"]:
        reasons.append(f"split_mode {report.get('split_mode')!r} != required {crit['required_split_mode']!r}")
        verdict["verdict"] = "not_applicable"
    if report.get("leakage_check") != "passed":
        reasons.append(f"leakage_check is {report.get('leakage_check')!r}, not 'passed'")
        verdict["verdict"] = "not_applicable"
    if weakened:
        verdict["verdict"] = "not_applicable"
    if str(crit["recall_k"]) not in {str(k) for k in report.get("ks", [])}:
        reasons.append(f"recall_k {crit['recall_k']} was not evaluated (ks={report.get('ks')})")
        verdict["verdict"] = "not_applicable"
    if report.get("synthetic_rows"):
        reasons.append(f"{report['synthetic_rows']} rows carry synthetic labels; savings require authoritative CPU labels")
        verdict["verdict"] = "not_applicable"
    if candidate is None:
        reasons.append(f"ordering {crit['candidate_ordering']!r} missing")
        verdict["verdict"] = "not_applicable"
        return verdict
    pools_with_exact = candidate.get("pools_with_exact", 0)
    if pools_with_exact < crit["min_pools_with_exact"] or candidate.get("mean_compiles_to_first_exact") is None:
        reasons.append("no exact candidates in evaluation set; nothing to save")
        verdict["verdict"] = "not_applicable"
        return verdict
    baseline_costs = {}
    for name in crit["baselines"]:
        entry = orderings.get(name)
        if entry is None or entry.get("mean_compiles_to_first_exact") is None:
            reasons.append(f"baseline {name!r} missing")
            verdict["verdict"] = "not_applicable"
            return verdict
        baseline_costs[name] = entry["mean_compiles_to_first_exact"]
    best_name = min(baseline_costs, key=lambda n: (baseline_costs[n], n))
    best = baseline_costs[best_name]
    model_cost = candidate["mean_compiles_to_first_exact"]
    factor = best / model_cost if model_cost > 0 else math.inf
    relative = 1.0 - model_cost / best if best > 0 else 0.0
    recall = candidate["exact_recall_at_k"].get(str(crit["recall_k"]), 0.0)
    verdict.update({
        "best_baseline": best_name,
        "best_baseline_mean_compiles_to_first_exact": best,
        "model_mean_compiles_to_first_exact": model_cost,
        "reduction_factor": round(factor, 6),
        "relative_reduction": round(relative, 6),
        "model_exact_recall_at_recall_k": recall,
        "pools_with_exact": pools_with_exact,
    })
    passes = factor >= crit["min_factor"] or (relative >= crit["min_relative_reduction"] and recall > 0)
    if verdict["verdict"] == "not_applicable":
        reasons.append("metrics computed for information only; not a claim")
        return verdict
    if passes:
        verdict["verdict"] = "accept"
        verdict["claimed_savings"] = True
        reasons.append(f"model {model_cost} vs best baseline {best_name} {best}: factor {factor:.3f}, "
                       f"relative {relative:.3f}, recall@{crit['recall_k']} {recall}")
    else:
        reasons.append(f"model {model_cost} vs best baseline {best_name} {best}: factor {factor:.3f} < "
                       f"{crit['min_factor']} and relative {relative:.3f} < {crit['min_relative_reduction']} "
                       f"(or zero recall)")
    return verdict


def _validated(rows, label: str, bytes_root=None) -> list[dict]:
    """Re-validate rows against the contract.

    With ``bytes_root`` the labels are recomputed from the authoritative byte files.
    Without it, byte paths are ignored and the (builder-written) labels must be present
    and internally consistent.
    """
    builder = _builder()
    root = Path(bytes_root) if bytes_root else None
    out = []
    for number, row in enumerate(rows, 1):
        probe = row
        if root is None and ("target_bytes_path" in row or "candidate_bytes_path" in row):
            probe = {k: v for k, v in row.items() if k not in ("target_bytes_path", "candidate_bytes_path")}
        try:
            out.append(builder.validate_row(probe, root))
        except builder.ContractError as exc:
            raise SystemExit(f"{label}: row {number} ({row.get('candidate_id')}) rejected: {exc}") from exc
    return out


def full_evaluation(artifact, test_rows, manifest=None, ks=DEFAULT_KS, random_repeats=32, seed=0,
                    criteria=None, device="auto", train_rows_for_leakage=None) -> dict:
    """Evaluate model vs CPU baselines on labeled test rows and attach the gating verdict."""
    builder = _builder()
    leakage = "passed"
    leakage_detail = None
    split_mode = (manifest or {}).get("mode", "unknown")
    test_hashes = {pool_key(r)[2] for r in test_rows}
    test_digests = {str(r["candidate_source_digest"]) for r in test_rows if r.get("candidate_source_digest")}
    test_repos = {str(r.get("repo", "")) for r in test_rows}
    missing = [k for k in ("train_canonical_hashes", "train_repos", "train_source_digests") if k not in artifact]
    if missing:
        leakage, leakage_detail = "failed", f"artifact lacks {missing}; cannot prove disjointness (fail closed)"
    else:
        overlap = test_hashes & set(artifact["train_canonical_hashes"])
        digest_overlap = test_digests & set(artifact["train_source_digests"])
        repo_overlap = test_repos & set(artifact["train_repos"])
        if overlap:
            leakage = "failed"
            leakage_detail = f"{len(overlap)} canonical function hashes appear in both model training data and test"
        elif digest_overlap:
            leakage = "failed"
            leakage_detail = f"{len(digest_overlap)} candidate source digests appear in both training data and test"
        elif split_mode == "repo" and repo_overlap:
            leakage = "failed"
            leakage_detail = f"split_mode 'repo' but {len(repo_overlap)} test repos were in model training data"
    if train_rows_for_leakage is not None and leakage == "passed":
        try:
            builder.check_leakage({"train": train_rows_for_leakage, "test": test_rows})
        except builder.LeakageError as exc:
            leakage, leakage_detail = "failed", str(exc)
    if manifest is not None and manifest.get("leakage_check") != "passed":
        leakage, leakage_detail = "failed", "manifest does not record a passed leakage check"
    timings = {}
    started = time.perf_counter()
    preds = predict(artifact, test_rows, device=device)
    timings["model"] = time.perf_counter() - started
    orderings = {"model": [p["score"] for p in preds]}
    for name, func in (("original", original_scores), ("heuristic", heuristic_scores)):
        started = time.perf_counter()
        orderings[name] = func(test_rows)
        timings[name] = time.perf_counter() - started
    started = time.perf_counter()
    report = evaluate(test_rows, orderings, ks)
    started = time.perf_counter()
    report["orderings"]["random"] = average_random(test_rows, ks, random_repeats, seed)
    timings["random"] = (time.perf_counter() - started) / max(1, random_repeats)
    for name, seconds in timings.items():
        report["orderings"][name]["ranking_wall_seconds"] = round(seconds, 6)
    report.update({
        "format": REPORT_FORMAT,
        "split_mode": split_mode,
        "leakage_check": leakage,
        "leakage_detail": leakage_detail,
        "synthetic_rows": sum(1 for r in test_rows if is_synthetic(r)),
        "model": {"backend": artifact["backend"], "parameters": artifact["parameters"],
                  "device": artifact.get("device"), "train_seconds": artifact.get("train_seconds")},
        "test_repos": sorted(test_repos),
        "per_family_note": ("per_family metrics rank each family's candidates within their own pool "
                            "(within-family sub-pools), not the family's share of the global ordering"),
        "note": ("Rankings only prioritise CPU compiles; every exact label comes from the authoritative "
                 "CPU compiler and byte matcher."),
    })
    report["gate"] = gate(report, criteria)
    return report


# --------------------------------------------------------------------------- synthetic data (tests/selftest only)

def synthetic_rows(seed: int = 0, repos: int = 4, functions_per_repo: int = 6, pool_size: int = 60,
                   with_exact: bool = True) -> list[dict]:
    """Synthetic rows for tests/selftest.  Marked provenance.synthetic so gate() never claims savings."""
    rng = random.Random(seed)
    families = ["commute", "temp_var", "cast", "reorder", "loop_form"]
    good = {"temp_var": "reuse_local", "cast": "u32_cast"}
    rows = []
    for r in range(repos):
        for f in range(functions_per_repo):
            canonical = hashlib.sha256(f"syn-{seed}-{r}-{f}".encode()).hexdigest()
            total = 20 + 4 * f
            exact_slot = rng.randrange(pool_size // 2, pool_size) if with_exact else -1
            for g in range(pool_size):
                family = families[(g * 7 + f) % len(families)]
                tokens = [f"{family}_{rng.randrange(6)}"]
                is_exact = g == exact_slot
                if is_exact:
                    family = "temp_var" if f % 2 == 0 else "cast"
                    tokens = [good[family], "keep_order"]
                elif rng.random() < 0.15:
                    family = "temp_var" if rng.random() < 0.5 else "cast"
                    tokens = [good[family]] + ([f"noise_{rng.randrange(4)}"] if rng.random() < 0.5 else [])
                if is_exact:
                    labels = {"exact": True, "first_mismatch_word": None, "matching_prefix_words": total,
                              "word_distance": 0, "byte_distance": 0, "target_words": total,
                              "frame_size_delta": 0, "save_mask_xor": 0}
                else:
                    near = tokens[0] in good.values()
                    prefix = rng.randrange(total // 2, total - 1) if near else rng.randrange(0, total // 2)
                    dist = rng.randrange(1, 3) if near else rng.randrange(3, total)
                    labels = {"exact": False, "first_mismatch_word": prefix, "matching_prefix_words": prefix,
                              "word_distance": dist, "byte_distance": dist * 3, "target_words": total,
                              "frame_size_delta": 0 if near else rng.choice([0, 8, -8]),
                              "save_mask_xor": 0 if near else rng.choice([0, 1 << 16])}
                rows.append({
                    "schema": "n64-precompile-surrogate/v1",
                    "candidate_id": f"syn{seed}-r{r}-f{f}-g{g}",
                    "project": "synthetic",
                    "repo": f"synthetic/repo{r}",
                    "source_revision": "sha256:" + hashlib.sha256(f"rev-{seed}-{r}".encode()).hexdigest(),
                    "function": {"name": f"func_{r}_{f}", "canonical_hash": canonical},
                    "generation_index": g,
                    "mutation": {"family": family, "tokens": tokens},
                    "compiler_lane": ["ido5.3:-O2:-g3", "kmc-gcc2.7.2:-O2"][r % 2],
                    "structural": {"source_lines": 10 + f, "loops": f % 3},
                    "labels": labels,
                    "provenance": {"compiler": "synthetic-fixture", "matcher": "synthetic-fixture",
                                   "verified": True, "label_origin": "authoritative_cpu_compile",
                                   "synthetic": True, "compile_seconds": 0.5},
                })
    return rows


# --------------------------------------------------------------------------- CLI

def _cmd_train(args) -> int:
    config = json.loads(Path(args.config).read_text()) if args.config else {}
    if args.seed is not None:
        config["seed"] = args.seed
    if args.epochs is not None:
        config["epochs"] = args.epochs
    train_rows = _validated(read_jsonl(args.train), args.train, args.bytes_root)
    valid_rows = _validated(read_jsonl(args.valid), args.valid, args.bytes_root) if args.valid else []
    hard = [r.get("candidate_id") for r in read_jsonl(args.hard_negatives)] if args.hard_negatives else []
    artifact = train_model(train_rows, valid_rows, config, backend=args.backend, device=args.device,
                           hard_negative_ids=hard)
    save_artifact(artifact, args.out)
    summary = {k: artifact[k] for k in ("backend", "device", "parameters", "train_rows", "train_seconds")}
    summary["final"] = artifact["history"][-1] if artifact["history"] else None
    print(json.dumps(summary, sort_keys=True))
    return 0


def _cmd_evaluate(args) -> int:
    artifact = load_artifact(args.model)
    test_rows = _validated(read_jsonl(args.test), args.test, args.bytes_root)
    manifest = json.loads(Path(args.manifest).read_text()) if args.manifest else None
    criteria = json.loads(Path(args.criteria).read_text()) if args.criteria else None
    train_rows = None
    if manifest is not None:
        recorded = (manifest.get("files") or {}).get("test.jsonl")
        actual = hashlib.sha256(Path(args.test).read_bytes()).hexdigest()
        if recorded != actual:
            # The manifest does not describe this test file: refuse to inherit its split mode.
            manifest = {"mode": "unbound", "leakage_check": "unbound-manifest"}
        else:
            train_rows = []
            for name in ("train.jsonl", "valid.jsonl"):
                path = Path(args.manifest).with_name(name)
                if path.exists():
                    train_rows += read_jsonl(path)
    ks = tuple(int(k) for k in args.ks.split(","))
    report = full_evaluation(artifact, test_rows, manifest, ks=ks, random_repeats=args.random_repeats,
                             seed=args.seed, criteria=criteria, device=args.device,
                             train_rows_for_leakage=train_rows)
    write_json(args.out, report)
    print(json.dumps(report["gate"], sort_keys=True))
    return 0


def _cmd_rank(args) -> int:
    artifact = load_artifact(args.model)
    rows = read_jsonl(args.candidates)
    for number, row in enumerate(rows, 1):
        missing = [k for k in ("candidate_id", "mutation", "compiler_lane") if k not in row]
        if missing:
            raise SystemExit(f"{args.candidates}: row {number} missing pre-compile fields {missing}")
    preds = predict(artifact, rows, device=args.device)
    def _gen(row):
        value = row.get("generation_index", 0)
        return value if isinstance(value, int) and not isinstance(value, bool) else 0

    order = sorted(range(len(rows)), key=lambda i: (-preds[i]["score"], _gen(rows[i]), str(rows[i]["candidate_id"])))
    if args.top < 0:
        raise SystemExit("--top must be >= 0")
    if args.top:
        order = order[:args.top]
    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as handle:
        for rank, i in enumerate(order, 1):
            row = {k: v for k, v in rows[i].items() if k != "labels"}
            row["surrogate"] = dict(preds[i], rank=rank,
                                    note="priority only; exactness requires CPU compile + byte match")
            handle.write(json.dumps(row, sort_keys=True) + "\n")
    print(json.dumps({"ranked": len(order), "out": str(args.out)}))
    return 0


def _cmd_selftest(args) -> int:
    rows = synthetic_rows(seed=args.seed)
    train = [r for r in rows if r["repo"] != "synthetic/repo3"]
    test = [r for r in rows if r["repo"] == "synthetic/repo3"]
    artifact = train_model(train, [], {"epochs": 5, "buckets": 1 << 12, "seed": args.seed}, backend=args.backend)
    report = full_evaluation(artifact, test, {"mode": "repo", "leakage_check": "passed"}, seed=args.seed)
    summary = {name: entry["mean_compiles_to_first_exact"] for name, entry in report["orderings"].items()}
    print(json.dumps({"selftest": "ok", "mean_compiles_to_first_exact": summary, "gate": report["gate"]},
                     sort_keys=True))
    return 0 if not report["gate"]["claimed_savings"] else 1


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    train = sub.add_parser("train", help="train the multi-head ranker")
    train.add_argument("--train", required=True)
    train.add_argument("--valid")
    train.add_argument("--hard-negatives")
    train.add_argument("--out", required=True)
    train.add_argument("--config", help="JSON file overriding DEFAULT_CONFIG")
    train.add_argument("--seed", type=int)
    train.add_argument("--bytes-root", help="recompute labels from byte files under this root")
    train.add_argument("--epochs", type=int)
    train.add_argument("--backend", choices=("auto", "torch", "numpy"), default="auto")
    train.add_argument("--device", default="auto", help="auto|cpu|cuda[:N] (torch backend)")
    train.set_defaults(func=_cmd_train)
    ev = sub.add_parser("evaluate", help="compare model ranking with CPU baselines and gate")
    ev.add_argument("--model", required=True)
    ev.add_argument("--test", required=True)
    ev.add_argument("--manifest", help="manifest.json from build_gpu_surrogate_dataset.py build")
    ev.add_argument("--criteria", help="JSON file overriding DEFAULT_CRITERIA")
    ev.add_argument("--out", required=True)
    ev.add_argument("--bytes-root", help="recompute labels from byte files under this root")
    ev.add_argument("--ks", default=",".join(str(k) for k in DEFAULT_KS))
    ev.add_argument("--random-repeats", type=int, default=32)
    ev.add_argument("--seed", type=int, default=0)
    ev.add_argument("--device", default="auto")
    ev.set_defaults(func=_cmd_evaluate)
    rank = sub.add_parser("rank", help="order pending (uncompiled) candidates for CPU compilation")
    rank.add_argument("--model", required=True)
    rank.add_argument("--candidates", required=True)
    rank.add_argument("--out", required=True)
    rank.add_argument("--top", type=int, default=0)
    rank.add_argument("--device", default="auto")
    rank.set_defaults(func=_cmd_rank)
    selftest = sub.add_parser("selftest", help="synthetic CPU end-to-end check")
    selftest.add_argument("--seed", type=int, default=0)
    selftest.add_argument("--backend", choices=("auto", "torch", "numpy"), default="numpy")
    selftest.set_defaults(func=_cmd_selftest)
    return parser


def main(argv=None) -> int:
    args = build_parser().parse_args(argv)
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
