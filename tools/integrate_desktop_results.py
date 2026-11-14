#!/usr/bin/env python3
"""Verify and transactionally integrate Desktop exact-C result artifacts.

Desktop is untrusted compute: every declared file hash is checked, source paths
are confined to the artifact, C provenance is scanned, and n64dk independently
rebuilds each candidate against the authoritative image.  Dry-run is default.
``--apply`` updates sources, manifests, and the configured matched-function
count as one rollback-safe filesystem transaction; it never commits or pushes.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import tomllib
import uuid
from pathlib import Path

ASM_ESCAPE = re.compile(
    r"\b(?:__asm__|__asm|_asm|asm)\b|\.incbin\b|"
    r"^\s*\.(?:word|byte|half|long|quad|ascii|asciz|string|space|fill|org)\b|"
    r"\bregister\b[^;\n]*\basm\s*\(|__attribute__\s*\(\(\s*naked\s*\)\)",
    re.MULTILINE | re.IGNORECASE)
RAW_CODE_ARRAY = re.compile(
    r"(?:0x[0-9a-fA-F]{8}[uUlL]*\s*,\s*){4}|"
    r"(?:0x[0-9a-fA-F]{2}[uUlL]*\s*,\s*){16}")
LOCAL_INCLUDE = re.compile(r'^\s*#\s*include\s*"([^"]+)"', re.MULTILINE)
GENERIC_NORMALIZERS = {
    "--normalizer-enable-KMC-ABS-SYM-PAIR", "--normalizer-enable-KMC-FP-PAIR-WORDS",
    "--normalizer-enable-KMC-LID-ALIGN4", "--normalizer-enable-KMC-LID-PAIR",
    "--normalizer-enable-KMC-LID-PAD4",
}


def has_specific_normalizer(flags: str) -> bool:
    return any(token.startswith("--normalizer-enable-") and token not in GENERIC_NORMALIZERS
               for token in flags.split())

MODULES = {
    "resident": ("build/us/main_unpacked.z64", "config/us/matching_kmc_units.tsv",
                 ["build/us/survey/symbol_addrs.txt", "config/us/functions_resident.toml"], 0x80000400, 0x1000),
    "overlay_1": ("build/us/audit/overlay_1_composite.z64", "config/us/matching_overlay1_kmc_units.tsv",
                  ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_1_functions/symbol_addrs.txt"], 0x80090004, 0x1000),
    "overlay_2": ("build/us/audit/overlay_2_composite.z64", "config/us/matching_overlay2_kmc_units.tsv",
                  ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_2_functions/symbol_addrs.txt"], 0x8008B8E0, 0x1000),
    "overlay_4": ("build/us/audit/overlay_4_composite.z64", "config/us/matching_overlay4_kmc_units.tsv",
                  ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_4_functions/symbol_addrs.txt"], 0x800C77E8, 0x1000),
    "overlay_5": ("build/us/audit/overlay_5_composite.z64", "config/us/matching_overlay5_kmc_units.tsv",
                  ["build/us/survey/symbol_addrs.txt", "build/us/audit/overlay_5_functions/symbol_addrs.txt"], 0x800C5F48, 0x1000),
    "boot_loader": ("Madden Football 64 (USA).z64", "config/us/matching_loader_kmc_units.tsv", [], 0x80200400, 0x1000),
}
DESTINATION_ROOTS = {
    "resident": "src/code", "overlay_1": "src/overlays/overlay1",
    "overlay_2": "src/overlays/overlay2", "overlay_4": "src/overlays/overlay4",
    "overlay_5": "src/overlays/overlay5", "boot_loader": "src/loader",
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def confined(root: Path, relative: str) -> Path:
    if Path(relative).is_absolute():
        raise ValueError(f"absolute artifact path: {relative}")
    path = (root / relative).resolve()
    try:
        path.relative_to(root.resolve())
    except ValueError as exc:
        raise ValueError(f"artifact path escapes root: {relative}") from exc
    return path


def verify_artifact(root: Path) -> list[dict]:
    manifest = json.loads((root / "artifact-manifest.json").read_text())
    if manifest.get("version") != 1 or not isinstance(manifest.get("files"), dict):
        raise ValueError("unsupported artifact manifest")
    for relative, expected in manifest["files"].items():
        path = confined(root, relative)
        if not path.is_file() or sha256(path) != expected:
            raise ValueError(f"artifact checksum mismatch: {relative}")
    results = confined(root, manifest.get("results", "results.jsonl"))
    return [json.loads(line) for line in results.read_text().splitlines() if line.strip()]


def provenance(source: Path, flags: str, root: Path | None = None) -> None:
    text = source.read_text()
    if ASM_ESCAPE.search(text) or RAW_CODE_ARRAY.search(text):
        raise ValueError(f"assembly escape rejected: {source}")
    if has_specific_normalizer(flags):
        raise ValueError(f"function-specific normalizer rejected: {source}")
    if source.suffix != ".c":
        raise ValueError(f"only genuine C candidates are accepted: {source}")
    if root is not None:
        visited = set()

        def scan_includes(path: Path) -> None:
            if path in visited:
                return
            visited.add(path); body = path.read_text(errors="replace")
            if ASM_ESCAPE.search(body):
                raise ValueError(f"assembly escape in transitive include: {path}")
            for name in LOCAL_INCLUDE.findall(body):
                choices = (path.parent / name, root / "include" / name, root / name)
                header = next((candidate.resolve() for candidate in choices if candidate.is_file()), None)
                if header is None:
                    raise ValueError(f"unresolved local include {name!r} from {path}")
                try:
                    header.relative_to(root.resolve())
                except ValueError as exc:
                    raise ValueError(f"include escapes project: {header}") from exc
                scan_includes(header)

        scan_includes(source)


def verify_row(root: Path, artifact: Path, row: dict, python: str,
               pythonpath: str | None) -> tuple[dict, Path]:
    required = {"module", "source", "destination", "function", "vram", "size", "pipeline", "flags"}
    missing = required - row.keys()
    if missing:
        raise ValueError(f"result missing {sorted(missing)}")
    if row["module"] not in MODULES:
        raise ValueError(f"unknown module {row['module']}")
    source = confined(artifact, row["source"])
    destination = Path(row["destination"])
    if destination.is_absolute() or ".." in destination.parts or destination.suffix != ".c":
        raise ValueError(f"unsafe destination {destination}")
    expected_root = Path(DESTINATION_ROOTS[row["module"]])
    try:
        destination.relative_to(expected_root)
        under_expected_root = True
    except ValueError:
        under_expected_root = False
    if not under_expected_root or destination.stem != row["function"]:
        raise ValueError(f"destination must be {expected_root}/<target-function>.c: {destination}")
    destination_path = (root / destination).resolve()
    try:
        destination_path.relative_to(root.resolve())
    except ValueError as exc:
        raise ValueError(f"destination escapes project through symlink: {destination}") from exc
    provenance(source, row["flags"], root)
    if not re.search(rf"\b{re.escape(row['function'])}\s*\(", source.read_text()):
        raise ValueError(f"candidate does not define target symbol {row['function']}: {source}")
    image, _, symbols, manifest_vram, manifest_rom = MODULES[row["module"]]
    command = [python, "-m", "n64dk", "--format", "json", "match", str(source),
               "--project", str(root), "--rom", str(root / image),
               "--addr", str(row["vram"]), "--size", str(row["size"]),
               "--pipeline", row["pipeline"], "--flags", row["flags"]]
    for symbol_file in symbols:
        command.extend(("--symbols", str(root / symbol_file)))
    env = dict(os.environ)
    if pythonpath:
        env["PYTHONPATH"] = pythonpath
    proc = subprocess.run(command, cwd=root, env=env, capture_output=True, text=True)
    if proc.returncode:
        raise ValueError(f"independent matcher failed for {source}: {proc.stderr[-800:]}")
    result = json.loads(proc.stdout)
    if not result.get("exact"):
        raise ValueError(f"candidate is not exact: {source}: {result.get('diff')}")
    matcher_row = result.get("manifest_row")
    if not matcher_row:
        raise ValueError(f"matcher omitted manifest row: {source}")
    fields = matcher_row.split("\t")
    if len(fields) != 5:
        raise ValueError(f"malformed matcher manifest row: {source}")
    vram = int(str(row["vram"]), 16)
    fields[0] = f"0x{manifest_rom + vram - manifest_vram:X}"
    fields[1] = f"0x{int(str(row['size']), 16):X}"
    fields[2] = destination.as_posix()
    manifest_row = "\t".join(fields)
    return {"row": row, "source": source, "destination": destination_path,
            "manifest": root / MODULES[row["module"]][1], "manifest_row": manifest_row}, source


def _manifest_ranges(paths: list[Path], root: Path,
                     overrides: dict[Path, Path] | None = None) -> list[tuple[int, int]]:
    ranges = []
    for path in paths:
        manifest_path = (overrides or {}).get(path.resolve(), path)
        with manifest_path.open(newline="") as stream:
            for row in csv.reader(stream, delimiter="\t"):
                flags = row[3] if len(row) >= 4 else ""
                source = root / row[2] if len(row) >= 3 else root
                source_path = (overrides or {}).get(source.resolve(), source)
                eligible = (source_path.is_file() and not ASM_ESCAPE.search(source_path.read_text())
                            and not has_specific_normalizer(flags))
                if row and row[0].startswith("0x") and len(row) >= 3 and row[2].endswith(".c") and eligible:
                    ranges.append((int(row[0], 0), int(row[0], 0) + int(row[1], 0)))
    return sorted(ranges)


def _catalogue(path: Path, minimum: int | None = None) -> list[dict]:
    document = tomllib.loads(path.read_text())
    return [f for f in document["section"][0].get("functions", [])
            if minimum is None or int(f["vram"]) >= minimum]


def _covered(start: int, size: int, ranges: list[tuple[int, int]]) -> bool:
    cursor, end = start, start + size
    for left, right in ranges:
        if right <= cursor or left >= end:
            continue
        if left > cursor:
            return False
        cursor = max(cursor, right)
        if cursor >= end:
            return True
    return False


def recompute_matched_functions(root: Path,
                                overrides: dict[Path, Path] | None = None) -> int:
    cfg = tomllib.loads((root / "config/us/progress.toml").read_text())
    p, image = cfg["progress"], cfg["image"]
    count = 0
    resident_ranges = _manifest_ranges([root / value for value in p["manifests"]], root, overrides)
    for f in _catalogue(root / p["resident_functions"], 0x8000047c):
        count += _covered(image["rom"] + int(f["vram"]) - image["vram"], int(f["size"]), resident_ranges)
    for overlay in p["overlay_manifests"]:
        ranges = _manifest_ranges([root / overlay["path"]], root, overrides)
        for f in _catalogue(root / overlay["functions"]):
            count += _covered(overlay["rom"] + int(f["vram"]) - overlay["vram"], int(f["size"]), ranges)
    loader_paths = p.get("loader_manifests")
    if loader_paths is None:
        loader_paths = [p["loader_manifest"]]
    ranges = _manifest_ranges([root / value for value in loader_paths], root, overrides)
    loader_map = (root / "config/us/loader_map.tsv").read_text().splitlines()[1:]
    for line in loader_map:
        fields = line.split("\t")
        if fields[4] == "code" and int(fields[5]):
            count += _covered(int(fields[0], 0), int(fields[3]), ranges)
    return count


def replace_progress_count(path: Path, count: int) -> None:
    text = path.read_text()
    updated, substitutions = re.subn(r"(?m)^matched_functions\s*=\s*\d+\s*$",
                                     f"matched_functions = {count}", text)
    if substitutions != 1:
        raise ValueError("progress.toml matched_functions field not unique")
    path.write_text(updated)


TRANSACTION_ROOT = ".tmp/desktop-integration-transaction"


def _fsync_file(path: Path) -> None:
    with path.open("rb") as stream:
        os.fsync(stream.fileno())


def _fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def recover_transaction(root: Path) -> bool:
    """Restore the pre-transaction tree after an interrupted integration."""
    transaction = root / TRANSACTION_ROOT
    journal = transaction / "journal.json"
    if not journal.is_file():
        return False
    document = json.loads(journal.read_text())
    if document.get("version") != 1:
        raise ValueError(f"unsupported integration journal: {journal}")
    for entry in document["files"]:
        destination = (root / entry["path"]).resolve()
        destination.relative_to(root.resolve())
        backup = transaction / "backup" / entry["slot"]
        if entry["existed"]:
            if not backup.is_file() or sha256(backup) != entry["backup_sha256"]:
                raise ValueError(f"integration backup damaged: {backup}")
            destination.parent.mkdir(parents=True, exist_ok=True)
            temporary = destination.with_name(f".{destination.name}.recover-{uuid.uuid4().hex}")
            shutil.copy2(backup, temporary)
            _fsync_file(temporary)
            os.replace(temporary, destination)
            _fsync_directory(destination.parent)
        elif destination.exists():
            destination.unlink()
            _fsync_directory(destination.parent)
    shutil.rmtree(transaction)
    _fsync_directory(transaction.parent)
    return True


def merge_manifest(existing: list[str], additions: list[str]) -> list[str]:
    """Replace exact/contained legacy rows and reject ambiguous overlaps."""
    headers = [line for line in existing if line.startswith("#")]
    body = [line for line in existing if line and not line.startswith("#")]
    for addition in additions:
        fields = addition.split("\t")
        new_start, new_end = int(fields[0], 0), int(fields[0], 0) + int(fields[1], 0)
        retained = []
        for line in body:
            old = line.split("\t")
            old_start, old_end = int(old[0], 0), int(old[0], 0) + int(old[1], 0)
            if old_end <= new_start or old_start >= new_end:
                retained.append(line); continue
            if new_start <= old_start and old_end <= new_end:
                continue  # retire an exact row or fragments subsumed by a recovered function
            raise ValueError(
                f"ambiguous manifest overlap 0x{new_start:X}-0x{new_end:X} with "
                f"0x{old_start:X}-0x{old_end:X}")
        body = retained
        body.append(addition)
    body.sort(key=lambda line: (int(line.split("\t", 1)[0], 0), line))
    for left, right in zip(body, body[1:]):
        lf, rf = left.split("\t"), right.split("\t")
        if int(rf[0], 0) < int(lf[0], 0) + int(lf[1], 0):
            raise ValueError(f"new manifest rows overlap at {rf[0]}")
    return headers + body


def apply_transaction(root: Path, verified: list[dict]) -> None:
    recover_transaction(root)
    touched = {item["destination"] for item in verified} | {item["manifest"] for item in verified}
    progress = root / "config/us/progress.toml"
    touched.add(progress)
    transaction = root / TRANSACTION_ROOT
    transaction.parent.mkdir(parents=True, exist_ok=True)
    try:
        transaction.mkdir()
    except FileExistsError as exc:
        raise RuntimeError(f"integration transaction already active: {transaction}") from exc
    backup, staged = transaction / "backup", transaction / "staged"
    backup.mkdir(); staged.mkdir()
    files: list[dict] = []
    ordered = sorted(touched)
    try:
        for index, path in enumerate(ordered):
            slot = f"{index:06d}"
            entry = {"path": path.relative_to(root).as_posix(), "slot": slot,
                     "existed": path.exists()}
            if path.exists():
                shutil.copy2(path, backup / slot)
                _fsync_file(backup / slot)
                entry["backup_sha256"] = sha256(backup / slot)
                shutil.copy2(path, staged / slot)
            files.append(entry)

        destination_items = {item["destination"]: item for item in verified}
        for index, path in enumerate(ordered):
            if path in destination_items:
                shutil.copy2(destination_items[path]["source"], staged / f"{index:06d}")
        by_manifest: dict[Path, list[str]] = {}
        for item in verified:
            by_manifest.setdefault(item["manifest"], []).append(item["manifest_row"].rstrip("\n"))
        for manifest, rows in by_manifest.items():
            index = ordered.index(manifest)
            stage = staged / f"{index:06d}"
            existing = stage.read_text().rstrip("\n").splitlines()
            stage.write_text("\n".join(merge_manifest(existing, rows)) + "\n")

        progress_slot = f"{ordered.index(progress):06d}"
        overrides = {(root / entry["path"]).resolve(): staged / entry["slot"] for entry in files}
        replace_progress_count(staged / progress_slot,
                               recompute_matched_functions(root, overrides))

        for staged_file in staged.iterdir():
            _fsync_file(staged_file)
        journal = {"version": 1, "state": "prepared", "files": files}
        (transaction / "journal.json").write_text(json.dumps(journal, indent=2, sort_keys=True) + "\n")
        _fsync_file(transaction / "journal.json")
        _fsync_directory(transaction)

        for entry in files:
            destination = root / entry["path"]
            destination.parent.mkdir(parents=True, exist_ok=True)
            temporary = destination.with_name(f".{destination.name}.integrate-{uuid.uuid4().hex}")
            shutil.copy2(staged / entry["slot"], temporary)
            _fsync_file(temporary)
            os.replace(temporary, destination)
            _fsync_directory(destination.parent)
        shutil.rmtree(transaction)
        _fsync_directory(transaction.parent)
    except Exception:
        if (transaction / "journal.json").is_file():
            recover_transaction(root)
        else:
            for entry in files:
                path = root / entry["path"]
                if entry["existed"] and (backup / entry["slot"]).is_file():
                    shutil.copy2(backup / entry["slot"], path)
                elif not entry["existed"] and path.exists():
                    path.unlink()
            shutil.rmtree(transaction, ignore_errors=True)
        raise


def dedupe_verified(items: list[dict]) -> tuple[list[dict], dict[str, list[str]]]:
    """Choose a canonical source only after every alternative independently matches."""
    grouped: dict[Path, list[dict]] = {}
    for item in items:
        grouped.setdefault(item["destination"], []).append(item)
    chosen, alternatives = [], {}
    for destination, candidates in sorted(grouped.items(), key=lambda item: str(item[0])):
        candidates.sort(key=lambda item: (len(item["source"].read_bytes()),
                                          sha256(item["source"]), str(item["source"])))
        chosen.append(candidates[0])
        alternatives[str(destination)] = [str(item["source"]) for item in candidates[1:]]
    return chosen, alternatives


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("artifact", type=Path)
    ap.add_argument("--root", type=Path, default=Path("."))
    ap.add_argument("--python", default=sys.executable)
    ap.add_argument("--pythonpath")
    ap.add_argument("--apply", action="store_true")
    args = ap.parse_args()
    root, artifact = args.root.resolve(), args.artifact.resolve()
    recovered = recover_transaction(root)
    rows = verify_artifact(artifact)
    all_verified = [verify_row(root, artifact, row, args.python, args.pythonpath)[0] for row in rows]
    verified, alternatives = dedupe_verified(all_verified)
    if args.apply:
        apply_transaction(root, verified)
    report = {"verified": len(all_verified), "selected": len(verified), "applied": args.apply,
              "recovered_interrupted_transaction": recovered,
              "destinations": [str(item["destination"].relative_to(root)) for item in verified],
              "verified_alternatives": alternatives,
              "artifact_sha256": sha256(artifact / "artifact-manifest.json")}
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
