#!/usr/bin/env python3
"""Build, validate, balance, and classify a cross-project compiler corpus.

The input is JSONL using ``config/compiler_corpus.schema.json``.  Text paths are
resolved relative to the input file, hashes are verified, and train/test splits
are made by project so copies of one function cannot leak across the split.
The deliberately small nearest-centroid model is deterministic, auditable, and
portable to the Desktop worker; it is a routing hint, never matching evidence.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import itertools
import json
import math
import os
import random
import re
import subprocess
import struct
import tempfile
from collections import Counter, defaultdict
from pathlib import Path

FEATURES = 4096
FAMILIES = {"kmc-gcc", "gcc", "ido", "sn-gcc", "other"}


def _hash(value: str) -> int:
    return int.from_bytes(hashlib.blake2s(value.encode(), digest_size=8).digest(), "little") % FEATURES


def operation(word: int) -> int:
    op = word >> 26
    if op == 0:
        return (op << 6) | (word & 0x3f)
    if op == 1:
        return (op << 6) | ((word >> 16) & 0x1f)
    return op << 6


def features(blob: bytes) -> dict[int, float]:
    if not blob or len(blob) % 4:
        raise ValueError("text must be non-empty, word-aligned MIPS code")
    words = struct.unpack(f">{len(blob) // 4}I", blob)
    ops = [operation(w) for w in words]
    out: dict[int, float] = {}

    def add(key: str, value: float = 1.0) -> None:
        i = _hash(key)
        out[i] = out.get(i, 0.0) + value

    add(f"size:{min(255, len(words) // 4)}", 2.0)
    add(f"size-log:{int(math.log2(len(words)))}", 3.0)
    for n in (1, 2, 3, 4):
        for i in range(len(ops) - n + 1):
            add(f"op{n}:" + ",".join(map(str, ops[i:i+n])))
    for w in words:
        op = w >> 26
        if op == 0:
            add(f"rfunct:{w & 0x3f}")
            add(f"rshape:{(w >> 21) & 31}:{(w >> 16) & 31}:{(w >> 11) & 31}:{w & 63}", 1.5)
        elif op not in (2, 3):
            add(f"immclass:{op}:{(w & 0xffff).bit_length()}", .5)
            add(f"ishape:{op}:{(w >> 21) & 31}:{(w >> 16) & 31}", 1.25)
            signed = (w & 0xffff) - (0x10000 if w & 0x8000 else 0)
            add(f"immsign:{op}:{(signed > 0) - (signed < 0)}:{min(15, abs(signed).bit_length())}", .5)
    shapes = [((w & 0xffff07ff) if (w >> 26) == 0 else
               (w & 0xffff0000) if (w >> 26) not in (2, 3) else (w & 0xfc000000))
              for w in words]
    for index, shape in enumerate(shapes[:16]):
        add(f"prefix-shape:{index}:{shape:08x}", 2.0)
    for left, right in zip(shapes, shapes[1:]):
        add(f"shape-pair:{left:08x}:{right:08x}", 1.5)
    calls = sum((w >> 26) == 3 or ((w >> 26) == 0 and (w & 0x3f) == 9) for w in words)
    branches = sum((w >> 26) in (1, 4, 5, 6, 7, 0x14, 0x15) for w in words)
    add(f"calls:{min(31, calls)}", 2.0)
    add(f"branches:{min(63, branches)}", 2.0)
    norm = math.sqrt(sum(v * v for v in out.values())) or 1.0
    return {k: v / norm for k, v in out.items()}


def load_rows(path: Path) -> list[dict]:
    rows = []
    for number, line in enumerate(path.read_text().splitlines(), 1):
        if not line.strip():
            continue
        row = json.loads(line)
        missing = {"project", "function", "compiler_family", "compiler_version",
                   "flags", "text_sha256", "text_path"} - row.keys()
        if missing:
            raise ValueError(f"{path}:{number}: missing {sorted(missing)}")
        if row["compiler_family"] not in FAMILIES:
            raise ValueError(f"{path}:{number}: unknown compiler family")
        text_path = (path.parent / row["text_path"]).resolve()
        blob = text_path.read_bytes()
        digest = hashlib.sha256(blob).hexdigest()
        if digest != row["text_sha256"]:
            raise ValueError(f"{path}:{number}: text SHA-256 mismatch")
        if len(blob) % 4:
            raise ValueError(f"{path}:{number}: unaligned text")
        item = dict(row)
        item["_blob"] = blob
        item["_features"] = features(blob)
        rows.append(item)
    return rows


def split_projects(rows: list[dict], seed: int, test_fraction: float) -> tuple[list[dict], list[dict]]:
    projects = sorted({r["project"] for r in rows})
    rng = random.Random(seed)
    rng.shuffle(projects)
    count = max(1, min(len(projects) - 1, round(len(projects) * test_fraction))) if len(projects) > 1 else 0
    if not count:
        return rows, []
    families = {r["compiler_family"] for r in rows}
    by_project = {project: {r["compiler_family"] for r in rows if r["project"] == project}
                  for project in projects}
    order = {project: index for index, project in enumerate(projects)}
    choices = itertools.combinations(projects, count) if len(projects) <= 20 else (projects[:count],)
    eligible = []
    for choice in choices:
        selected = set(choice)
        training_families = set().union(*(by_project[p] for p in projects if p not in selected))
        if training_families != families:
            continue
        test_families = set().union(*(by_project[p] for p in selected))
        eligible.append((-len(test_families), tuple(sorted(order[p] for p in selected)), choice))
    if not eligible:
        raise ValueError("no project-disjoint split preserves every compiler family in training")
    test_projects = set(min(eligible)[2])
    return ([r for r in rows if r["project"] not in test_projects],
            [r for r in rows if r["project"] in test_projects])


def train(rows: list[dict]) -> dict:
    groups: dict[str, list[dict]] = defaultdict(list)
    for row in rows:
        groups[row["compiler_family"]].append(row["_features"])
    centroids = {}
    for family, samples in sorted(groups.items()):
        sums: dict[int, float] = defaultdict(float)
        for sample in samples:
            for key, value in sample.items():
                sums[key] += value
        vector = {str(k): v / len(samples) for k, v in sums.items()}
        norm = math.sqrt(sum(v * v for v in vector.values())) or 1.0
        centroids[family] = {k: v / norm for k, v in vector.items()}
    counts = Counter(r["compiler_family"] for r in rows)
    weights = {family: len(rows) / (len(counts) * count) for family, count in counts.items()}
    return {"version": 1, "features": FEATURES, "centroids": centroids,
            "class_weights": weights, "training_samples": len(rows),
            "families": sorted(centroids)}


def predict(model: dict, sample: dict[int, float]) -> list[tuple[str, float]]:
    scores = []
    for family, centroid in model["centroids"].items():
        score = sum(sample.get(int(k), 0.0) * value for k, value in centroid.items())
        scores.append((family, score))
    return sorted(scores, key=lambda item: (-item[1], item[0]))


def evaluate(model: dict, rows: list[dict]) -> dict:
    confusion: dict[str, Counter] = defaultdict(Counter)
    correct = 0
    for row in rows:
        choice = predict(model, row["_features"])[0][0]
        confusion[row["compiler_family"]][choice] += 1
        correct += choice == row["compiler_family"]
    return {"samples": len(rows), "accuracy": correct / len(rows) if rows else None,
            "confusion": {k: dict(v) for k, v in sorted(confusion.items())}}


def serializable_row(row: dict, weight: float, split: str) -> dict:
    return {k: v for k, v in row.items() if not k.startswith("_")} | {
        "balance_weight": weight, "split": split}


def collect_manifests(spec_path: Path, output: Path, blobs: Path) -> dict:
    """Extract compiler-labelled exact text from project matching manifests."""
    spec = json.loads(spec_path.read_text())
    base = spec_path.parent.parent.resolve()
    blobs.mkdir(parents=True, exist_ok=True)
    rows, rejected = [], Counter()
    seen = set()
    for project in spec["projects"]:
        configured_root = Path(os.path.expandvars(project["root"]))
        root = (configured_root if configured_root.is_absolute() else base / configured_root).resolve()
        if project.get("format") == "decompdecomp":
            compiled, reasons = collect_decompdecomp(project, root, output, blobs)
            rows.extend(compiled)
            rejected.update(reasons)
            continue
        image = (root / project["image"]).read_bytes()
        for manifest_spec in project["manifests"]:
            manifest = root / manifest_spec["path"]
            with manifest.open(newline="") as stream:
                for fields in csv.reader(stream, delimiter="\t"):
                    if not fields or not fields[0].startswith("0x") or len(fields) < 5:
                        continue
                    start, size = int(fields[0], 0), int(fields[1], 0)
                    source = root / fields[2]
                    if size <= 0 or size % 4:
                        rejected["non-code-alignment"] += 1; continue
                    if not fields[2].endswith(".c") or not source.is_file():
                        rejected["not-genuine-c"] += 1; continue
                    text = source.read_text(errors="replace")
                    if re.search(r"\b(?:asm|__asm__)\b|\.incbin\b", text):
                        rejected["assembly-escape"] += 1; continue
                    blob = image[start:start + size]
                    digest = hashlib.sha256(blob).hexdigest()
                    if len(blob) != size or digest != fields[4]:
                        rejected["hash-or-range"] += 1; continue
                    identity = (project["name"], fields[2], digest,
                                manifest_spec["compiler_family"], manifest_spec["compiler_version"])
                    if identity in seen:
                        rejected["duplicate"] += 1; continue
                    seen.add(identity)
                    blob_path = blobs / f"{digest}.bin"
                    if not blob_path.exists():
                        blob_path.write_bytes(blob)
                    rows.append({
                        "project": project["name"], "function": Path(fields[2]).stem,
                        "compiler_family": manifest_spec["compiler_family"],
                        "compiler_version": manifest_spec["compiler_version"],
                        "assembler": manifest_spec.get("assembler", "unknown"),
                        "flags": fields[3].split(), "source_path": fields[2],
                        "text_sha256": digest,
                        "text_path": os.path.relpath(blob_path, output.parent),
                        "provenance": "exact-c",
                    })
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in rows))
    return {"samples": len(rows), "projects": len({r['project'] for r in rows}),
            "families": dict(Counter(r["compiler_family"] for r in rows)),
            "rejected": dict(rejected)}


def _run(command: list[str], cwd: Path) -> None:
    result = subprocess.run(command, cwd=cwd, capture_output=True, text=True)
    if result.returncode:
        raise RuntimeError(f"{Path(command[0]).name} failed: {(result.stderr or result.stdout)[-800:]}")


def _sn_range(document: dict, address: int) -> dict | None:
    for item in document.get("compiler_ranges", []):
        if item["start"] <= address < item["end"] and item["toolchain"].startswith("sn-n64-"):
            return item
    return None


def elf32_text_functions(path: Path) -> tuple[bytes, list[tuple[int, int, str]]]:
    """Read .text and global FUNC symbols from an ELF32 object without BFD."""
    blob = path.read_bytes()
    if blob[:4] != b"\x7fELF" or blob[4] != 1 or blob[5] not in (1, 2):
        raise ValueError(f"not an ELF32 object: {path}")
    endian = ">" if blob[5] == 2 else "<"
    if len(blob) < 52:
        raise ValueError(f"truncated ELF header: {path}")
    section_offset = struct.unpack_from(endian + "I", blob, 32)[0]
    section_size, section_count, names_index = struct.unpack_from(endian + "HHH", blob, 46)
    if section_size < 40 or section_offset + section_size * section_count > len(blob):
        raise ValueError(f"invalid ELF section table: {path}")
    sections = [struct.unpack_from(endian + "IIIIIIIIII", blob, section_offset + i * section_size)
                for i in range(section_count)]
    if names_index >= len(sections):
        raise ValueError(f"invalid ELF section-name index: {path}")

    def section_bytes(section: tuple[int, ...]) -> bytes:
        offset, size = section[4], section[5]
        if offset + size > len(blob):
            raise ValueError(f"ELF section outside file: {path}")
        return blob[offset:offset + size]

    section_names = section_bytes(sections[names_index])

    def cstring(table: bytes, offset: int) -> str:
        if offset >= len(table):
            raise ValueError(f"ELF string offset outside table: {path}")
        end = table.find(b"\0", offset)
        if end < 0:
            raise ValueError(f"unterminated ELF string: {path}")
        return table[offset:end].decode("ascii", errors="strict")

    indexed = {cstring(section_names, section[0]): (index, section)
               for index, section in enumerate(sections)}
    if ".text" not in indexed or ".symtab" not in indexed:
        raise ValueError(f"ELF object lacks .text/.symtab: {path}")
    text_index, text_section = indexed[".text"]
    _, symbols_section = indexed[".symtab"]
    string_index, entry_size = symbols_section[6], symbols_section[9]
    if string_index >= len(sections) or entry_size < 16:
        raise ValueError(f"invalid ELF symbol table: {path}")
    strings, symbols_blob = section_bytes(sections[string_index]), section_bytes(symbols_section)
    functions = []
    for offset in range(0, len(symbols_blob) - entry_size + 1, entry_size):
        name, value, size, info, _other, section_index = struct.unpack_from(
            endian + "IIIBBH", symbols_blob, offset)
        if info >> 4 == 1 and info & 0xF == 2 and section_index == text_index:
            functions.append((value, size, cstring(strings, name)))
    return section_bytes(text_section), functions


def collect_decompdecomp(project: dict, root: Path, output: Path,
                         blobs: Path) -> tuple[list[dict], Counter]:
    """Compile public, upstream-verified decompdecomp matches into labelled samples.

    These are routing-model inputs, never matching evidence for Madden.  The
    upstream repository marks ``src/`` as byte-verified; we additionally build
    every admitted source with its recorded SN compiler range and reject any
    assembly escape.  Toolchain location is supplied outside tracked config via
    ``SN_N64_TOOLCHAIN``.
    """
    rejected: Counter = Counter()
    rows: list[dict] = []
    metadata = json.loads((root / project.get("metadata", "decompdecomp.json")).read_text())
    toolchain_value = os.environ.get("SN_N64_TOOLCHAIN")
    if not toolchain_value:
        raise ValueError("SN_N64_TOOLCHAIN is required for decompdecomp corpus projects")
    toolchain = Path(toolchain_value).resolve()
    required = [toolchain / name for name in ("wibo", "cc1n64.exe", "asn64.exe", "psyq-obj-parser")]
    if not all(path.is_file() for path in required):
        raise ValueError(f"incomplete SN_N64_TOOLCHAIN: {toolchain}")
    common = root / project.get("common_header", "include/common.h")
    functions = metadata["functions"]
    excluded = set(project.get("exclude_functions", []))
    sources = sorted((root / project.get("sources", "src")).glob("*.c"))
    with tempfile.TemporaryDirectory(prefix="compiler-corpus-sn-") as temporary:
        work = Path(temporary)
        for number, source in enumerate(sources):
            function = source.stem
            info = functions.get(function)
            if not info:
                rejected["missing-function-metadata"] += 1; continue
            compiler = _sn_range(metadata, int(info["vram"]))
            if compiler is None:
                rejected["non-sn-range"] += 1; continue
            text = source.read_text(errors="replace")
            if re.search(r"\b(?:asm|__asm__)\b|\.incbin\b", text):
                rejected["assembly-escape"] += 1; continue
            unit = work / f"unit-{number:05d}"
            unit.mkdir()
            pre, asm, psyq, obj = (unit / name for name in
                                    ("unit.i", "unit.s", "unit.obj", "unit.o"))
            try:
                _run(["gcc", "-E", "-P", "-undef", "-D__GNUC__=2", "-D__GNUC_MINOR__=8",
                      "-include", str(common), str(source), "-o", str(pre)], root)
                _run([str(toolchain / "wibo"), str(toolchain / "cc1n64.exe"), "-quiet",
                      *compiler["flags"], str(pre), "-o", str(asm)], root)
                _run([str(toolchain / "wibo"), str(toolchain / "asn64.exe"),
                      "-o", str(psyq), str(asm)], root)
                _run([str(toolchain / "psyq-obj-parser"), str(psyq), "-b", "-n",
                      "-o", str(obj)], root)
                blob, symbols = elf32_text_functions(obj)
            except (RuntimeError, subprocess.CalledProcessError, ValueError) as exc:
                rejected["compile-failed"] += 1
                if sum(key.startswith("compile-error-example:") for key in rejected) < 3:
                    rejected[f"compile-error-example:{str(exc)[-300:]}"] += 1
                continue
            for start, size, name in symbols:
                if name in excluded:
                    rejected["explicitly-excluded"] += 1; continue
                if size <= 0 or size % 4 or start + size > len(blob) or name not in functions:
                    rejected["invalid-symbol"] += 1; continue
                symbol_info = functions[name]
                symbol_compiler = _sn_range(metadata, int(symbol_info["vram"]))
                if symbol_compiler is None or symbol_compiler["toolchain"] != compiler["toolchain"]:
                    rejected["mixed-toolchain-unit"] += 1; continue
                code = blob[start:start + size]
                digest = hashlib.sha256(code).hexdigest()
                blob_path = blobs / f"{digest}.bin"
                if not blob_path.exists():
                    blob_path.write_bytes(code)
                rows.append({
                    "project": project["name"], "function": name,
                    "compiler_family": "sn-gcc", "compiler_version": compiler["toolchain"],
                    "assembler": "asn64", "flags": compiler["flags"],
                    "source_path": source.relative_to(root).as_posix(),
                    "text_sha256": digest,
                    "text_path": os.path.relpath(blob_path, output.parent),
                    "provenance": "upstream-byte-verified-c-recompiled",
                })
    return rows, rejected


def main() -> int:
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="command", required=True)
    collect = sub.add_parser("collect")
    collect.add_argument("spec", type=Path)
    collect.add_argument("output", type=Path)
    collect.add_argument("blobs", type=Path)
    build = sub.add_parser("build")
    build.add_argument("input", type=Path)
    build.add_argument("output", type=Path)
    build.add_argument("model", type=Path)
    build.add_argument("--additional-input", action="append", type=Path, default=[],
                       help="additional JSONL corpus with paths resolved relative to that file")
    build.add_argument("--seed", type=int, default=20261113)
    build.add_argument("--test-fraction", type=float, default=.2)
    classify = sub.add_parser("classify")
    classify.add_argument("model", type=Path)
    classify.add_argument("text", type=Path)
    args = ap.parse_args()
    if args.command == "collect":
        print(json.dumps(collect_manifests(args.spec.resolve(), args.output.resolve(),
                                           args.blobs.resolve()), sort_keys=True))
        return 0
    if args.command == "classify":
        model = json.loads(args.model.read_text())
        print(json.dumps({"predictions": predict(model, features(args.text.read_bytes()))}, indent=2))
        return 0
    rows = load_rows(args.input)
    for additional in args.additional_input:
        rows.extend(load_rows(additional))
    if not rows:
        raise SystemExit("empty compiler corpus")
    train_rows, test_rows = split_projects(rows, args.seed, args.test_fraction)
    if not train_rows:
        train_rows, test_rows = rows, []
    model = train(train_rows)
    model["seed"] = args.seed
    model["project_disjoint_test"] = evaluate(model, test_rows)
    counts = Counter(r["compiler_family"] for r in train_rows)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w") as out:
        for row in rows:
            split = "test" if row in test_rows else "train"
            weight = len(train_rows) / (len(counts) * counts[row["compiler_family"]]) if split == "train" else 1.0
            out.write(json.dumps(serializable_row(row, weight, split), sort_keys=True) + "\n")
    args.model.write_text(json.dumps(model, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"samples": len(rows), "train": len(train_rows), "test": len(test_rows),
                      "families": dict(Counter(r["compiler_family"] for r in rows)),
                      "evaluation": model["project_disjoint_test"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
