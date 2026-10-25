#!/usr/bin/env python3
"""Copy matching-manifest rows whose source path has one selected suffix."""

from __future__ import annotations

import argparse
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    parser.add_argument("suffix", choices=(".c", ".s"))
    args = parser.parse_args()

    lines = args.source.read_text().splitlines()
    output = []
    for line in lines:
        if not line or line.startswith("#"):
            output.append(line)
            continue
        fields = line.split("\t")
        if len(fields) < 3:
            raise ValueError(f"malformed manifest row: {line}")
        if fields[2].endswith(args.suffix):
            output.append(line)
    args.destination.parent.mkdir(parents=True, exist_ok=True)
    args.destination.write_text("\n".join(output) + "\n")


if __name__ == "__main__":
    main()
