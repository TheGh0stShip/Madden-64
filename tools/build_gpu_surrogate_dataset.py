#!/usr/bin/env python3
"""Build leakage-safe datasets for a pre-compile N64 candidate ranker.

The CPU compiler and the exact byte matcher remain the only source of truth.
This module never produces a "match" verdict of its own: it validates labels
that were produced by an authoritative CPU compile, optionally recomputes them
from the compiled byte files, and builds deterministic, leakage-safe splits.

Row contract: ``n64-precompile-surrogate/v1`` (one JSON object per JSONL line).
See ``validate_row`` for the exact rejection rules.

MIPS prologue parsing (``mips_frame_size`` / ``mips_save_mask``):
  * Words are big-endian 32-bit MIPS instructions.
  * Only the prologue is scanned: at most ``PROLOGUE_SCAN_WORDS`` (32) words,
    stopping after the first branch/jump-like instruction *and its delay slot*
    (REGIMM, J, JAL, BEQ/BNE/BLEZ/BGTZ and their "likely" forms, JR, JALR).
  * Frame size: first ``addiu sp,sp,imm`` (``word & 0xFFFF0000 == 0x27BD0000``)
    with a negative signed 16-bit immediate; the frame size is ``-imm``.
    Returns 0 for leaf functions without a frame.
  * Save mask: every ``sw rt,off(sp)`` (``word & 0xFFE00000 == 0xAFA00000``)
    in the scanned window with rt in s0-s7 (16..23), fp (30) or ra (31) sets
    bit ``rt`` of the mask.  Argument spills (a0-a3) and other registers are
    ignored.

Splits are assigned with blake2b digests of (seed, mode, group key); Python's
``hash()`` and the global ``random`` state are never used.

Commands:
  validate INPUT.jsonl [--bytes-root DIR]
  build INPUT.jsonl --out DIR --mode repo|function|family [--seed 0]
        [--test-fraction 0.2] [--valid-fraction 0.1] [--holdout-families a,b]
        [--hard-negatives 4] [--bytes-root DIR] [--allow-rejects]
"""
from __future__ import annotations

import argparse
import copy
import hashlib
import json
import os
import math
import re
import sys
from pathlib import Path

SCHEMA = "n64-precompile-surrogate/v1"
LABEL_ORIGIN = "authoritative_cpu_compile"
SPLIT_NAMES = ("train", "valid", "test")
MODES = ("repo", "function", "family")
PROLOGUE_SCAN_WORDS = 32
SAVED_REGISTERS = tuple(range(16, 24)) + (30, 31)

LABEL_INT_KEYS = (
    "matching_prefix_words",
    "word_distance",
    "byte_distance",
    "target_words",
    "frame_size_delta",
    "save_mask_xor",
)
NONNEGATIVE_LABEL_KEYS = (
    "matching_prefix_words",
    "word_distance",
    "byte_distance",
    "target_words",
    "save_mask_xor",
)
COMPARED_LABEL_KEYS = ("exact", "first_mismatch_word") + LABEL_INT_KEYS

_HEX64 = re.compile(r"[0-9a-fA-F]{64}\Z")
_HEX40 = re.compile(r"[0-9a-fA-F]{40}\Z")
_SHA256_REV = re.compile(r"sha256:[0-9a-fA-F]{64}\Z")


class ContractError(ValueError):
    """A row violates the ``n64-precompile-surrogate/v1`` contract."""


class LeakageError(ValueError):
    """A function identity or candidate source appears in more than one split."""


# ---------------------------------------------------------------------------
# MIPS helpers and label computation
# ---------------------------------------------------------------------------

def _words(data: bytes) -> list[int]:
    if len(data) % 4:
        raise ValueError(f"byte length {len(data)} is not a multiple of 4")
    return [int.from_bytes(data[i:i + 4], "big") for i in range(0, len(data), 4)]


def _is_branch_like(word: int) -> bool:
    opcode = (word >> 26) & 0x3F
    if opcode == 0:
        return (word & 0x3F) in (8, 9)  # jr, jalr
    return opcode in (1, 2, 3, 4, 5, 6, 7, 20, 21, 22, 23)


def _prologue(words: list[int]) -> list[int]:
    window = list(words[:PROLOGUE_SCAN_WORDS])
    for index, word in enumerate(window):
        if _is_branch_like(word):
            return window[:index + 2]  # include the delay slot
    return window


def mips_frame_size(words: list[int]) -> int:
    """Return N for the first ``addiu sp,sp,-N`` in the prologue, else 0."""
    for word in _prologue(words):
        word &= 0xFFFFFFFF
        if word & 0xFFFF0000 == 0x27BD0000:
            imm = word & 0xFFFF
            if imm & 0x8000:
                return 0x10000 - imm
    return 0


def mips_save_mask(words: list[int]) -> int:
    """Return a bit mask of s0-s7/fp/ra registers stored to the stack in the prologue."""
    mask = 0
    for word in _prologue(words):
        word &= 0xFFFFFFFF
        if word & 0xFFE00000 == 0xAFA00000:
            rt = (word >> 16) & 31
            if rt in SAVED_REGISTERS:
                mask |= 1 << rt
    return mask


def compute_labels(target: bytes, candidate: bytes) -> dict:
    """Compute authoritative-shape labels from big-endian MIPS word bytes.

    ``first_mismatch_word`` is the first differing word index (or the shorter
    length when one is a strict prefix of the other); ``word_distance`` and
    ``byte_distance`` count differing positions over the longer sequence, with
    missing positions counted as different.
    """
    target_words = _words(bytes(target))
    candidate_words = _words(bytes(candidate))
    exact = bytes(target) == bytes(candidate)
    first = None
    if not exact:
        shared = min(len(target_words), len(candidate_words))
        first = shared
        for index in range(shared):
            if target_words[index] != candidate_words[index]:
                first = index
                break
    longest_words = max(len(target_words), len(candidate_words))
    word_distance = sum(
        1
        for index in range(longest_words)
        if index >= len(target_words)
        or index >= len(candidate_words)
        or target_words[index] != candidate_words[index]
    )
    tb, cb = bytes(target), bytes(candidate)
    longest_bytes = max(len(tb), len(cb))
    byte_distance = sum(
        1
        for index in range(longest_bytes)
        if index >= len(tb) or index >= len(cb) or tb[index] != cb[index]
    )
    return {
        "exact": exact,
        "first_mismatch_word": first,
        "matching_prefix_words": len(target_words) if exact else first,
        "word_distance": word_distance,
        "byte_distance": byte_distance,
        "target_words": len(target_words),
        "candidate_words": len(candidate_words),
        "frame_size_delta": mips_frame_size(candidate_words) - mips_frame_size(target_words),
        "save_mask_xor": mips_save_mask(target_words) ^ mips_save_mask(candidate_words),
    }


# ---------------------------------------------------------------------------
# Row validation
# ---------------------------------------------------------------------------

def _is_int(value) -> bool:
    return isinstance(value, int) and not isinstance(value, bool)


def _is_number(value) -> bool:
    return (_is_int(value) or isinstance(value, float)) and not (
        isinstance(value, float) and not math.isfinite(value)
    )


def _require(mapping: dict, key: str, where: str):
    if key not in mapping:
        raise ContractError(f"missing required field {where}{key}")
    return mapping[key]


def _require_str(mapping: dict, key: str, where: str = "") -> str:
    value = _require(mapping, key, where)
    if not isinstance(value, str):
        raise ContractError(f"wrong type for {where}{key}: expected str")
    if not value.strip():
        raise ContractError(f"empty string for {where}{key}")
    return value


def _require_dict(mapping: dict, key: str, where: str = "") -> dict:
    value = _require(mapping, key, where)
    if not isinstance(value, dict):
        raise ContractError(f"wrong type for {where}{key}: expected object")
    return value


def _resolve_bytes(bytes_root, relative, key: str) -> bytes:
    if not isinstance(relative, str) or not relative:
        raise ContractError(f"wrong type for {key}: expected non-empty str")
    if bytes_root is None:
        raise ContractError(f"{key} given but no bytes root was provided")
    if "\x00" in relative:
        raise ContractError(f"{key} contains a NUL byte")
    try:
        root = Path(bytes_root).resolve()
        if Path(relative).is_absolute():
            raise ContractError(f"{key} must be relative to the bytes root: {relative!r}")
        resolved = (root / relative).resolve()
        if not resolved.is_relative_to(root):
            raise ContractError(f"{key} escapes the bytes root: {relative!r}")
        if not resolved.is_file():
            raise ContractError(f"{key} not found under bytes root: {relative!r}")
        return resolved.read_bytes()
    except (OSError, ValueError) as exc:
        if isinstance(exc, ContractError):
            raise
        raise ContractError(f"{key} unreadable: {exc}") from None


def _validate_labels(labels) -> dict:
    if not isinstance(labels, dict):
        raise ContractError("wrong type for labels: expected object")
    out = dict(labels)
    exact = _require(out, "exact", "labels.")
    if not isinstance(exact, bool):
        raise ContractError("wrong type for labels.exact: expected bool")
    first = _require(out, "first_mismatch_word", "labels.")
    if first is not None and not _is_int(first):
        raise ContractError("wrong type for labels.first_mismatch_word: expected int or null")
    if first is not None and first < 0:
        raise ContractError("negative count labels.first_mismatch_word")
    for key in LABEL_INT_KEYS:
        if not _is_int(_require(out, key, "labels.")):
            raise ContractError(f"wrong type for labels.{key}: expected int")
    if "candidate_words" in out and not _is_int(out["candidate_words"]):
        raise ContractError("wrong type for labels.candidate_words: expected int")
    for key in NONNEGATIVE_LABEL_KEYS + (("candidate_words",) if "candidate_words" in out else ()):
        if out[key] < 0:
            raise ContractError(f"negative count labels.{key}")
    distances_zero = out["word_distance"] == 0 and out["byte_distance"] == 0
    if not (exact == (first is None) == distances_zero):
        raise ContractError(
            "label inconsistency: exact, first_mismatch_word is null, and "
            "word_distance == 0 == byte_distance must agree"
        )
    if exact:
        if out["matching_prefix_words"] != out["target_words"]:
            raise ContractError("label inconsistency: exact requires matching_prefix_words == target_words")
        if out["frame_size_delta"] != 0:
            raise ContractError("label inconsistency: exact requires frame_size_delta == 0")
        if out["save_mask_xor"] != 0:
            raise ContractError("label inconsistency: exact requires save_mask_xor == 0")
    elif out["matching_prefix_words"] != first:
        raise ContractError("label inconsistency: non-exact requires matching_prefix_words == first_mismatch_word")
    if out["target_words"] == 0:
        raise ContractError("label inconsistency: target_words must be > 0 (empty target extraction)")
    if not exact:
        if out["word_distance"] < 1 or out["byte_distance"] < 1:
            raise ContractError("label inconsistency: non-exact requires word_distance >= 1 and byte_distance >= 1")
        if first > max(out["target_words"], out.get("candidate_words", out["target_words"])):
            raise ContractError("label inconsistency: first_mismatch_word beyond both function lengths")
    allowed_mask = sum(1 << r for r in SAVED_REGISTERS)
    if out["save_mask_xor"] & ~allowed_mask:
        raise ContractError("label inconsistency: save_mask_xor has bits outside s0-s7/fp/ra")
    return out


def validate_row(row: dict, bytes_root: Path | None = None) -> dict:
    """Validate one contract row and return a normalized deep copy.

    Raises ``ContractError`` with a human-readable reason on any violation.
    Hex digests are lower-cased.  When both byte paths are present the labels
    are recomputed from the bytes (paths are resolved under ``bytes_root`` and
    may not escape it); supplied labels must then agree with the bytes.
    """
    if not isinstance(row, dict):
        raise ContractError("row is not a JSON object")
    out = copy.deepcopy(row)
    schema = _require(out, "schema", "")
    if schema != SCHEMA:
        raise ContractError(f"schema mismatch: expected {SCHEMA!r}, got {schema!r}")
    _require_str(out, "candidate_id")
    _require_str(out, "project")
    _require_str(out, "repo")
    revision = _require_str(out, "source_revision")
    if not (_HEX40.match(revision) or _SHA256_REV.match(revision)):
        raise ContractError("source_revision must be a 40-hex git sha or 'sha256:<64 hex>'")
    out["source_revision"] = revision.lower()

    function = _require_dict(out, "function")
    _require_str(function, "name", "function.")
    canonical = _require_str(function, "canonical_hash", "function.")
    if not _HEX64.match(canonical):
        raise ContractError("function.canonical_hash must be 64 hex characters")
    function["canonical_hash"] = canonical.lower()
    address = function.get("address")
    if address is not None and not (isinstance(address, str) or _is_int(address)):
        raise ContractError("wrong type for function.address: expected str or int")

    generation = _require(out, "generation_index", "")
    if not _is_int(generation):
        raise ContractError("wrong type for generation_index: expected int")
    if generation < 0:
        raise ContractError("negative count generation_index")

    mutation = _require_dict(out, "mutation")
    _require_str(mutation, "family", "mutation.")
    tokens = _require(mutation, "tokens", "mutation.")
    if not isinstance(tokens, list) or not all(isinstance(token, str) for token in tokens):
        raise ContractError("wrong type for mutation.tokens: expected list[str]")

    _require_str(out, "compiler_lane")

    if "structural" in out and out["structural"] is not None:
        structural = out["structural"]
        if not isinstance(structural, dict):
            raise ContractError("wrong type for structural: expected object")
        for key, value in structural.items():
            if not isinstance(key, str) or not _is_number(value):
                raise ContractError(f"wrong type for structural.{key}: expected finite number")

    digest = out.get("candidate_source_digest")
    if digest is not None:
        if not isinstance(digest, str) or not _HEX64.match(digest):
            raise ContractError("candidate_source_digest must be 64 hex characters")
        out["candidate_source_digest"] = digest.lower()

    provenance = _require_dict(out, "provenance")
    _require_str(provenance, "compiler", "provenance.")
    _require_str(provenance, "matcher", "provenance.")
    if provenance.get("verified") is not True:
        raise ContractError("provenance.verified is not literally true")
    origin = _require(provenance, "label_origin", "provenance.")
    if origin != LABEL_ORIGIN:
        raise ContractError(f"provenance.label_origin must be {LABEL_ORIGIN!r}, got {origin!r}")
    if "compile_seconds" in provenance and provenance["compile_seconds"] is not None:
        seconds = provenance["compile_seconds"]
        if not _is_number(seconds):
            raise ContractError("wrong type for provenance.compile_seconds: expected number")
        if seconds < 0:
            raise ContractError("negative count provenance.compile_seconds")

    target_path = out.get("target_bytes_path")
    candidate_path = out.get("candidate_bytes_path")
    has_bytes = target_path is not None or candidate_path is not None
    if has_bytes and (target_path is None or candidate_path is None):
        raise ContractError("target_bytes_path and candidate_bytes_path must be given together")

    labels = out.get("labels")
    if labels is not None:
        labels = _validate_labels(labels)
    if has_bytes:
        target = _resolve_bytes(bytes_root, target_path, "target_bytes_path")
        candidate = _resolve_bytes(bytes_root, candidate_path, "candidate_bytes_path")
        if not target:
            raise ContractError("empty target byte file")
        try:
            computed = compute_labels(target, candidate)
        except ValueError as exc:
            raise ContractError(f"invalid byte files: {exc}") from None
        if labels is not None:
            keys = COMPARED_LABEL_KEYS + (("candidate_words",) if "candidate_words" in labels else ())
            disagree = [key for key in keys if labels[key] != computed[key]]
            if disagree:
                raise ContractError("label/bytes disagreement on " + ", ".join(disagree))
        out["labels"] = computed
    elif labels is None:
        raise ContractError("missing required field labels (and no byte paths to compute them)")
    else:
        out["labels"] = labels
    return out


def _read_lines(path):
    with open(path, "r", encoding="utf-8") as handle:
        return handle.read().splitlines()


def _no_duplicate_keys(pairs):
    out = {}
    for key, value in pairs:
        if key in out:
            raise ValueError(f"duplicate JSON key {key!r}")
        out[key] = value
    return out


def load_rows(path, bytes_root=None) -> tuple[list[dict], list[dict]]:
    """Load and validate a JSONL file; return (valid rows, rejected records)."""
    valid: list[dict] = []
    rejected: list[dict] = []
    seen: set[str] = set()
    for number, line in enumerate(_read_lines(path), start=1):
        if not line.strip():
            continue
        candidate_id = None
        try:
            row = json.loads(line, object_pairs_hook=_no_duplicate_keys)
        except json.JSONDecodeError as exc:
            rejected.append({"line": number, "candidate_id": None, "reason": f"invalid JSON: {exc.msg}"})
            continue
        except (ValueError, RecursionError) as exc:
            rejected.append({"line": number, "candidate_id": None, "reason": f"invalid JSON: {exc}"[:200]})
            continue
        if isinstance(row, dict) and isinstance(row.get("candidate_id"), str):
            candidate_id = row["candidate_id"]
        try:
            normalized = validate_row(row, bytes_root)
            if normalized["candidate_id"] in seen:
                raise ContractError(f"duplicate candidate_id {normalized['candidate_id']!r}")
        except ContractError as exc:
            rejected.append({"line": number, "candidate_id": candidate_id, "reason": str(exc)})
            continue
        seen.add(normalized["candidate_id"])
        valid.append(normalized)
    return valid, rejected


# ---------------------------------------------------------------------------
# Splitting
# ---------------------------------------------------------------------------

def _digest(seed, mode: str, key: str) -> bytes:
    material = json.dumps([str(seed), mode, key], separators=(",", ":")).encode("utf-8")
    return hashlib.blake2b(material, digest_size=16).digest()


def _rank_groups(keys, seed, mode: str) -> list[str]:
    return sorted(set(keys), key=lambda key: (_digest(seed, mode, key), key))


def _split_counts(n: int, test_fraction: float, valid_fraction: float) -> tuple[int, int]:
    n_test = int(round(test_fraction * n))
    n_valid = int(round(valid_fraction * n))
    if test_fraction > 0 and n_test == 0 and n >= 2:
        n_test = 1
    if valid_fraction > 0 and n_valid == 0 and n - n_test >= 2:
        n_valid = 1
    while n >= 1 and n_test + n_valid >= n and (n_valid or n_test):
        if n_valid:
            n_valid -= 1
        else:
            n_test -= 1
    return n_test, n_valid


def _row_order(row: dict):
    return (
        row["repo"],
        row["source_revision"],
        row["function"]["canonical_hash"],
        row["compiler_lane"],
        row["generation_index"],
        row["candidate_id"],
    )


def _check_fractions(test_fraction: float, valid_fraction: float) -> None:
    for name, value in (("test_fraction", test_fraction), ("valid_fraction", valid_fraction)):
        if not _is_number(value) or value < 0 or value >= 1:
            raise ValueError(f"{name} must be in [0, 1)")
    if test_fraction + valid_fraction >= 1:
        raise ValueError("test_fraction + valid_fraction must be < 1")


def resolve_holdout_families(rows, seed=0, test_fraction=0.2, holdout_families=None) -> list[str]:
    """Return the sorted family holdout used by ``split_rows(mode="family")``."""
    families = sorted({row["mutation"]["family"] for row in rows})
    if holdout_families is not None:
        if isinstance(holdout_families, str):
            holdout_families = [part for part in holdout_families.split(",") if part]
        unknown = sorted(set(holdout_families) - set(families))
        if not holdout_families or unknown:
            raise ValueError(f"holdout families must be non-empty and present in the data; unknown: {unknown}")
        return sorted(set(holdout_families))
    ranked = _rank_groups(families, seed, "family-holdout")
    count = int(round(test_fraction * len(ranked)))
    if test_fraction > 0 and count == 0 and len(ranked) >= 2:
        count = 1
    if count >= len(ranked) and len(ranked) >= 2:
        count = len(ranked) - 1
    return sorted(ranked[:count])


def _identity_keys(row: dict) -> list[tuple[str, str]]:
    keys = [("canonical_hash", str(row["function"]["canonical_hash"]).lower())]
    if row.get("candidate_source_digest"):
        keys.append(("candidate_source_digest", str(row["candidate_source_digest"]).lower()))
    return keys


def _purge(splits: dict[str, list[dict]], purged: list[dict]) -> None:
    """Remove lower-priority rows that share identities with higher splits.

    Priority is test > valid > train: a shared canonical_hash or source digest
    is kept in the higher-priority split and purged from the lower one.
    """
    claimed: set[tuple[str, str]] = set()
    for name in ("test", "valid", "train"):
        kept = []
        for row in splits[name]:
            hits = [key for key in _identity_keys(row) if key in claimed]
            if hits:
                record = copy.deepcopy(row)
                record["split"] = "purged"
                record["purged_from"] = name
                record["purge_reason"] = "shared " + ", ".join(sorted({kind for kind, _ in hits}))
                purged.append(record)
            else:
                kept.append(row)
        splits[name] = kept
        for row in kept:
            claimed.update(_identity_keys(row))


def split_rows(rows, mode, seed=0, test_fraction=0.2, valid_fraction=0.1, holdout_families=None) -> dict:
    """Deterministically split validated rows into train/valid/test (+ purged).

    * ``repo``: groups by ``repo``.
    * ``function``: groups by ``function.canonical_hash``.
    * ``family``: rows whose mutation family is held out go to test; the rest
      are split into train/valid by canonical_hash.
    In every mode, train/valid rows sharing a canonical_hash or
    candidate_source_digest with a higher-priority split (test > valid > train)
    are purged instead of leaked.  Group order is ranked by a blake2b digest of
    (seed, mode, key); counts come from the fractions over the group count.
    """
    if mode not in MODES:
        raise ValueError(f"mode must be one of {', '.join(MODES)}")
    _check_fractions(test_fraction, valid_fraction)
    rows = [copy.deepcopy(row) for row in rows]
    ids = [row["candidate_id"] for row in rows]
    if len(set(ids)) != len(ids):
        raise ContractError("duplicate candidate_id in rows")
    rows.sort(key=_row_order)
    splits: dict[str, list[dict]] = {name: [] for name in SPLIT_NAMES}

    if mode in ("repo", "function"):
        key_of = (lambda row: row["repo"]) if mode == "repo" else (lambda row: row["function"]["canonical_hash"])
        ranked = _rank_groups([key_of(row) for row in rows], seed, mode)
        n_test, n_valid = _split_counts(len(ranked), test_fraction, valid_fraction)
        assignment = {}
        for index, key in enumerate(ranked):
            assignment[key] = "test" if index < n_test else "valid" if index < n_test + n_valid else "train"
        for row in rows:
            splits[assignment[key_of(row)]].append(row)
    else:
        holdout = set(resolve_holdout_families(rows, seed, test_fraction, holdout_families))
        rest = []
        for row in rows:
            (splits["test"] if row["mutation"]["family"] in holdout else rest).append(row)
        test_hashes = {row["function"]["canonical_hash"] for row in splits["test"]}
        remaining = [row["function"]["canonical_hash"] for row in rest
                     if row["function"]["canonical_hash"] not in test_hashes]
        ranked = _rank_groups(remaining, seed, "family-valid")
        share = valid_fraction / (1.0 - test_fraction) if test_fraction < 1 else 0.0
        _, n_valid = _split_counts(len(ranked), 0.0, share)
        valid_keys = set(ranked[:n_valid])
        for row in rest:
            name = "valid" if row["function"]["canonical_hash"] in valid_keys else "train"
            splits[name].append(row)

    purged: list[dict] = []
    _purge(splits, purged)
    for name in SPLIT_NAMES:
        for row in splits[name]:
            row["split"] = name
    purged.sort(key=_row_order)
    check_leakage(splits)
    return {"train": splits["train"], "valid": splits["valid"], "test": splits["test"], "purged": purged}


def check_leakage(splits: dict[str, list[dict]]) -> None:
    """Raise LeakageError if a canonical_hash or candidate_source_digest spans splits."""
    owners: dict[tuple[str, str], set[str]] = {}
    for name in SPLIT_NAMES:
        for row in splits.get(name, []) or []:
            canonical = (row.get("function") or {}).get("canonical_hash")
            if canonical:
                owners.setdefault(("canonical_hash", str(canonical).lower()), set()).add(name)
            digest = row.get("candidate_source_digest")
            if digest:
                owners.setdefault(("candidate_source_digest", str(digest).lower()), set()).add(name)
    leaks = sorted((kind, value, sorted(names)) for (kind, value), names in owners.items() if len(names) > 1)
    if leaks:
        shown = "; ".join(f"{kind} {value} in {'/'.join(names)}" for kind, value, names in leaks[:10])
        more = f" (+{len(leaks) - 10} more)" if len(leaks) > 10 else ""
        raise LeakageError(f"{len(leaks)} identities leak across splits: {shown}{more}")


# ---------------------------------------------------------------------------
# Hard negatives
# ---------------------------------------------------------------------------

def mine_hard_negatives(rows, per_function=4) -> list[dict]:
    """Return near-miss non-exact rows from pools that contain an exact match.

    A pool is (source_revision, function.canonical_hash, compiler_lane).  Rows
    are ranked by (-matching_prefix_words, word_distance, generation_index,
    candidate_id); pools are emitted in sorted key order.
    """
    pools: dict[tuple[str, str, str], list[dict]] = {}
    for row in rows:
        key = (row["source_revision"], row["function"]["canonical_hash"], row["compiler_lane"])
        pools.setdefault(key, []).append(row)
    mined = []
    for key in sorted(pools):
        pool = pools[key]
        if not any(row["labels"]["exact"] for row in pool):
            continue
        negatives = sorted(
            (row for row in pool if not row["labels"]["exact"]),
            key=lambda row: (
                -row["labels"]["matching_prefix_words"],
                row["labels"]["word_distance"],
                row["generation_index"],
                row["candidate_id"],
            ),
        )
        for row in negatives[:max(0, int(per_function))]:
            record = copy.deepcopy(row)
            record["hard_negative"] = True
            mined.append(record)
    return mined


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def _jsonl(rows) -> bytes:
    return "".join(json.dumps(row, sort_keys=True) + "\n" for row in rows).encode("utf-8")


def _dump(payload) -> str:
    return json.dumps(payload, sort_keys=True, indent=2) + "\n"


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    sub = parser.add_subparsers(dest="command", required=True)
    validate = sub.add_parser("validate", help="validate a JSONL file against the row contract")
    validate.add_argument("input")
    validate.add_argument("--bytes-root", default=None)
    build = sub.add_parser("build", help="build leakage-safe splits")
    build.add_argument("input")
    build.add_argument("--out", required=True)
    build.add_argument("--mode", required=True, choices=MODES)
    build.add_argument("--seed", type=int, default=0)
    build.add_argument("--test-fraction", type=float, default=0.2)
    build.add_argument("--valid-fraction", type=float, default=0.1)
    build.add_argument("--holdout-families", default=None)
    build.add_argument("--hard-negatives", type=int, default=4)
    build.add_argument("--bytes-root", default=None)
    build.add_argument("--allow-rejects", action="store_true")
    return parser


def _cmd_validate(args) -> int:
    valid, rejected = load_rows(args.input, args.bytes_root)
    summary = {
        "schema": SCHEMA,
        "valid": len(valid),
        "rejected_count": len(rejected),
        "rejected": rejected,
        "exact": sum(1 for row in valid if row["labels"]["exact"]),
    }
    sys.stdout.write(_dump(summary))
    return 1 if rejected else 0


def _cmd_build(args) -> int:
    out = Path(args.out)
    # Never leave a previous run's outputs (and its "passed" manifest) behind on failure.
    for stale in ("train.jsonl", "valid.jsonl", "test.jsonl", "hard_negatives.jsonl", "manifest.json"):
        (out / stale).unlink(missing_ok=True)
    if args.hard_negatives < 0:
        raise ValueError("--hard-negatives must be >= 0")
    valid, rejected = load_rows(args.input, args.bytes_root)
    if not valid:
        sys.stdout.write(_dump({"schema": SCHEMA, "error": "no valid rows", "rejected": rejected}))
        return 1
    if rejected and not args.allow_rejects:
        sys.stdout.write(_dump({"schema": SCHEMA, "error": "rejected rows", "rejected": rejected}))
        return 1
    holdout = None
    if args.holdout_families is not None:
        holdout = [part.strip() for part in args.holdout_families.split(",") if part.strip()]
    splits = split_rows(valid, args.mode, seed=args.seed, test_fraction=args.test_fraction,
                        valid_fraction=args.valid_fraction, holdout_families=holdout)
    if not splits["train"] or (args.test_fraction > 0 and not splits["test"]):
        sys.stderr.write(f"error: degenerate split train={len(splits['train'])} test={len(splits['test'])} "
                         f"purged={len(splits['purged'])}; no outputs written\n")
        return 1
    hard = mine_hard_negatives(splits["train"], per_function=args.hard_negatives)
    payloads = {
        "train.jsonl": _jsonl(splits["train"]),
        "valid.jsonl": _jsonl(splits["valid"]),
        "test.jsonl": _jsonl(splits["test"]),
        "hard_negatives.jsonl": _jsonl(hard),
    }
    manifest = {
        "schema": SCHEMA,
        "mode": args.mode,
        "seed": args.seed,
        "test_fraction": args.test_fraction,
        "valid_fraction": args.valid_fraction,
        "hard_negatives_per_function": args.hard_negatives,
        "hard_negatives_source": "train",
        "input_sha256": hashlib.sha256(Path(args.input).read_bytes()).hexdigest(),
        "counts": {
            "input_valid": len(valid),
            "rejected": len(rejected),
            "train": len(splits["train"]),
            "valid": len(splits["valid"]),
            "test": len(splits["test"]),
            "purged": len(splits["purged"]),
            "hard_negatives": len(hard),
        },
        "files": {name: hashlib.sha256(data).hexdigest() for name, data in payloads.items()},
        "rejected": rejected,
        "purged": len(splits["purged"]),
        "purged_candidate_ids": [row["candidate_id"] for row in splits["purged"]],
        "leakage_check": "passed",
        "canonical_hashes": {
            name: len({row["function"]["canonical_hash"] for row in splits[name]}) for name in SPLIT_NAMES
        },
    }
    if args.mode == "family":
        manifest["holdout_families"] = resolve_holdout_families(valid, args.seed, args.test_fraction, holdout)
    out.mkdir(parents=True, exist_ok=True)
    for name, data in payloads.items():  # write-then-rename; manifest last
        tmp = out / (name + ".tmp")
        tmp.write_bytes(data)
        os.replace(tmp, out / name)
    tmp = out / "manifest.json.tmp"
    tmp.write_text(_dump(manifest), encoding="utf-8")
    os.replace(tmp, out / "manifest.json")
    sys.stdout.write(_dump({"out": str(out), "counts": manifest["counts"], "leakage_check": "passed"}))
    return 0


def main(argv=None) -> int:
    args = _parser().parse_args(argv)
    try:
        if args.command == "validate":
            return _cmd_validate(args)
        return _cmd_build(args)
    except (OSError, ValueError) as exc:
        sys.stderr.write(f"error: {type(exc).__name__}: {exc}\n")
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
