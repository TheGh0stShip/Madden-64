#!/usr/bin/env python3
"""Validate advisory DirectML output numerically against the CPU provider."""
import argparse
import json
from pathlib import Path

import numpy as np


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("dml", type=Path)
    parser.add_argument("cpu", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    with np.load(args.dml, allow_pickle=False) as left, np.load(args.cpu, allow_pickle=False) as right:
        if set(left.files) != set(right.files):
            raise SystemExit("output names differ")
        rows = {}
        passed = True
        for name in left.files:
            a, b = left[name], right[name]
            same_shape = a.shape == b.shape
            close = same_shape and bool(np.allclose(a, b, rtol=1e-4, atol=1e-5))
            passed &= close
            rows[name] = {
                "shape": list(a.shape), "allclose": close,
                "max_abs_error": float(np.max(np.abs(a - b))) if same_shape else None,
            }
    document = {"schema": "madden64-directml-parity-v1", "passed": passed, "outputs": rows}
    args.output.write_text(json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return 0 if passed else 1


if __name__ == "__main__":
    raise SystemExit(main())
