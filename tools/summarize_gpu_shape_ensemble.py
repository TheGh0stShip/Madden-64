#!/usr/bin/env python3
"""Aggregate seeded GPU C-shape predictions into stable experiment recipes."""
from __future__ import annotations

import argparse
import json
import statistics
from collections import defaultdict
from pathlib import Path


EXPERIMENTS = {
    "control.for": "try a canonical for(init; test; step) loop",
    "control.while": "try a top-tested while loop",
    "control.do_while": "try a bottom-tested do/while loop",
    "control.do_while_zero": "group the scheduling region in do { ... } while (0)",
    "control.switch": "recover a switch, including empty/default cases",
    "control.goto": "try explicit labels/gotos matching the target CFG",
    "control.break": "express the exit as break inside its loop",
    "control.continue": "express the backedge path as continue",
    "control.ternary": "try a conditional expression instead of an if assignment",
    "control.early_return": "try guard clauses/early return",
    "memory.array_index": "compare base[index] with pointer-walk access",
    "memory.struct_arrow": "recover a typed struct pointer and named fields",
    "memory.struct_dot": "try a local/value struct rather than raw offsets",
    "memory.pointer_increment": "try *ptr++ in the loop body",
    "memory.pointer_add": "try explicit pointer-plus-offset dereference",
    "memory.address_taken": "keep the local addressable to constrain alias/lifetime",
    "memory.const_pointer": "test const pointee/pointer qualification",
    "memory.volatile": "use volatile only when the object is semantically volatile",
    "expr.compound_assign": "compare x op= y with x = x op y",
    "expr.chained_assign": "try the source-order chained assignment",
    "expr.preincrement": "compare ++counter with counter += 1",
    "expr.postincrement": "compare counter++ with counter += 1",
    "expr.explicit_cast": "make the signed-width truncation explicit",
    "expr.shift_add": "spell constant multiplication as the evidenced shift/add tree",
    "expr.bitmask": "preserve the explicit mask expression",
    "lifetime.block_scope": "narrow declarations to block scope",
    "lifetime.named_temporaries": "split the expression into named temporaries",
    "layout.local_array": "test an addressable local array and its frame effect",
    "layout.local_struct": "test a local struct and field-store ordering",
}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--top", type=int, default=10)
    args = parser.parse_args()

    runs: list[dict[tuple[str, str, str], dict]] = []
    metadata: dict[tuple[str, str, str], dict] = {}
    for path in args.inputs:
        run = {}
        for line in path.read_text().splitlines():
            row = json.loads(line)
            key = (row["module"], row["name"], str(row["vram"]))
            metadata[key] = {field: row[field]
                             for field in ("module", "name", "vram", "size")}
            run[key] = {item["shape"]: float(item["probability"])
                        for item in row["shape_hypotheses"]}
        runs.append(run)
    if not runs:
        raise SystemExit("no prediction runs")
    common = set.intersection(*(set(run) for run in runs))

    with args.output.open("w") as output:
        for key in sorted(common):
            values: dict[str, list[float]] = defaultdict(list)
            for run in runs:
                for shape in set().union(*(r.get(key, {}) for r in runs)):
                    values[shape].append(run[key].get(shape, 0.0))
            ranked = []
            for shape, probabilities in values.items():
                appearances = sum(probability > 0 for probability in probabilities)
                ranked.append({
                    "shape": shape,
                    "mean_probability": statistics.fmean(probabilities),
                    "stdev": statistics.pstdev(probabilities),
                    "seed_agreement": appearances / len(runs),
                    "experiment": EXPERIMENTS.get(shape,
                                                   f"test the {shape} source shape"),
                })
            ranked.sort(key=lambda item: (item["seed_agreement"],
                                          item["mean_probability"],
                                          -item["stdev"]), reverse=True)
            row = dict(metadata[key])
            row["ensemble_runs"] = len(runs)
            row["shape_experiments"] = ranked[:args.top]
            output.write(json.dumps(row, sort_keys=True) + "\n")
    print(json.dumps({"runs": len(runs), "functions": len(common),
                      "output": str(args.output)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
