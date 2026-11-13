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
  replay MODEL.pt LABELED.jsonl
  retrieve LABELED.jsonl QUERIES.jsonl SUGGESTIONS.jsonl
  structural-score TARGET.bin CANDIDATES.jsonl SCORED.jsonl
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
MISMATCH_KINDS = ("instruction", "register", "immediate", "size", "ordering", "relocation")
MODEL_SCHEMA = 2
RETRIEVAL_BUCKETS = 1 << 13


def _torch():
    try:
        import torch
        return torch
    except ImportError as exc:
        raise SystemExit("PyTorch is required; run this with the Desktop GPU Python") from exc


def _hash(text: str, buckets: int = BUCKETS) -> int:
    return int.from_bytes(hashlib.blake2s(text.encode(), digest_size=8).digest(), "little") % buckets


def source_digest(row: dict) -> str:
    """Content identity used to avoid recompiling duplicate C candidates."""
    source = row.get("source", "").replace("\r\n", "\n").rstrip() + "\n"
    return hashlib.sha256(source.encode()).hexdigest()


def structural_family(row: dict) -> str:
    """Coarse reusable source family, available before compilation."""
    explicit = row.get("function_family")
    if explicit:
        return str(explicit)
    source = row.get("source", "")
    traits = []
    if re.search(r"\b(for|while|do)\b", source):
        traits.append("loop")
    if re.search(r"\bswitch\s*\(", source):
        traits.append("switch")
    if re.search(r"\b(float|double)\b", source):
        traits.append("fp")
    if re.search(r"\b(struct|union)\b", source):
        traits.append("aggregate")
    if re.search(r"\w+\s*\([^;{}]*\)\s*;", source):
        traits.append("calls")
    return "+".join(traits) if traits else "scalar"


def diff_signature(row: dict) -> str:
    """Bucket the parent's residual into a cross-function signature."""
    explicit = row.get("parent_diff_signature")
    if explicit:
        return str(explicit)
    counts = row.get("parent_mismatch_counts") or {}
    active = []
    for kind in MISMATCH_KINDS:
        count = max(0, int(counts.get(kind, 0)))
        if count:
            active.append(f"{kind}:{min(3, math.ceil(math.log2(count + 1)))}")
    return "+".join(active) if active else "unknown"


def features(row: dict, buckets: int = BUCKETS) -> list[int]:
    """Stable categorical features; no Python hash randomization."""
    toks = TOKEN.findall(row.get("source", ""))
    out = [
        # Exact function identity is deliberately excluded.  It lets a model
        # memorize one productive permuter run and then look impressive on a
        # second seed of the same function without transferring to unfinished
        # functions.  Family/signature fields are reusable across functions.
        _hash("family=" + structural_family(row), buckets),
        _hash("signature=" + diff_signature(row), buckets),
        _hash("score_bin=" + str(int(math.log2(max(1, int(row.get("parent_score", 1)))))), buckets),
        _hash("ntok_bin=" + str(min(len(toks) // 16, 255)), buckets),
        _hash("depth_bin=" + str(min(int(row.get("generation_depth", 0)) // 4, 63)), buckets),
    ]
    mutations = row.get("mutations", [])
    if isinstance(mutations, str):
        mutations = [mutations]
    for pos, mutation in enumerate(mutations):
        out.append(_hash(f"mut={mutation}", buckets))
        out.append(_hash(f"mutpos={pos}:{mutation}", buckets))
    if mutations:
        out.append(_hash(f"last_mut={mutations[-1]}", buckets))
    if len(mutations) >= 2:
        out.append(_hash(f"mut_pair={mutations[-2]}>{mutations[-1]}", buckets))
    parent_counts = row.get("parent_mismatch_counts") or {}
    for kind in MISMATCH_KINDS:
        count = max(0, int(parent_counts.get(kind, 0)))
        out.append(_hash(f"parent_{kind}={min(count, 15)}", buckets))
        if count:
            for mutation in mutations[-2:]:
                out.append(_hash(f"parent_{kind}>mut={mutation}", buckets))
    # Local token n-grams capture declaration/statement ordering without a large parser model.
    for n in (1, 2, 3):
        for i in range(max(0, len(toks) - n + 1)):
            out.append(_hash(f"t{n}=" + " ".join(toks[i:i + n]), buckets))
    return sorted(set(out))


def retrieval_features(row: dict, buckets: int = RETRIEVAL_BUCKETS) -> list[int]:
    """Cross-function context features available before the next mutation.

    Mutation names are deliberately excluded: retrieval asks which historical
    edit helped a structurally similar parent. Source identifiers are
    normalized so address-specific Madden symbols do not dominate similarity.
    """
    source = row.get("parent_source") or row.get("source", "")
    normalized = re.sub(r"\b(?:func|D)_[0-9A-Fa-f]{8}\b", "SYMBOL", source)
    toks = TOKEN.findall(normalized)
    out = {
        _hash("family=" + structural_family(dict(row, source=source)), buckets),
        _hash("signature=" + diff_signature(row), buckets),
        _hash("score_bin=" + str(int(math.log2(max(1, int(row.get("parent_score", 1)))))), buckets),
    }
    counts = row.get("parent_mismatch_counts") or {}
    for kind in MISMATCH_KINDS:
        out.add(_hash(f"parent_{kind}={min(max(0, int(counts.get(kind, 0))), 15)}", buckets))
    # Short token shingles preserve control-flow and declaration shape without
    # requiring a modern parser to accept the old compiler's C dialect.
    for n in (1, 2):
        for i in range(max(0, len(toks) - n + 1)):
            out.add(_hash(f"r{n}=" + " ".join(toks[i:i + n]), buckets))
    return sorted(out)


def retrieve_effects(labeled_path: Path, queries_path: Path, output_path: Path,
                     neighbors: int = 8) -> dict:
    """Retrieve mutation sequences that strictly improved similar parents.

    This is proposal guidance only. Every suggested edit must still produce
    genuine C, compile with KMC GCC, and pass the exact byte matcher.
    """
    torch = _torch()
    donors = []
    seen = set()
    for row in read_jsonl(labeled_path):
        if not row.get("compiled") or "score" not in row:
            continue
        if int(row["score"]) >= int(row.get("parent_score", row["score"])):
            continue
        mutations = row.get("mutations", [])
        if isinstance(mutations, str):
            mutations = [mutations]
        if not mutations:
            continue
        key = (row.get("function"), source_digest(row), tuple(mutations))
        if key not in seen:
            seen.add(key)
            donors.append(row)
    if not donors:
        raise SystemExit("retrieval corpus contains no strict-improvement donors")
    queries = read_jsonl(queries_path)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    def matrix(rows):
        result = torch.zeros((len(rows), RETRIEVAL_BUCKETS), dtype=torch.float32,
                             device=device)
        for index, row in enumerate(rows):
            cols = retrieval_features(row)
            result[index, cols] = 1.0 / math.sqrt(max(1, len(cols)))
        return result

    donor_matrix = matrix(donors)
    query_matrix = matrix(queries)
    similarities = query_matrix @ donor_matrix.T
    k = min(max(1, neighbors), len(donors))
    values, indices = torch.topk(similarities, k=k, dim=1)
    output_rows = []
    for query, scores, donor_indices in zip(queries, values.cpu().tolist(),
                                             indices.cpu().tolist()):
        suggestions = []
        used_mutations = set()
        for similarity, donor_index in zip(scores, donor_indices):
            donor = donors[donor_index]
            mutations = donor.get("mutations", [])
            if isinstance(mutations, str):
                mutations = [mutations]
            mutation_key = tuple(mutations)
            if mutation_key in used_mutations:
                continue
            used_mutations.add(mutation_key)
            suggestions.append({
                "mutations": mutations,
                "similarity": similarity,
                "donor_function": donor.get("function"),
                "donor_parent_score": int(donor.get("parent_score", 0)),
                "donor_score": int(donor["score"]),
            })
        result = dict(query)
        result["retrieved_effects"] = suggestions
        output_rows.append(result)
    output_path.write_text("".join(json.dumps(row, sort_keys=True) + "\n"
                                   for row in output_rows))
    return {"device": str(device), "donors": len(donors),
            "queries": len(queries), "neighbors": k}


class RankerModel:
    def __init__(self, buckets: int = BUCKETS, dim: int = 48):
        torch = _torch()
        nn = torch.nn
        self.module = nn.ModuleDict({
            "embed": nn.EmbeddingBag(buckets, dim, mode="mean"),
            "body": nn.Sequential(nn.Linear(dim + 2, 64), nn.SiLU(), nn.Linear(64, 32), nn.SiLU()),
            "improve": nn.Linear(32, 1),
            "strict": nn.Linear(32, 1),
            "exact": nn.Linear(32, 1),
            # Predict the residual shape, not merely whether a mutation is
            # non-regressing.  Exact matching is the all-zero residual.
            "residual": nn.Linear(32, len(MISMATCH_KINDS)),
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
        return (self.module["improve"](hidden).squeeze(1),
                self.module["strict"](hidden).squeeze(1),
                self.module["exact"](hidden).squeeze(1),
                self.module["residual"](hidden))


def read_jsonl(path: Path) -> list[dict]:
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]


def mips_fields(words):
    """Split raw MIPS words into fields used only for relaxed ranking.

    Exact matching always compares the original bytes.  Field scores help
    distinguish register-allocation near misses from opcode/immediate misses;
    they can order work but can never certify or reject a candidate.
    """
    torch = _torch()
    words = words.to(torch.int64)
    return torch.stack(((words >> 26) & 0x3F, (words >> 21) & 0x1F,
                        (words >> 16) & 0x1F, (words >> 11) & 0x1F,
                        (words >> 6) & 0x1F, words & 0x3F,
                        words & 0xFFFF), dim=-1)


def mips_operation_keys(words):
    """Return primary opcode plus the sub-opcode that actually selects an op."""
    torch = _torch()
    words = words.to(torch.int64)
    opcode = (words >> 26) & 0x3F
    funct = words & 0x3F
    rt = (words >> 16) & 0x1F
    key = opcode << 6
    key = torch.where(opcode == 0, key | funct, key)
    return torch.where(opcode == 1, key | rt, key)


def structural_scores(target: bytes, candidates: list[bytes], device=None,
                      chunk_size: int = 65536) -> list[dict]:
    """Score compiled candidates in large GPU batches without pruning any.

    MIPS instructions are fixed-width.  Candidates of a different size retain
    a size penalty; their common prefix is still characterized so the caller
    can choose the next mutation family.  A CPU byte comparison is deliberately
    used for the authoritative ``exact`` flag even when tensors live on CUDA.
    """
    torch = _torch()
    device = device or torch.device("cuda" if torch.cuda.is_available() else "cpu")
    if len(target) % 4:
        raise ValueError("target text length is not a multiple of four")
    target_words = torch.tensor(
        [int.from_bytes(target[i:i + 4], "big") for i in range(0, len(target), 4)],
        dtype=torch.int64, device=device)
    target_fields = mips_fields(target_words)
    target_operations = mips_operation_keys(target_words)
    results = []
    for start in range(0, len(candidates), chunk_size):
        chunk = candidates[start:start + chunk_size]
        same_length = [len(blob) == len(target) for blob in chunk]
        padded = []
        for blob in chunk:
            common = blob[:len(target)].ljust(len(target), b"\0")
            padded.append([int.from_bytes(common[i:i + 4], "big")
                           for i in range(0, len(target), 4)])
        if not padded:
            continue
        words = torch.tensor(padded, dtype=torch.int64, device=device)
        fields = mips_fields(words)
        word_mismatch = (words != target_words).sum(dim=1)
        field_mismatch = (fields != target_fields).sum(dim=1)
        opcode_mismatch = (mips_operation_keys(words) != target_operations).sum(dim=1)
        register_mismatch = (fields[:, :, 1:4] != target_fields[:, 1:4]).sum(dim=(1, 2))
        candidate_opcode = fields[:, :, 0]
        target_opcode = target_fields[:, 0]
        immediate_instruction = ((candidate_opcode != 0) & (candidate_opcode != 2) &
                                 (candidate_opcode != 3))
        target_immediate_instruction = ((target_opcode != 0) & (target_opcode != 2) &
                                        (target_opcode != 3))
        immediate_mismatch = ((fields[:, :, 6] != target_fields[:, 6]) &
                              (immediate_instruction | target_immediate_instruction)).sum(dim=1)
        # Adjacent word-pair equality is a cheap order-sensitive shingle.  It
        # spots scheduling changes that an opcode histogram would hide.
        if target_words.numel() > 1:
            pair_mismatch = (((words[:, :-1] != target_words[:-1]) |
                              (words[:, 1:] != target_words[1:])).sum(dim=1))
        else:
            pair_mismatch = word_mismatch
        # One inserted/deleted instruction makes fixed-position Hamming noisy.
        # A bounded shift score cheaply identifies that residual class without
        # pretending to be the canonical diff or an exact-match decision.
        shift_mismatch = word_mismatch.clone()
        for shift in range(1, min(4, target_words.numel() - 1) + 1):
            candidate_late = (words[:, shift:] != target_words[:-shift]).sum(dim=1) + shift
            candidate_early = (words[:, :-shift] != target_words[shift:]).sum(dim=1) + shift
            shift_mismatch = torch.minimum(shift_mismatch,
                                           torch.minimum(candidate_late, candidate_early))
        cpu = zip(word_mismatch.cpu().tolist(), field_mismatch.cpu().tolist(),
                  opcode_mismatch.cpu().tolist(), register_mismatch.cpu().tolist(),
                  immediate_mismatch.cpu().tolist(), pair_mismatch.cpu().tolist(),
                  shift_mismatch.cpu().tolist())
        for blob, length_ok, values in zip(chunk, same_length, cpu):
            word, field, opcode, register, immediate, pair, shifted = values
            results.append({"exact": length_ok and blob == target,
                            "size_delta": len(blob) - len(target),
                            "word_mismatches": word,
                            "field_mismatches": field,
                            "opcode_funct_mismatches": opcode,
                            "register_mismatches": register,
                            "immediate_mismatches": immediate,
                            "order_pair_mismatches": pair,
                            "best_local_shift_mismatches": shifted})
    return results


def structural_score_file(target_path: Path, candidates_path: Path,
                          output_path: Path, binary_field: str = "binary_hex") -> dict:
    rows = read_jsonl(candidates_path)
    blobs = [bytes.fromhex(row[binary_field]) for row in rows]
    scores = structural_scores(target_path.read_bytes(), blobs)
    for row, score in zip(rows, scores):
        row["structural_score"] = score
    output_path.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in rows))
    torch = _torch()
    return {"device": "cuda" if torch.cuda.is_available() else "cpu",
            "candidates": len(rows), "exact": sum(s["exact"] for s in scores)}


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
    improvements, strict, exact, residuals, residual_mask = [], [], [], [], []
    for row in rows:
        parent, score = max(1, int(row["parent_score"])), int(row["score"])
        improvements.append(max(-1.0, min(1.0, (parent - score) / parent)))
        strict.append(1.0 if score < parent else 0.0)
        exact.append(1.0 if score == 0 or row.get("exact") else 0.0)
        counts = row.get("mismatch_counts") or {}
        residuals.append([math.log1p(max(0, int(counts.get(kind, 0))))
                          for kind in MISMATCH_KINDS])
        residual_mask.append(1.0 if "mismatch_counts" in row else 0.0)
    return (torch.tensor(improvements, dtype=torch.float32, device=device),
            torch.tensor(strict, dtype=torch.float32, device=device),
            torch.tensor(exact, dtype=torch.float32, device=device),
            torch.tensor(residuals, dtype=torch.float32, device=device),
            torch.tensor(residual_mask, dtype=torch.float32, device=device))


def split_rows(rows: list[dict]) -> tuple[list[dict], list[dict]]:
    """Hold out complete functions, then seeds, then a temporal tail.

    A random row split badly overstates performance because adjacent permuter
    candidates are near duplicates.  With at least four functions, validation
    uses functions the model never saw.  Small corpora fall back to a complete
    seed lineage or, last, a temporal tail so self-tests and early pilots stay
    usable without claiming cross-function generalization.
    """
    by_function: dict[str, list[dict]] = {}
    for row in rows:
        by_function.setdefault(row.get("function", "?"), []).append(row)
    if len(by_function) >= 4:
        # Stable content-independent partition: adding more rows to an
        # existing run cannot silently move its function between sets.
        ordered_functions = sorted(
            by_function,
            key=lambda name: hashlib.sha256(name.encode()).digest(),
        )
        # Deployment requires improvements in at least two unseen functions,
        # so the validation partition must contain at least two functions.
        valid_count = min(len(ordered_functions) - 2,
                          max(2, math.ceil(len(ordered_functions) / 5)))
        valid_functions = set(ordered_functions[:valid_count])
        train_rows = [row for name, group in by_function.items()
                      if name not in valid_functions for row in group]
        valid_rows = [row for name, group in by_function.items()
                      if name in valid_functions for row in group]
        return train_rows, valid_rows

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
            unique[(row.get("function"), source_digest(row))] = row
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
    strict_positives = sum(1 for row in train_rows
                           if int(row["score"]) < int(row["parent_score"]))
    model.module.train()
    for _ in range(epochs):
        random.shuffle(train_rows)
        for start in range(0, len(train_rows), batch_size):
            chunk = train_rows[start:start + batch_size]
            indices, offsets, numeric = _batch(chunk, device)
            y_improve, y_strict, y_exact, y_residual, residual_mask = _labels(chunk, device)
            p_improve, p_strict, p_exact, p_residual = model(indices, offsets, numeric)
            loss = torch.nn.functional.smooth_l1_loss(p_improve, y_improve)
            if strict_positives:
                positives = max(1, int(y_strict.sum().item()))
                strict_weight = torch.tensor(
                    min(128.0, (len(chunk) - positives) / positives), device=device)
                loss += 0.75 * torch.nn.functional.binary_cross_entropy_with_logits(
                    p_strict, y_strict, pos_weight=strict_weight)
            # This auxiliary objective gives dense supervision about what is
            # still wrong.  It remains useful when the corpus has no exact
            # positive examples at all.
            if residual_mask.sum().item():
                per_row = torch.nn.functional.smooth_l1_loss(
                    torch.nn.functional.softplus(p_residual), y_residual,
                    reduction="none").mean(dim=1)
                loss += 0.20 * (per_row * residual_mask).sum() / residual_mask.sum()
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
    metrics["split"] = ("held-out-functions" if len({r.get('function', '?') for r in rows}) >= 4
                        else "seed-lineage-or-temporal-tail")
    metrics["exact_positives"] = exact_positives
    metrics["strict_improvement_positives"] = strict_positives
    torch.save({"schema": MODEL_SCHEMA,
                "state": model.state_dict(), "buckets": model.buckets, "dim": model.dim,
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
        improve, strict, exact, residual = model(indices, offsets, numeric)
        priority = improve + 2.0 * torch.sigmoid(strict)
        priority = priority - 0.05 * torch.nn.functional.softplus(residual).sum(dim=1)
        if use_exact:
            priority = priority + 2.0 * torch.sigmoid(exact)
        priority = priority.cpu().tolist()
    # Strict improvements are often absent in an honest held-out mutation
    # lineage.  Avoiding regressions is still useful: it rejects candidates
    # that cannot improve the current parent before spending a compile slot.
    actual = [int(r["score"]) < int(r["parent_score"]) for r in rows]
    positive_functions = len({r.get("function", "?") for r, hit in zip(rows, actual) if hit})
    positive_lineages = len({(r.get("function", "?"), str(r.get("seed", "missing")))
                             for r, hit in zip(rows, actual) if hit})
    ordered = sorted(range(len(rows)), key=lambda i: priority[i], reverse=True)
    k = max(1, len(rows) // 4)
    selected = ordered[:k]
    hits = sum(actual[i] for i in selected) / k
    pilot_k = max(1, round(len(rows) * 512 / 50000))
    pilot_hits = sum(actual[i] for i in ordered[:pilot_k]) / pilot_k
    baseline = sum(actual) / len(actual)
    # A model cannot demonstrate generalization when every useful label comes
    # from one function or one mutation lineage.  Keep it in shadow mode until
    # held-out improvements span independent functions and seeds.
    lift = hits / baseline if baseline else 0.0
    pilot_lift = pilot_hits / baseline if baseline else 0.0
    enabled = (hits > baseline and pilot_hits > baseline
               and lift >= 1.5 and pilot_lift >= 1.25
               and positive_functions >= 2 and positive_lineages >= 3)
    return {"validation_rows": len(rows), "top_quartile_hit_rate": hits,
            "top_pilot_budget_hit_rate": pilot_hits,
            "random_hit_rate": baseline,
            "top_quartile_lift": lift,
            "top_pilot_budget_lift": pilot_lift,
            "strict_positive_functions": positive_functions,
            "strict_positive_lineages": positive_lineages,
            "enabled": enabled}


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
         select_count: int, diversity: float = 0.25,
         allow_disabled: bool = False) -> dict:
    torch = _torch()
    saved = torch.load(model_path, map_location="cpu", weights_only=False)
    if saved.get("schema") != MODEL_SCHEMA:
        raise SystemExit(
            f"checkpoint schema {saved.get('schema', 'legacy')} is incompatible with "
            f"ranker schema {MODEL_SCHEMA}; retrain it with this version before ranking")
    if not saved.get("metrics", {}).get("enabled", False) and not allow_disabled:
        raise SystemExit("checkpoint failed its held-out deployment gate; "
                         "use seeded random ordering or --allow-disabled for shadow evaluation")
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
            improve, strict, exact, residual = model(indices, offsets, numeric)
            hidden = model.encode(indices, offsets, numeric)
            priority = (improve + 2.0 * torch.sigmoid(strict)
                        - 0.05 * torch.nn.functional.softplus(residual).sum(dim=1))
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


def rank_ensemble(model_paths: list[Path], candidates: Path, output: Path,
                  explore: float, seed: int, select_count: int,
                  diversity: float = 0.25, uncertainty: float = 0.50,
                  allow_disabled: bool = False) -> dict:
    """Rank uncompiled candidates with epistemic uncertainty across checkpoints.

    Independent seeds disagree most on source regions unlike the labeled trace.
    The uncertainty bonus deliberately spends part of the compile budget there,
    while ``explore`` retains a model-independent random control arm.  Candidate
    features remain source-only; official compilation and matching are the
    oracle after selection.
    """
    torch = _torch()
    if len(model_paths) < 2:
        raise SystemExit("rank-ensemble requires at least two checkpoints")
    saved_models = [torch.load(path, map_location="cpu", weights_only=False)
                    for path in model_paths]
    for path, saved in zip(model_paths, saved_models):
        if saved.get("schema") != MODEL_SCHEMA:
            raise SystemExit(
                f"{path}: checkpoint schema {saved.get('schema', 'legacy')} is "
                f"incompatible with ranker schema {MODEL_SCHEMA}")
        if not saved.get("metrics", {}).get("enabled", False) and not allow_disabled:
            raise SystemExit(
                f"{path}: checkpoint failed its held-out deployment gate; use "
                "--allow-disabled only for a measured shadow experiment")
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    rows = read_jsonl(candidates)
    predictions, embedding_sums = [], None
    for saved in saved_models:
        model = RankerModel(saved["buckets"], saved["dim"]).to(device)
        model.load_state_dict(saved["state"])
        model.module.eval()
        model_predictions, model_embeddings = [], []
        with torch.no_grad():
            for start in range(0, len(rows), 8192):
                chunk = rows[start:start + 8192]
                indices, offsets, numeric = _batch(chunk, device, model.buckets)
                improve, strict, exact, residual = model(indices, offsets, numeric)
                priority = (improve + 2.0 * torch.sigmoid(strict)
                            - 0.05 * torch.nn.functional.softplus(residual).sum(dim=1))
                if saved.get("exact_positives", 0):
                    priority = priority + 2.0 * torch.sigmoid(exact)
                model_predictions.append(priority)
                model_embeddings.append(model.encode(indices, offsets, numeric))
        prediction = torch.cat(model_predictions) if model_predictions else torch.empty(0, device=device)
        embeddings = torch.cat(model_embeddings) if model_embeddings else torch.empty((0, model.dim), device=device)
        predictions.append(prediction)
        embedding_sums = embeddings if embedding_sums is None else embedding_sums + embeddings
    stacked = torch.stack(predictions)
    means = stacked.mean(dim=0)
    stds = stacked.std(dim=0, unbiased=False)
    acquisition = means + uncertainty * stds
    for row, mean, std, score in zip(rows, means.cpu().tolist(), stds.cpu().tolist(),
                                     acquisition.cpu().tolist()):
        row["model_mean_priority"] = mean
        row["model_uncertainty"] = std
        row["model_priority"] = score
        row["selection_arm"] = "unselected"
    mean_embeddings = embedding_sums / len(saved_models) if embedding_sums is not None else None
    selected_count = min(max(0, select_count), len(rows))
    rows, explore_count = select_rows(rows, explore, seed, selected_count,
                                      embeddings=mean_embeddings, diversity=diversity)
    output.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in rows))
    return {"device": str(device), "candidates": len(rows),
            "models": len(saved_models), "uncertainty_weight": uncertainty,
            "explore": explore, "diversity": diversity,
            "selected": selected_count, "exploration_selected": explore_count,
            "training_metrics": [saved.get("metrics", {}) for saved in saved_models]}


def replay(model_path: Path, labeled_path: Path, budget: int = 128,
           random_trials: int = 200, seed: int = 1) -> dict:
    """Measure compile-slot value on the checkpoint's held-out functions.

    This is an offline acquisition test, not an exactness test.  It compares
    the model's first ``budget`` choices with seeded random choices from the
    same held-out pools.  Deployment still requires the compiler and byte
    matcher for every selected candidate.
    """
    torch = _torch()
    saved = torch.load(model_path, map_location="cpu", weights_only=False)
    if saved.get("schema") != MODEL_SCHEMA:
        raise SystemExit("checkpoint schema is incompatible with replay")
    unique = {}
    for row in read_jsonl(labeled_path):
        if row.get("compiled") and "score" in row:
            unique[(row.get("function"), source_digest(row))] = row
    rows = list(unique.values())
    _, held_out = split_rows(rows)
    if not held_out:
        raise SystemExit("replay corpus has no held-out rows")
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = RankerModel(saved["buckets"], saved["dim"]).to(device)
    model.load_state_dict(saved["state"])
    model.module.eval()
    priorities = []
    with torch.no_grad():
        for start in range(0, len(held_out), 8192):
            chunk = held_out[start:start + 8192]
            indices, offsets, numeric = _batch(chunk, device, model.buckets)
            improve, strict, exact, residual = model(indices, offsets, numeric)
            priority = (improve + 2.0 * torch.sigmoid(strict)
                        - 0.05 * torch.nn.functional.softplus(residual).sum(dim=1))
            if saved.get("exact_positives", 0):
                priority += 2.0 * torch.sigmoid(exact)
            priorities.extend(priority.cpu().tolist())
    by_function = {}
    for row, priority in zip(held_out, priorities):
        by_function.setdefault(row.get("function", "?"), []).append((row, priority))
    rng = random.Random(seed)
    reports = []
    model_hits = random_hits = model_exact = random_exact = 0.0
    wins = 0
    positive_pool_functions = 0
    for function, group in sorted(by_function.items()):
        count = min(max(1, budget), len(group))
        ranked = sorted(group, key=lambda item: item[1], reverse=True)[:count]
        ranked_rows = [row for row, _ in ranked]
        hits = sum(int(row["score"]) < int(row["parent_score"])
                   for row in ranked_rows)
        exacts = sum(int(row["score"]) == 0 or row.get("exact")
                     for row in ranked_rows)
        trial_hits, trial_exacts, trial_best = [], [], []
        population = [row for row, _ in group]
        if any(int(row["score"]) < int(row["parent_score"])
               for row in population):
            positive_pool_functions += 1
        for _ in range(max(1, random_trials)):
            sample = rng.sample(population, count)
            trial_hits.append(sum(int(row["score"]) < int(row["parent_score"])
                                  for row in sample))
            trial_exacts.append(sum(int(row["score"]) == 0 or row.get("exact")
                                    for row in sample))
            trial_best.append(min(int(row["score"]) for row in sample))
        expected_hits = sum(trial_hits) / len(trial_hits)
        expected_exacts = sum(trial_exacts) / len(trial_exacts)
        best = min(int(row["score"]) for row in ranked_rows)
        expected_best = sum(trial_best) / len(trial_best)
        wins += hits > expected_hits or best < expected_best
        model_hits += hits
        random_hits += expected_hits
        model_exact += exacts
        random_exact += expected_exacts
        reports.append({"function": function, "pool": len(group), "budget": count,
                        "model_strict_improvements": hits,
                        "random_expected_strict_improvements": expected_hits,
                        "model_exact": exacts,
                        "random_expected_exact": expected_exacts,
                        "model_best_score": best,
                        "random_expected_best_score": expected_best})
    lift = model_hits / random_hits if random_hits else 0.0
    enabled = (int(saved.get("metrics", {}).get(
                   "strict_improvement_positives", 0)) > 0
               and positive_pool_functions >= 2
               and len(reports) >= 2 and wins * 2 >= len(reports)
               and lift >= 1.25 and model_hits > random_hits)
    return {"device": str(device), "held_out_rows": len(held_out),
            "held_out_functions": len(reports), "budget_per_function": budget,
            "model_strict_improvements": model_hits,
            "random_expected_strict_improvements": random_hits,
            "strict_improvement_lift": lift, "function_wins": wins,
            "positive_pool_functions": positive_pool_functions,
            "model_exact": model_exact, "random_expected_exact": random_exact,
            "enabled": enabled, "functions": reports}


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
            records.append({"id": i, "function": f"demo_{i % 8}",
                            "function_family": "arithmetic",
                            "parent_diff_signature": "register-order",
                            "seed": i % 16,
                            "source": f"int x{i}; x = a {'+' if good else '-'} b;",
                            "mutations": ["commute" if good else "flip"], "parent_score": 20,
                            "score": 8 if good else 22, "compiled": True, "exact": False})
        labeled.write_text("".join(json.dumps(r) + "\n" for r in records))
        candidates.write_text("".join(json.dumps({k: v for k, v in r.items() if k not in {"score", "compiled", "exact"}}) + "\n"
                                      for r in records[:128]))
        model2 = root / "model2.pt"
        ensemble_ranked = root / "ensemble-ranked.jsonl"
        metrics = train(labeled, model, epochs=8, seed=7)
        train(labeled, model2, epochs=8, seed=11)
        ranked_metrics = rank(model, candidates, ranked, explore=0.1, seed=7, select_count=64)
        ensemble_metrics = rank_ensemble([model, model2], candidates, ensemble_ranked,
                                         explore=0.1, seed=7, select_count=64)
        assert len(read_jsonl(ranked)) == 128
        assert len(read_jsonl(ensemble_ranked)) == 128
        return {"train": metrics, "rank": ranked_metrics,
                "rank_ensemble": ensemble_metrics}


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
    p_rank.add_argument("--allow-disabled", action="store_true",
                        help="rank only for shadow evaluation when the held-out gate failed")
    p_ensemble = sub.add_parser("rank-ensemble")
    p_ensemble.add_argument("candidates", type=Path)
    p_ensemble.add_argument("output", type=Path)
    p_ensemble.add_argument("models", nargs="+", type=Path)
    p_ensemble.add_argument("--explore", type=float, default=0.1)
    p_ensemble.add_argument("--seed", type=int, default=1)
    p_ensemble.add_argument("--select-count", type=int, default=512)
    p_ensemble.add_argument("--diversity", type=float, default=0.25)
    p_ensemble.add_argument("--uncertainty", type=float, default=0.50,
                            help="ensemble standard-deviation acquisition bonus")
    p_ensemble.add_argument("--allow-disabled", action="store_true")
    p_replay = sub.add_parser("replay")
    p_replay.add_argument("model", type=Path)
    p_replay.add_argument("labeled", type=Path)
    p_replay.add_argument("--budget", type=int, default=128)
    p_replay.add_argument("--random-trials", type=int, default=200)
    p_replay.add_argument("--seed", type=int, default=1)
    p_struct = sub.add_parser("structural-score")
    p_struct.add_argument("target", type=Path)
    p_struct.add_argument("candidates", type=Path)
    p_struct.add_argument("output", type=Path)
    p_struct.add_argument("--binary-field", default="binary_hex")
    p_retrieve = sub.add_parser("retrieve")
    p_retrieve.add_argument("labeled", type=Path)
    p_retrieve.add_argument("queries", type=Path)
    p_retrieve.add_argument("output", type=Path)
    p_retrieve.add_argument("--neighbors", type=int, default=8)
    sub.add_parser("selftest")
    args = parser.parse_args(argv)
    if args.command == "train":
        result = train(args.data, args.model, args.epochs, args.seed)
    elif args.command == "rank":
        result = rank(args.model, args.candidates, args.output, args.explore, args.seed,
                      args.select_count, args.diversity, args.allow_disabled)
    elif args.command == "rank-ensemble":
        result = rank_ensemble(args.models, args.candidates, args.output,
                               args.explore, args.seed, args.select_count,
                               args.diversity, args.uncertainty,
                               args.allow_disabled)
    elif args.command == "structural-score":
        result = structural_score_file(args.target, args.candidates, args.output,
                                       args.binary_field)
    elif args.command == "retrieve":
        result = retrieve_effects(args.labeled, args.queries, args.output,
                                  args.neighbors)
    elif args.command == "replay":
        result = replay(args.model, args.labeled, args.budget,
                        args.random_trials, args.seed)
    else:
        result = selftest()
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
