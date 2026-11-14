#!/usr/bin/env python3
"""Infer promising genuine-C source shapes for unfinished functions on CUDA.

This is a routing tool, not a matching oracle.  It learns correlations between
binary/CFG features and coarse source-shape labels from the project's existing
byte-exact, provenance-eligible C corpus.  Predictions become concrete
experiments for a human or CPU compile/match worker; they never count as a
match by themselves.

The deliberately coarse labels describe compiler-relevant source choices such
as loop form, switch/goto structure, pointer versus array access, integer
widths, expression association, temporaries, and variable lifetime hints.
Inline assembly and function-specific normalizer sources are excluded by the
shared genuine_sources() policy.
"""
from __future__ import annotations

import argparse
import json
import random
import re
from pathlib import Path

try:
    import gpu_function_retrieval as retrieval
except ModuleNotFoundError:  # Allow importing as tools.gpu_c_shape_inference.
    from tools import gpu_function_retrieval as retrieval


LABEL_PATTERNS: dict[str, str] = {
    "control.for": r"\bfor\s*\(",
    "control.while": r"\bwhile\s*\(",
    "control.do_while": r"\bdo\s*\{",
    "control.do_while_zero": r"\bdo\s*\{[\s\S]{0,800}?\}\s*while\s*\(\s*0\s*\)",
    "control.switch": r"\bswitch\s*\(",
    "control.goto": r"\bgoto\s+[A-Za-z_]\w*\s*;",
    "control.break": r"\bbreak\s*;",
    "control.continue": r"\bcontinue\s*;",
    "control.ternary": r"[^?]\?[^?:]{1,300}:",
    "control.early_return": r"\bif\s*\([^)]*\)\s*(?:\{\s*)?return\b",
    "memory.array_index": r"\b[A-Za-z_]\w*\s*\[[^\]]+\]",
    "memory.struct_arrow": r"->\s*[A-Za-z_]\w*",
    "memory.struct_dot": r"\.[A-Za-z_]\w*",
    "memory.pointer_increment": r"\*\s*[A-Za-z_]\w*\s*\+\+|\*\s*\+\+\s*[A-Za-z_]\w*",
    "memory.pointer_add": r"\*\s*\([^)]*[A-Za-z_]\w*\s*\+\s*[^)]+\)",
    "memory.address_taken": r"&\s*[A-Za-z_]\w*",
    "memory.const_pointer": r"\bconst\b[^;\n]*\*|\*\s*const\b",
    "memory.volatile": r"\bvolatile\b",
    "type.s8": r"\b(?:s8|int8_t|signed\s+char)\b",
    "type.u8": r"\b(?:u8|uint8_t|unsigned\s+char)\b",
    "type.s16": r"\b(?:s16|int16_t|signed\s+short|short)\b",
    "type.u16": r"\b(?:u16|uint16_t|unsigned\s+short)\b",
    "type.s64": r"\b(?:s64|int64_t|long\s+long)\b",
    "type.u64": r"\b(?:u64|uint64_t|unsigned\s+long\s+long)\b",
    "type.float": r"\b(?:f32|float)\b",
    "type.double": r"\b(?:f64|double)\b",
    "type.union": r"\bunion\b",
    "expr.compound_assign": r"(?:<<|>>|\+|-|\*|/|&|\||\^)\s*=",
    "expr.chained_assign": r"=[^;=]{0,160}=[^=]",
    "expr.preincrement": r"\+\+\s*[A-Za-z_]",
    "expr.postincrement": r"[A-Za-z_]\w*\s*\+\+",
    "expr.explicit_cast": r"\(\s*(?:u|s)(?:8|16|32|64)\s*\)",
    "expr.shift_add": r"(?:<<|>>)[^;\n]{0,100}[+-]",
    "expr.bitmask": r"[&|^]\s*(?:~\s*)?(?:0x[0-9A-Fa-f]+|\d+)",
    "lifetime.block_scope": r"\{\s*(?:const\s+)?(?:u|s|f)(?:8|16|32|64)\s+[A-Za-z_]",
    "lifetime.named_temporaries": r"\b(?:temp|tmp|work|next|previous|current)_[A-Za-z0-9_]*\b",
    "layout.local_array": r"\b[A-Za-z_]\w*\s+[A-Za-z_]\w*\s*\[[^\]]+\]\s*(?:=|;)",
    "layout.local_struct": r"\bstruct\s+[A-Za-z_]\w*\s+[A-Za-z_]\w*\s*(?:=|;)",
}

UNFINISHED_SOURCE_HELPERS = re.compile(r"\bM2C_(?:FIELD|UNK)\b")


def strip_comments(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", " ", text, flags=re.S)
    text = re.sub(r"//[^\n]*", " ", text)
    text = re.sub(r"^\s*#.*$", " ", text, flags=re.M)
    text = re.sub(r'"(?:\\.|[^"\\])*"', '""', text)
    return re.sub(r"'(?:\\.|[^'\\])*'", "''", text)


def source_labels(text: str) -> set[str]:
    text = strip_comments(text)
    labels = {name for name, pattern in LABEL_PATTERNS.items()
              if re.search(pattern, text, flags=re.S)}
    # A do/while tail is not evidence for a source-level while loop.  Remove
    # those tails before deciding whether the independent while label applies.
    without_do_tails = re.sub(r"\}\s*while\s*\([^;]*\)\s*;", "}", text)
    if not re.search(LABEL_PATTERNS["control.while"], without_do_tails):
        labels.discard("control.while")
    return labels


def make_matrix(items, device, address_lookup):
    import torch
    matrix = torch.zeros((len(items), retrieval.BUCKETS),
                         dtype=torch.float32, device=device)
    for row, (entry, blob) in enumerate(items):
        values = retrieval.contextual_features(entry, blob, address_lookup)
        columns = list(values)
        matrix[row, columns] = torch.tensor(list(values.values()), device=device)
    return torch.nn.functional.normalize(matrix, dim=1)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path("."))
    parser.add_argument("--catalog", type=Path,
                        default=Path("build/research/function_catalog.json"))
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--metrics", type=Path)
    parser.add_argument("--epochs", type=int, default=240)
    parser.add_argument("--seed", type=int, default=20261114)
    parser.add_argument("--device", choices=("cuda", "cpu"), default="cuda")
    parser.add_argument("--top", type=int, default=14)
    args = parser.parse_args()

    import torch
    if args.device == "cuda" and not torch.cuda.is_available():
        raise SystemExit("CUDA requested but unavailable; run on Desktop")
    device = torch.device(args.device)
    random.seed(args.seed)
    torch.manual_seed(args.seed)

    root = args.root.resolve()
    catalog = json.loads((root / args.catalog).read_text()
                         if not args.catalog.is_absolute()
                         else args.catalog.read_text())
    rows = retrieval.load_blobs(root, catalog)
    address_lookup = {
        int(entry["vram"], 0) if isinstance(entry["vram"], str)
        else int(entry["vram"]): entry for entry, _ in rows
    }
    eligible = retrieval.genuine_sources(root)
    label_names = sorted(LABEL_PATTERNS)
    label_index = {name: index for index, name in enumerate(label_names)}
    training = []
    training_sources = []
    targets = []
    strict_training_keys = set()
    for entry, blob in rows:
        source = entry.get("matching_source")
        if not entry.get("matched") or source not in eligible:
            continue
        source_text = (root / source).read_text(errors="replace")
        if UNFINISHED_SOURCE_HELPERS.search(source_text):
            continue
        labels = source_labels(source_text)
        training.append((entry, blob))
        training_sources.append(source)
        strict_training_keys.add((entry["module"], entry["name"], entry["vram"]))
        vector = [0.0] * len(label_names)
        for label in labels:
            vector[label_index[label]] = 1.0
        targets.append(vector)
    # Catalogue ``matched`` includes assisted C.  Infer shapes for every unit
    # not actually admitted to the strict training corpus, including inline-
    # asm, function-specific-normalizer, and unfinished M2C sources.
    queries = [
        (entry, blob) for entry, blob in rows
        if (entry["module"], entry["name"], entry["vram"])
        not in strict_training_keys
    ]
    if len(training) < 50 or not queries:
        raise SystemExit("insufficient exact-C training corpus or no unfinished queries")

    x = make_matrix(training, device, address_lookup)
    y = torch.tensor(targets, dtype=torch.float32, device=device)
    # Split by source file, not function row.  Some compilation units contain
    # several functions and all inherit the same extracted source labels;
    # allowing one file into both halves would inflate validation accuracy.
    source_names = sorted(set(training_sources))
    random.Random(args.seed).shuffle(source_names)
    validation_source_count = max(1, len(source_names) // 8)
    validation_sources = set(source_names[:validation_source_count])
    validation_rows = [index for index, source in enumerate(training_sources)
                       if source in validation_sources]
    fitting_rows = [index for index, source in enumerate(training_sources)
                    if source not in validation_sources]
    validation = torch.tensor(validation_rows, dtype=torch.long, device=device)
    fitting = torch.tensor(fitting_rows, dtype=torch.long, device=device)
    validation_count = len(validation_rows)

    # Low-rank first layer keeps the 16K hashed binary feature space tractable
    # while allowing interactions between CFG/opcode/call-context evidence.
    model = torch.nn.Sequential(
        torch.nn.Linear(retrieval.BUCKETS, 128),
        torch.nn.GELU(),
        torch.nn.Dropout(0.12),
        torch.nn.Linear(128, 64),
        torch.nn.GELU(),
        torch.nn.Linear(64, len(label_names)),
    ).to(device)
    optimizer = torch.optim.AdamW(model.parameters(), lr=2e-3,
                                  weight_decay=2e-4)
    prevalence = y[fitting].mean(0).clamp(0.01, 0.99)
    positive_weight = ((1.0 - prevalence) / prevalence).clamp(1.0, 20.0)
    loss_function = torch.nn.BCEWithLogitsLoss(pos_weight=positive_weight)
    model.train()
    for _ in range(args.epochs):
        optimizer.zero_grad(set_to_none=True)
        loss = loss_function(model(x[fitting]), y[fitting])
        loss.backward()
        optimizer.step()

    model.eval()
    with torch.no_grad():
        validation_probability = torch.sigmoid(model(x[validation]))
        validation_prediction = validation_probability >= 0.5
        truth = y[validation].bool()
        true_positive = (validation_prediction & truth).sum().item()
        precision_denominator = validation_prediction.sum().item()
        recall_denominator = truth.sum().item()
        metrics = {
            "schema": 1,
            "device": str(device),
            "seed": args.seed,
            "epochs": args.epochs,
            "training_functions": len(training),
            "validation_functions": validation_count,
            "validation_sources": validation_source_count,
            "unfinished_functions": len(queries),
            "labels": len(label_names),
            "micro_precision": true_positive / max(1, precision_denominator),
            "micro_recall": true_positive / max(1, recall_denominator),
        }

        with args.output.open("w") as output:
            for start in range(0, len(queries), 256):
                chunk = queries[start:start + 256]
                probabilities = torch.sigmoid(
                    model(make_matrix(chunk, device, address_lookup)))
                scores, indices = torch.topk(
                    probabilities, k=min(args.top, len(label_names)), dim=1)
                for (entry, _), row_scores, row_indices in zip(
                        chunk, scores.cpu().tolist(), indices.cpu().tolist()):
                    hypotheses = [
                        {"shape": label_names[index], "probability": score}
                        for score, index in zip(row_scores, row_indices)
                    ]
                    output.write(json.dumps({
                        "module": entry["module"], "name": entry["name"],
                        "vram": entry["vram"], "size": entry["size"],
                        "shape_hypotheses": hypotheses,
                    }, sort_keys=True) + "\n")

    if args.metrics:
        args.metrics.write_text(json.dumps(metrics, indent=2, sort_keys=True) + "\n")
    print(json.dumps(metrics, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
