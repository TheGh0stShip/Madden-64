#!/usr/bin/env python3
"""GPU-assisted ranking for expensive decompilation-permuter candidates.

The compiler and exact byte matcher remain the oracle.  This tool only learns
which already-generated C candidates should consume the next CPU compile slots.
It uses stable hashed sparse features, a tiny EmbeddingBag model, and JSONL so
the permuter can retain a complete, reproducible replay log.

JSONL records use these fields:
  id, function, source, mutations, parent_score
Labeled records additionally use:
  score, compiled (true), exact (optional)

Commands:
  train DATA.jsonl MODEL.pt
  rank MODEL.pt CANDIDATES.jsonl RANKED.jsonl
  selftest
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import random
import re
from pathlib import Path

TOKEN = re.compile(r"[A-Za-z_]\w*|0[xX][0-9A-Fa-f]+|\d+|==|!=|<=|>=|<<|>>|&&|\|\||[-+*/%&|^~!<>=?:;,{}()[\]]")
BUCKETS = 1 << 18


def _torch():
    try:
        import torch
        return torch
    except ImportError as exc:
        raise SystemExit("PyTorch is required; run this with the Desktop GPU Python") from exc


def _hash(text: str, buckets: int = BUCKETS) -> int:
    return int.from_bytes(hashlib.blake2s(text.encode(), digest_size=8).digest(), "little") % buckets


def features(row: dict, buckets: int = BUCKETS) -> list[int]:
    """Stable categorical features; no Python hash randomization."""
    toks = TOKEN.findall(row.get("source", ""))
    out = [
        _hash("fn=" + row.get("function", "?"), buckets),
        _hash("score_bin=" + str(int(math.log2(max(1, int(row.get("parent_score", 1)))))), buckets),
        _hash("ntok_bin=" + str(min(len(toks) // 16, 255)), buckets),
    ]
    mutations = row.get("mutations", [])
    if isinstance(mutations, str):
        mutations = [mutations]
    for pos, mutation in enumerate(mutations):
        out.append(_hash(f"mut={mutation}", buckets))
        out.append(_hash(f"mutpos={pos}:{mutation}", buckets))
    # Local token n-grams capture declaration/statement ordering without a large parser model.
    for n in (1, 2, 3):
        for i in range(max(0, len(toks) - n + 1)):
            out.append(_hash(f"t{n}=" + " ".join(toks[i:i + n]), buckets))
    return sorted(set(out))


class RankerModel:
    def __init__(self, buckets: int = BUCKETS, dim: int = 48):
        torch = _torch()
        nn = torch.nn
        self.module = nn.ModuleDict({
            "embed": nn.EmbeddingBag(buckets, dim, mode="mean"),
            "body": nn.Sequential(nn.Linear(dim + 2, 64), nn.SiLU(), nn.Linear(64, 32), nn.SiLU()),
            "improve": nn.Linear(32, 1),
            "exact": nn.Linear(32, 1),
        })
        self.buckets = buckets
        self.dim = dim

    def parameters(self):
        return self.module.parameters()

    def to(self, device):
        self.module.to(device)
        return self

    def state_dict(self):
        return self.module.state_dict()

    def load_state_dict(self, state):
        self.module.load_state_dict(state)

    def encode(self, indices, offsets, numeric):
        torch = _torch()
        emb = self.module["embed"](indices, offsets)
        return self.module["body"](torch.cat((emb, numeric), dim=1))

    def __call__(self, indices, offsets, numeric):
        hidden = self.encode(indices, offsets, numeric)
        return self.module["improve"](hidden).squeeze(1), self.module["exact"](hidden).squeeze(1)


def read_jsonl(path: Path) -> list[dict]:
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]


def _batch(rows: list[dict], device, buckets: int = BUCKETS):
    torch = _torch()
    flat, offsets = [], []
    numeric = []
    for row in rows:
        offsets.append(len(flat))
        cached = row.get("_features")
        if cached is None:
            cached = features(row, buckets)
        flat.extend(cached)
        parent = max(1, int(row.get("parent_score", 1)))
        numeric.append((math.log1p(parent) / 12.0, min(len(row.get("source", "")) / 20000.0, 2.0)))
    return (torch.tensor(flat, dtype=torch.long, device=device),
            torch.tensor(offsets, dtype=torch.long, device=device),
            torch.tensor(numeric, dtype=torch.float32, device=device))


def _labels(rows: list[dict], device):
    torch = _torch()
    improvements, exact = [], []
    for row in rows:
        parent, score = max(1, int(row["parent_score"])), int(row["score"])
        improvements.append(max(-1.0, min(1.0, (parent - score) / parent)))
        exact.append(1.0 if score == 0 or row.get("exact") else 0.0)
    return (torch.tensor(improvements, dtype=torch.float32, device=device),
            torch.tensor(exact, dtype=torch.float32, device=device))


def split_rows(rows: list[dict]) -> tuple[list[dict], list[dict]]:
    """Hold out complete seeds when possible, otherwise the tail of one run.

    A random row split badly overstates performance because adjacent permuter
    candidates are near duplicates.  The replay logger records the RNG seed
    and iteration, so multi-seed functions can be evaluated on an unseen
    mutation lineage.  Single-seed functions use a temporal tail split until
    another independent seed exists.
    """
    by_function: dict[str, list[dict]] = {}
    for row in rows:
        by_function.setdefault(row.get("function", "?"), []).append(row)
    train_rows, valid_rows = [], []
    for function_rows in by_function.values():
        seeds = sorted({str(row.get("seed", "missing")) for row in function_rows})
        if len(seeds) >= 2:
            valid_seed = seeds[-1]
            for row in function_rows:
                (valid_rows if str(row.get("seed", "missing")) == valid_seed
                 else train_rows).append(row)
        else:
            ordered = sorted(function_rows, key=lambda row: int(row.get("iteration", 0)))
            cut = max(1, int(len(ordered) * 0.8))
            train_rows.extend(ordered[:cut])
            valid_rows.extend(ordered[cut:])
    return train_rows, valid_rows


def train(data: Path, model_path: Path, epochs: int, seed: int) -> dict:
    torch = _torch()
    random.seed(seed)
    torch.manual_seed(seed)
    unique = {}
    for row in read_jsonl(data):
        if row.get("compiled") and "score" in row:
            unique[(row.get("function"), row.get("id"))] = row
    rows = list(unique.values())
    if len(rows) < 32:
        raise SystemExit("need at least 32 labeled candidates before training")
    train_rows, valid_rows = split_rows(rows)
    # Tokenization and stable hashing are CPU work. Cache them once so every
    # epoch feeds the GPU instead of redoing the same Python string work.
    for row in rows:
        row["_features"] = features(row)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = RankerModel().to(device)
    optimizer = torch.optim.AdamW(model.parameters(), lr=2e-3, weight_decay=1e-4)
    batch_size = 512
    exact_positives = sum(1 for row in train_rows
                          if row.get("exact") or int(row["score"]) == 0)
    model.module.train()
    for _ in range(epochs):
        random.shuffle(train_rows)
        for start in range(0, len(train_rows), batch_size):
            chunk = train_rows[start:start + batch_size]
            indices, offsets, numeric = _batch(chunk, device)
            y_improve, y_exact = _labels(chunk, device)
            p_improve, p_exact = model(indices, offsets, numeric)
            loss = torch.nn.functional.smooth_l1_loss(p_improve, y_improve)
            # Exact matches are rare, so cap the positive weight for stability.
            if exact_positives:
                positives = max(1, int(y_exact.sum().item()))
                pos_weight = torch.tensor(min(32.0, (len(chunk) - positives) / positives), device=device)
                loss += 0.25 * torch.nn.functional.binary_cross_entropy_with_logits(
                    p_exact, y_exact, pos_weight=pos_weight)
            optimizer.zero_grad(set_to_none=True)
            loss.backward()
            optimizer.step()
    metrics = evaluate(model, valid_rows, device, use_exact=bool(exact_positives))
    metrics["training_rows"] = len(train_rows)
    metrics["split"] = "seed-lineage-or-temporal-tail"
    metrics["exact_positives"] = exact_positives
    torch.save({"state": model.state_dict(), "buckets": model.buckets, "dim": model.dim,
                "metrics": metrics, "rows": len(rows), "seed": seed,
                "exact_positives": exact_positives}, model_path)
    return {"device": str(device), "rows": len(rows), **metrics}


def evaluate(model: RankerModel, rows: list[dict], device, use_exact: bool) -> dict:
    torch = _torch()
    if not rows:
        return {"validation_rows": 0, "top_quartile_hit_rate": 0.0, "random_hit_rate": 0.0}
    model.module.eval()
    with torch.no_grad():
        indices, offsets, numeric = _batch(rows, device, model.buckets)
        improve, exact = model(indices, offsets, numeric)
        priority = improve
        if use_exact:
            priority = priority + 2.0 * torch.sigmoid(exact)
        priority = priority.cpu().tolist()
    # Strict improvements are often absent in an honest held-out mutation
    # lineage.  Avoiding regressions is still useful: it rejects candidates
    # that cannot improve the current parent before spending a compile slot.
    actual = [int(r["score"]) <= int(r["parent_score"]) for r in rows]
    ordered = sorted(range(len(rows)), key=lambda i: priority[i], reverse=True)
    k = max(1, len(rows) // 4)
    selected = ordered[:k]
    hits = sum(actual[i] for i in selected) / k
    pilot_k = max(1, round(len(rows) * 512 / 50000))
    pilot_hits = sum(actual[i] for i in ordered[:pilot_k]) / pilot_k
    baseline = sum(actual) / len(actual)
    return {"validation_rows": len(rows), "top_quartile_hit_rate": hits,
            "top_pilot_budget_hit_rate": pilot_hits,
            "random_hit_rate": baseline,
            "enabled": hits > baseline and pilot_hits > baseline}


def select_rows(rows: list[dict], explore: float, seed: int,
                select_count: int, embeddings=None,
                diversity: float = 0.0) -> tuple[list[dict], int]:
    """Put a fixed exploration/exploitation compile budget first."""
    rng = random.Random(seed)
    select_count = min(max(0, select_count), len(rows))
    explore_count = min(select_count, round(select_count * explore))
    exploration = rng.sample(rows, explore_count) if explore_count else []
    exploration_ids = {id(row) for row in exploration}
    candidates = [row for row in rows if id(row) not in exploration_ids]
    exploit_count = select_count - explore_count
    if embeddings is None or diversity <= 0.0 or exploit_count <= 1:
        exploitation = sorted(candidates,
                              key=lambda row: (row["model_priority"], row.get("id", "")),
                              reverse=True)[:exploit_count]
    else:
        torch = _torch()
        row_indices = {id(row): index for index, row in enumerate(rows)}
        candidate_indices = [row_indices[id(row)] for row in candidates]
        # Diversity only needs to separate the plausible front of the model's
        # ranking.  A bounded pool keeps the GPU similarity work predictable.
        candidate_indices.sort(key=lambda i: rows[i]["model_priority"], reverse=True)
        pool_indices = candidate_indices[:max(exploit_count, min(len(candidate_indices),
                                                                 exploit_count * 8))]
        pool = torch.nn.functional.normalize(embeddings[pool_indices], dim=1)
        quality = torch.tensor([rows[i]["model_priority"] for i in pool_indices],
                               dtype=torch.float32, device=pool.device)
        quality = (quality - quality.min()) / (quality.max() - quality.min() + 1e-8)
        selected_local = [int(torch.argmax(quality).item())]
        max_similarity = pool @ pool[selected_local[0]]
        available = torch.ones(len(pool_indices), dtype=torch.bool, device=pool.device)
        available[selected_local[0]] = False
        while len(selected_local) < min(exploit_count, len(pool_indices)):
            acquisition = quality + diversity * (1.0 - max_similarity)
            acquisition[~available] = -float("inf")
            chosen = int(torch.argmax(acquisition).item())
            selected_local.append(chosen)
            available[chosen] = False
            max_similarity = torch.maximum(max_similarity, pool @ pool[chosen])
        exploitation = [rows[pool_indices[i]] for i in selected_local]
    for row in exploitation:
        row["selection_arm"] = "model"
    for row in exploration:
        row["selection_arm"] = "random"
    selected = exploitation + exploration
    rng.shuffle(selected)
    selected_ids = {id(row) for row in selected}
    remaining = sorted((row for row in rows if id(row) not in selected_ids),
                       key=lambda row: (row["model_priority"], row.get("id", "")),
                       reverse=True)
    return selected + remaining, explore_count


def rank(model_path: Path, candidates: Path, output: Path, explore: float, seed: int,
         select_count: int, diversity: float = 0.25) -> dict:
    torch = _torch()
    saved = torch.load(model_path, map_location="cpu", weights_only=False)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = RankerModel(saved["buckets"], saved["dim"]).to(device)
    model.load_state_dict(saved["state"])
    rows = read_jsonl(candidates)
    model.module.eval()
    with torch.no_grad():
        all_priority, all_embeddings = [], []
        for start in range(0, len(rows), 8192):
            chunk = rows[start:start + 8192]
            indices, offsets, numeric = _batch(chunk, device, model.buckets)
            improve, exact = model(indices, offsets, numeric)
            hidden = model.encode(indices, offsets, numeric)
            priority = improve
            if saved.get("exact_positives", 0):
                priority = priority + 2.0 * torch.sigmoid(exact)
            all_priority.extend(priority.cpu().tolist())
            all_embeddings.append(hidden)
    for row, priority in zip(rows, all_priority):
        row["model_priority"] = priority
        row["selection_arm"] = "unselected"
    selected_count = min(max(0, select_count), len(rows))
    embeddings = torch.cat(all_embeddings, dim=0) if all_embeddings else None
    rows, explore_count = select_rows(rows, explore, seed, selected_count,
                                      embeddings=embeddings, diversity=diversity)
    output.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in rows))
    return {"device": str(device), "candidates": len(rows), "explore": explore,
            "diversity": diversity,
            "selected": selected_count, "exploration_selected": explore_count,
            "training_metrics": saved.get("metrics", {})}


def selftest() -> dict:
    import tempfile
    rng = random.Random(7)
    with tempfile.TemporaryDirectory(prefix="gpu-ranker-") as tmp:
        root = Path(tmp)
        labeled = root / "labeled.jsonl"
        candidates = root / "candidates.jsonl"
        model = root / "model.pt"
        ranked = root / "ranked.jsonl"
        records = []
        for i in range(512):
            good = i % 5 == 0
            records.append({"id": i, "function": "demo", "source": f"int x{i}; x = a {'+' if good else '-'} b;",
                            "mutations": ["commute" if good else "flip"], "parent_score": 20,
                            "score": 8 if good else 22, "compiled": True, "exact": False})
        labeled.write_text("".join(json.dumps(r) + "\n" for r in records))
        candidates.write_text("".join(json.dumps({k: v for k, v in r.items() if k not in {"score", "compiled", "exact"}}) + "\n"
                                      for r in records[:128]))
        metrics = train(labeled, model, epochs=8, seed=7)
        ranked_metrics = rank(model, candidates, ranked, explore=0.1, seed=7, select_count=64)
        assert len(read_jsonl(ranked)) == 128
        return {"train": metrics, "rank": ranked_metrics}


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    p_train = sub.add_parser("train")
    p_train.add_argument("data", type=Path)
    p_train.add_argument("model", type=Path)
    p_train.add_argument("--epochs", type=int, default=6)
    p_train.add_argument("--seed", type=int, default=1)
    p_rank = sub.add_parser("rank")
    p_rank.add_argument("model", type=Path)
    p_rank.add_argument("candidates", type=Path)
    p_rank.add_argument("output", type=Path)
    p_rank.add_argument("--explore", type=float, default=0.1)
    p_rank.add_argument("--seed", type=int, default=1)
    p_rank.add_argument("--select-count", type=int, default=512,
                        help="compile budget; exploration is this fraction of these slots")
    p_rank.add_argument("--diversity", type=float, default=0.25,
                        help="GPU embedding novelty weight for model-selected candidates")
    sub.add_parser("selftest")
    args = parser.parse_args(argv)
    if args.command == "train":
        result = train(args.data, args.model, args.epochs, args.seed)
    elif args.command == "rank":
        result = rank(args.model, args.candidates, args.output, args.explore, args.seed,
                      args.select_count, args.diversity)
    else:
        result = selftest()
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
