#!/usr/bin/env python3
"""Train and apply an auditable residual-to-mutation-family router.

Training JSONL rows contain ``target``, ``candidate`` and ``mutation_family``.
The files are raw relocated text.  Features describe instruction-field and
positional residuals; a smoothed multinomial model recommends mutation families
without changing compiled output or participating in exact verification.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import struct
import random
from collections import Counter, defaultdict
from pathlib import Path


def _words(blob: bytes) -> list[int]:
    return list(struct.unpack(f">{len(blob) // 4}I", blob[:len(blob) // 4 * 4]))


def features(target: bytes, candidate: bytes) -> Counter[str]:
    out: Counter[str] = Counter()
    tw, cw = _words(target), _words(candidate)
    out[f"length-sign:{(len(candidate) > len(target)) - (len(candidate) < len(target))}"] += 1
    out[f"length-bucket:{min(31, abs(len(candidate)-len(target)) // 4)}"] += 1
    for index, (a, b) in enumerate(zip(tw, cw)):
        if a == b:
            continue
        ao, bo = a >> 26, b >> 26
        if ao != bo:
            kind = "opcode"
        elif (a & 0xfc00003f) == (b & 0xfc00003f):
            kind = "register"
        elif (a & 0xffff0000) == (b & 0xffff0000):
            kind = "immediate"
        else:
            kind = "other"
        out[f"kind:{kind}"] += 1
        out[f"pair:{kind}:{ao}:{bo}"] += 1
        out[f"region:{kind}:{min(7, index * 8 // max(1, len(tw)))}"] += 1
        out[f"xorbits:{kind}:{min(16, (a ^ b).bit_count())}"] += 1
    return out


def load_example(row: dict, base: Path) -> tuple[Counter[str], str]:
    target = (base / row["target"]).resolve().read_bytes()
    candidate = (base / row["candidate"]).resolve().read_bytes()
    return features(target, candidate), row["mutation_family"]


def train(rows: list[dict], base: Path) -> dict:
    classes: Counter[str] = Counter()
    totals: Counter[str] = Counter()
    counts: dict[str, Counter[str]] = defaultdict(Counter)
    vocabulary = set()
    for row in rows:
        sample, family = load_example(row, base)
        classes[family] += 1
        counts[family].update(sample)
        totals[family] += sum(sample.values())
        vocabulary.update(sample)
    if len(classes) < 2:
        raise ValueError("residual router needs at least two mutation families")
    return {"version": 1, "samples": sum(classes.values()), "classes": dict(classes),
            "totals": dict(totals), "counts": {k: dict(v) for k, v in counts.items()},
            "vocabulary": sorted(vocabulary)}


def predict(model: dict, sample: Counter[str]) -> list[tuple[str, float]]:
    total_examples = sum(model["classes"].values())
    width = len(model["vocabulary"])
    scored = []
    for family, class_count in model["classes"].items():
        score = math.log(class_count / total_examples)
        denom = model["totals"][family] + width
        known = model["counts"][family]
        score += sum(value * math.log((known.get(key, 0) + 1) / denom)
                     for key, value in sample.items())
        scored.append((family, score))
    best = max(score for _, score in scored)
    probs = [(family, math.exp(score - best)) for family, score in scored]
    denom = sum(value for _, value in probs)
    return sorted(((family, value / denom) for family, value in probs), key=lambda x: -x[1])


def classification_metrics(confusion: dict[str, Counter[str]]) -> dict:
    labels = sorted(set(confusion) | {x for row in confusion.values() for x in row})
    per_class = {}
    for label in labels:
        tp = confusion[label][label]
        fn = sum(confusion[label].values()) - tp
        fp = sum(confusion[other][label] for other in labels if other != label)
        precision = tp / (tp + fp) if tp + fp else 0.0
        recall = tp / (tp + fn) if tp + fn else 0.0
        f1 = 2 * precision * recall / (precision + recall) if precision + recall else 0.0
        per_class[label] = {"precision": precision, "recall": recall, "f1": f1,
                            "support": sum(confusion[label].values())}
    return {"macro_f1": sum(value["f1"] for value in per_class.values()) / len(per_class),
            "per_class": per_class}


def main() -> int:
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="command", required=True)
    tr = sub.add_parser("train")
    tr.add_argument("examples", type=Path)
    tr.add_argument("model", type=Path)
    route = sub.add_parser("route")
    route.add_argument("model", type=Path)
    route.add_argument("target", type=Path)
    route.add_argument("candidate", type=Path)
    args = ap.parse_args()
    if args.command == "train":
        rows = [json.loads(line) for line in args.examples.read_text().splitlines() if line.strip()]
        projects = sorted({row.get("source_project", "unknown") for row in rows})
        random.Random(20261113).shuffle(projects)
        test_projects = set(projects[:max(1, len(projects) // 5)]) if len(projects) > 1 else set()
        test = [row for row in rows if row.get("source_project", "unknown") in test_projects]
        train_rows = [row for row in rows if row.get("source_project", "unknown") not in test_projects]
        if not train_rows or not test:
            # Single-project bootstraps retain a function-disjoint fallback,
            # explicitly identified in the emitted metrics.
            test = [row for row in rows if int.from_bytes(hashlib.blake2s(
                f"{row.get('source_function')}".encode(), digest_size=2).digest(), "little") % 5 == 0]
            train_rows = [row for row in rows if row not in test]
            split_kind = "function-disjoint"
        else:
            split_kind = "project-disjoint"
        evaluation_model = train(train_rows, args.examples.parent)
        correct = 0; confusion: dict[str, Counter[str]] = defaultdict(Counter)
        for row in test:
            sample, expected = load_example(row, args.examples.parent)
            actual = predict(evaluation_model, sample)[0][0]
            confusion[expected][actual] += 1; correct += actual == expected
        model = train(rows, args.examples.parent)
        model["heldout_evaluation"] = {
            "samples": len(test), "accuracy": correct / len(test) if test else None,
            "split": split_kind, "test_projects": sorted(test_projects),
            "confusion": {key: dict(value) for key, value in sorted(confusion.items())},
            **classification_metrics(confusion)}
        args.model.write_text(json.dumps(model, indent=2, sort_keys=True) + "\n")
        print(json.dumps({"samples": model["samples"], "classes": model["classes"],
                          "heldout_evaluation": model["heldout_evaluation"]}, sort_keys=True))
    else:
        model = json.loads(args.model.read_text())
        choices = predict(model, features(args.target.read_bytes(), args.candidate.read_bytes()))
        print(json.dumps({"routes": choices}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
