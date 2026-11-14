#!/usr/bin/env python3
"""Train/infer a class-balanced compiler-family router on CUDA.

Evaluation is project-disjoint.  The model is advisory: an exact matcher still
selects the compiler, assembler, flags, and section placement for integration.
"""
from __future__ import annotations

import argparse
import importlib.util
import json
import random
from collections import Counter
from pathlib import Path


def load_base():
    path = Path(__file__).with_name("compiler_corpus.py")
    spec = importlib.util.spec_from_file_location("compiler_corpus", path)
    module = importlib.util.module_from_spec(spec); assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def dense(rows, torch, device, width):
    matrix = torch.zeros((len(rows), width), dtype=torch.float32, device=device)
    for row_index, row in enumerate(rows):
        indices = list(row["_features"])
        matrix[row_index, indices] = torch.tensor(list(row["_features"].values()), device=device)
    return matrix


def confusion(expected, actual, names):
    result = {name: {other: 0 for other in names} for name in names}
    for left, right in zip(expected, actual):
        result[names[left]][names[right]] += 1
    return result


def classification_metrics(matrix):
    labels = sorted(matrix)
    per_class = {}
    for label in labels:
        true_positive = matrix[label].get(label, 0)
        false_negative = sum(matrix[label].values()) - true_positive
        false_positive = sum(matrix[other].get(label, 0) for other in labels if other != label)
        precision = true_positive / (true_positive + false_positive) if true_positive + false_positive else 0.0
        recall = true_positive / (true_positive + false_negative) if true_positive + false_negative else 0.0
        f1 = 2 * precision * recall / (precision + recall) if precision + recall else 0.0
        per_class[label] = {"precision": precision, "recall": recall, "f1": f1,
                            "support": sum(matrix[label].values())}
    return {"macro_f1": sum(item["f1"] for item in per_class.values()) / len(per_class),
            "per_class": per_class}


def main() -> int:
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="command", required=True)
    train = sub.add_parser("train")
    train.add_argument("corpus", type=Path); train.add_argument("model", type=Path)
    train.add_argument("--epochs", type=int, default=120); train.add_argument("--seed", type=int, default=20261113)
    train.add_argument("--test-fraction", type=float, default=.25)
    train.add_argument("--batch", type=int, default=512)
    infer = sub.add_parser("classify")
    infer.add_argument("model", type=Path); infer.add_argument("text", type=Path)
    args = ap.parse_args()
    try:
        import torch
    except ImportError as exc:
        raise SystemExit("PyTorch is required; run with the configured GPU environment") from exc
    if not torch.cuda.is_available():
        raise SystemExit("CUDA is required")
    base = load_base(); device = torch.device("cuda")
    if args.command == "classify":
        checkpoint = torch.load(args.model, map_location=device, weights_only=False)
        model = torch.nn.Sequential(torch.nn.Linear(checkpoint["width"], 256), torch.nn.ReLU(),
                                    torch.nn.Dropout(.1), torch.nn.Linear(256, len(checkpoint["families"]))).to(device)
        model.load_state_dict(checkpoint["state_dict"]); model.eval()
        row = {"_features": base.features(args.text.read_bytes())}
        with torch.no_grad():
            probability = torch.softmax(model(dense([row], torch, device, checkpoint["width"])), 1)[0]
        choices = sorted(zip(checkpoint["families"], probability.cpu().tolist()), key=lambda x: -x[1])
        print(json.dumps({"predictions": choices}, indent=2)); return 0
    torch.manual_seed(args.seed); random.seed(args.seed)
    rows = base.load_rows(args.corpus)
    training, testing = base.split_projects(rows, args.seed, args.test_fraction)
    families = sorted({row["compiler_family"] for row in rows})
    if set(families) - {row["compiler_family"] for row in training}:
        raise SystemExit("project split leaves a compiler family absent from training; add another project")
    label = {name: index for index, name in enumerate(families)}
    random.shuffle(training); validation_count = max(1, len(training) // 10)
    validation, training = training[:validation_count], training[validation_count:]
    x_train = dense(training, torch, device, base.FEATURES); y_train = torch.tensor(
        [label[row["compiler_family"]] for row in training], dtype=torch.long, device=device)
    x_valid = dense(validation, torch, device, base.FEATURES); y_valid = torch.tensor(
        [label[row["compiler_family"]] for row in validation], dtype=torch.long, device=device)
    x_test = dense(testing, torch, device, base.FEATURES); y_test = torch.tensor(
        [label[row["compiler_family"]] for row in testing], dtype=torch.long, device=device)
    model = torch.nn.Sequential(torch.nn.Linear(base.FEATURES, 256), torch.nn.ReLU(),
                                torch.nn.Dropout(.1), torch.nn.Linear(256, len(families))).to(device)
    counts = Counter(y_train.cpu().tolist())
    weights = torch.tensor([len(y_train) / (len(families) * counts[i]) for i in range(len(families))], device=device)
    loss_fn = torch.nn.CrossEntropyLoss(weight=weights); optimizer = torch.optim.AdamW(model.parameters(), lr=2e-3)
    best_loss, best_state, stale = float("inf"), None, 0
    generator = torch.Generator(device=device).manual_seed(args.seed)
    for epoch in range(args.epochs):
        model.train(); order = torch.randperm(len(y_train), generator=generator, device=device)
        for start in range(0, len(order), args.batch):
            batch = order[start:start+args.batch]; optimizer.zero_grad(set_to_none=True)
            loss = loss_fn(model(x_train[batch]), y_train[batch]); loss.backward(); optimizer.step()
        model.eval()
        with torch.no_grad(): valid_loss = float(loss_fn(model(x_valid), y_valid).item())
        if valid_loss < best_loss:
            best_loss = valid_loss; best_state = {k: v.detach().cpu().clone() for k, v in model.state_dict().items()}; stale = 0
        else:
            stale += 1
        if stale >= 15: break
    assert best_state is not None; model.load_state_dict(best_state); model.eval()
    with torch.no_grad(): predictions = model(x_test).argmax(1)
    accuracy = float((predictions == y_test).float().mean().item()) if len(y_test) else None
    matrix = confusion(y_test.cpu().tolist(), predictions.cpu().tolist(), families)
    checkpoint = {"version": 1, "width": base.FEATURES, "families": families,
                  "state_dict": best_state, "seed": args.seed,
                  "test_projects": sorted({row['project'] for row in testing}),
                  "metrics": {"samples": len(testing), "accuracy": accuracy,
                              "confusion": matrix, **classification_metrics(matrix)}}
    args.model.parent.mkdir(parents=True, exist_ok=True); torch.save(checkpoint, args.model)
    print(json.dumps({"device": str(device), "epochs": epoch + 1, "train": len(training),
                      "validation": len(validation), "test": len(testing),
                      "metrics": checkpoint["metrics"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
