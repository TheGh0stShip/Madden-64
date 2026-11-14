#!/usr/bin/env python3
"""Generate compiler-relevant C declaration/lifetime shapes for one candidate.

This is intentionally source-aware rather than a token permuter.  It preserves
the function body and explores declaration order, narrow loop-counter types,
and a shared object/statistics base whose use is supported by target accesses.
"""

from __future__ import annotations

import argparse
import random
from pathlib import Path


DECL_START = "    M2C_UNK var_a0_3;\n"
DECL_END = "    void *var_v0;\n"


def build_variants(source: str, count: int, seed: int) -> list[tuple[str, str]]:
    begin = source.index(DECL_START)
    end = source.index(DECL_END, begin) + len(DECL_END)
    declarations = source[begin:end].splitlines(keepends=True)
    prefix, body = source[:begin], source[end:]
    rng = random.Random(seed)
    variants: list[tuple[str, str]] = []

    for index in range(count):
        decls = declarations.copy()
        rng.shuffle(decls)
        text = prefix + "".join(decls) + body

        narrow_team = bool(index & 1)
        shared_base = (index // 2) % 4
        keep_register = bool((index // 8) & 1)

        if narrow_team:
            text = text.replace("    s32 var_s5;\n", "    s16 var_s5;\n", 1)
        if not keep_register:
            text = text.replace("    register s32 temp_s2;\n", "    s32 temp_s2;\n", 1)

        if shared_base:
            insertion = "    TeamData *team_data;\n    s16 *statistics_base;\n"
            marker = "    var_s5 = 0;\n"
            if shared_base == 1:
                init = marker + "    team_data = D_80081860;\n    statistics_base = team_data->statistics[0];\n"
            elif shared_base == 2:
                init = marker + "    statistics_base = D_80081860[0].statistics[0];\n    team_data = D_80081860;\n"
            else:
                init = marker + "    team_data = &D_80081860[0];\n    statistics_base = &team_data->statistics[0][0];\n"
            text = text[:begin] + insertion + text[begin:]
            text = text.replace(marker, init, 1)
            text = text.replace("temp_s2 + 0x80081860", "temp_s2 + (u32)team_data")
            text = text.replace("temp_s2 + 0x80081876", "temp_s2 + (u32)statistics_base")

        name = f"shape_{index:04d}_n{int(narrow_team)}_b{shared_base}_r{int(keep_register)}.c"
        variants.append((name, text))
    return variants


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--count", type=int, default=512)
    parser.add_argument("--seed", type=int, default=0x4D414444)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    source = args.source.read_text()
    for name, text in build_variants(source, args.count, args.seed):
        (args.output / name).write_text(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
