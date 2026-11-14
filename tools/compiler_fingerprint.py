#!/usr/bin/env python3
"""Extract deterministic MIPS compiler fingerprints and pairwise residual labels.

This tool does not predict or rewrite code.  It converts authoritative compiler
output and ROM text into compact labels suitable for retrieval and pre-compile
candidate-ranking experiments.  Exactness still comes only from byte comparison.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import struct
from collections import Counter
from pathlib import Path


REQUIRED_BATCH_FIELDS = {
    "source_project", "source_revision", "source_function", "compiler_lane",
    "mutation_family", "mutation_tokens", "target_path", "candidate_path",
}


def words(blob: bytes) -> list[int]:
    if len(blob) % 4:
        raise ValueError("MIPS text must be word aligned")
    return list(struct.unpack(f">{len(blob) // 4}I", blob))


def signed16(value: int) -> int:
    value &= 0xFFFF
    return value - 0x10000 if value & 0x8000 else value


def is_control(word: int) -> bool:
    opcode = word >> 26
    rs = (word >> 21) & 0x1F
    return opcode in {1, 2, 3, 4, 5, 6, 7, 20, 21, 22, 23} or (
        opcode == 17 and rs == 8
    ) or (opcode == 0 and (word & 0x3F) in {8, 9})


def is_call(word: int) -> bool:
    opcode = word >> 26
    return opcode == 3 or (opcode == 0 and (word & 0x3F) == 9)


def is_branch_likely(word: int) -> bool:
    opcode = word >> 26
    if opcode in {20, 21, 22, 23}:
        return True
    if opcode == 1:
        rt = (word >> 16) & 0x1F
        return rt in {2, 3, 18, 19}
    if opcode == 17 and ((word >> 21) & 0x1F) == 8:
        return bool((word >> 17) & 1)
    return False


def branch_target(index: int, word: int, count: int) -> int | None:
    opcode = word >> 26
    if opcode in {1, 4, 5, 6, 7, 20, 21, 22, 23} or (
        opcode == 17 and ((word >> 21) & 0x1F) == 8
    ):
        target = index + 1 + signed16(word)
        return target if 0 <= target < count else None
    return None


def _frame_size(insns: list[int]) -> int | None:
    for word in insns[:16]:
        opcode = word >> 26
        rs, rt = (word >> 21) & 0x1F, (word >> 16) & 0x1F
        immediate = signed16(word)
        if opcode in {9, 25} and rs == 29 and rt == 29 and immediate < 0:
            return -immediate
    return None


def _save_layout(insns: list[int]) -> tuple[int, dict[str, int], int, dict[str, int]]:
    gpr_mask = 0
    fpr_mask = 0
    gpr_layout: dict[str, int] = {}
    fpr_layout: dict[str, int] = {}
    for word in insns[:48]:
        if is_control(word):
            break
        opcode = word >> 26
        base, rt = (word >> 21) & 0x1F, (word >> 16) & 0x1F
        if opcode in {43, 63} and base == 29:  # sw/sd rt, off(sp)
            gpr_mask |= 1 << rt
            gpr_layout[str(rt)] = signed16(word)
        elif opcode in {57, 61} and base == 29:  # swc1/sdc1 ft, off(sp)
            fpr_mask |= 1 << rt
            fpr_layout[str(rt)] = signed16(word)
    return gpr_mask, gpr_layout, fpr_mask, fpr_layout


def _basic_block_lengths(insns: list[int]) -> list[int]:
    if not insns:
        return []
    starts = {0}
    for index, word in enumerate(insns):
        if is_control(word):
            if index + 2 < len(insns):
                starts.add(index + 2)  # instruction after the delay slot
            target = branch_target(index, word, len(insns))
            if target is not None:
                starts.add(target)
    ordered = sorted(starts)
    return [end - start for start, end in zip(ordered, ordered[1:] + [len(insns)])]


def fingerprint(blob: bytes) -> dict:
    insns = words(blob)
    save_mask, save_layout, fpr_save_mask, fpr_save_layout = _save_layout(insns)
    controls = [index for index, word in enumerate(insns) if is_control(word)]
    calls = sum(is_call(word) for word in insns)
    filled = sum(index + 1 < len(insns) and insns[index + 1] != 0 for index in controls)
    opcodes = Counter(str(word >> 26) for word in insns)
    memory = Counter()
    for word in insns:
        opcode = word >> 26
        if opcode in {32, 33, 34, 35, 36, 37, 38, 39, 55}:
            memory["loads"] += 1
        elif opcode in {40, 41, 42, 43, 44, 45, 46, 47, 63}:
            memory["stores"] += 1
    return {
        "schema": "mips-compiler-fingerprint-v1",
        "sha256": hashlib.sha256(blob).hexdigest(),
        "bytes": len(blob),
        "instructions": len(insns),
        "frame_size": _frame_size(insns),
        "gpr_save_mask": save_mask,
        "gpr_save_layout": save_layout,
        "fpr_save_mask": fpr_save_mask,
        "fpr_save_layout": fpr_save_layout,
        "control_transfers": len(controls),
        "calls": calls,
        "branch_likely": sum(is_branch_likely(word) for word in insns),
        "filled_delay_slots": filled,
        "nop_delay_slots": len(controls) - filled,
        "basic_block_lengths": _basic_block_lengths(insns),
        "opcode_histogram": dict(sorted(opcodes.items(), key=lambda item: int(item[0]))),
        "memory": dict(memory),
    }


def compare(target: bytes, candidate: bytes) -> dict:
    target_words, candidate_words = words(target), words(candidate)
    common = min(len(target_words), len(candidate_words))
    first = next((i for i in range(common) if target_words[i] != candidate_words[i]), common)
    if first == common and len(target_words) != len(candidate_words):
        first = common
    word_distance = sum(a != b for a, b in zip(target_words, candidate_words)) + abs(
        len(target_words) - len(candidate_words)
    )
    byte_distance = sum(a != b for a, b in zip(target, candidate)) + abs(
        len(target) - len(candidate)
    )
    tf, cf = fingerprint(target), fingerprint(candidate)
    target_frame, candidate_frame = tf["frame_size"], cf["frame_size"]
    frame_delta = None if target_frame is None or candidate_frame is None else candidate_frame - target_frame
    return {
        "schema": "mips-compiler-residual-v1",
        "exact": target == candidate,
        "first_mismatch_word": None if target == candidate else first,
        "matching_prefix_words": first,
        "word_distance": word_distance,
        "byte_distance": byte_distance,
        "length_delta_bytes": len(candidate) - len(target),
        "frame_size_delta": frame_delta,
        "gpr_save_mask_xor": tf["gpr_save_mask"] ^ cf["gpr_save_mask"],
        "fpr_save_mask_xor": tf["fpr_save_mask"] ^ cf["fpr_save_mask"],
        "control_transfer_delta": cf["control_transfers"] - tf["control_transfers"],
        "filled_delay_slot_delta": cf["filled_delay_slots"] - tf["filled_delay_slots"],
        "target": tf,
        "candidate": cf,
    }


def _contained_path(root: Path, value: str) -> Path:
    path = (root / value).resolve()
    try:
        path.relative_to(root.resolve())
    except ValueError as exc:
        raise ValueError(f"batch path escapes root: {value}") from exc
    if not path.is_file():
        raise ValueError(f"batch path is not a file: {value}")
    return path


def label_batch(rows: list[dict], root: Path) -> list[dict]:
    output = []
    for number, row in enumerate(rows, 1):
        missing = sorted(REQUIRED_BATCH_FIELDS - row.keys())
        if missing:
            raise ValueError(f"batch row {number} missing fields: {', '.join(missing)}")
        if not isinstance(row["mutation_tokens"], list) or not all(
                isinstance(token, str) for token in row["mutation_tokens"]):
            raise ValueError(f"batch row {number} mutation_tokens must be a string list")
        target = _contained_path(root, row["target_path"]).read_bytes()
        candidate = _contained_path(root, row["candidate_path"]).read_bytes()
        labeled = dict(row)
        labeled["authoritative_label"] = compare(target, candidate)
        labeled["label_provenance"] = {
            "kind": "compiler-output-byte-compare",
            "target_sha256": hashlib.sha256(target).hexdigest(),
            "candidate_sha256": hashlib.sha256(candidate).hexdigest(),
        }
        output.append(labeled)
    return output


def main() -> int:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    one = sub.add_parser("fingerprint")
    one.add_argument("input", type=Path)
    one.add_argument("output", type=Path)
    pair = sub.add_parser("compare")
    pair.add_argument("target", type=Path)
    pair.add_argument("candidate", type=Path)
    pair.add_argument("output", type=Path)
    batch = sub.add_parser("label-batch")
    batch.add_argument("input", type=Path)
    batch.add_argument("output", type=Path)
    batch.add_argument("--root", type=Path)
    args = parser.parse_args()
    if args.command == "fingerprint":
        document = fingerprint(args.input.read_bytes())
    elif args.command == "compare":
        document = compare(args.target.read_bytes(), args.candidate.read_bytes())
    else:
        rows = [json.loads(line) for line in args.input.read_text().splitlines() if line.strip()]
        labeled = label_batch(rows, (args.root or args.input.parent).resolve())
        args.output.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in labeled))
        print(json.dumps({"schema": "mips-compiler-label-batch-v1", "rows": len(labeled)},
                         sort_keys=True))
        return 0
    args.output.write_text(json.dumps(document, indent=2, sort_keys=True) + "\n")
    print(json.dumps({key: document[key] for key in ("schema", "exact") if key in document},
                     sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
