#!/usr/bin/env python3
"""Safely extract an untrusted Desktop campaign artifact."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import tarfile
import tempfile
from pathlib import Path, PurePosixPath


def digest(path: Path) -> str:
    value = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            value.update(block)
    return value.hexdigest()


def safe_name(name: str) -> PurePosixPath:
    path = PurePosixPath(name)
    if path.is_absolute() or not path.parts or any(part in ("", ".", "..") for part in path.parts):
        raise ValueError(f"unsafe archive member: {name!r}")
    return path


def extract(archive_path: Path, destination: Path, maximum_bytes: int) -> dict:
    destination = destination.resolve()
    if destination.exists():
        raise ValueError(f"destination must not exist: {destination}")
    destination.parent.mkdir(parents=True, exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix=f".{destination.name}.extract-", dir=destination.parent))
    seen, total = set(), 0
    try:
        with tarfile.open(archive_path, "r:gz") as archive:
            members = archive.getmembers()
            for member in members:
                path = safe_name(member.name); canonical = path.as_posix()
                if member.name != canonical or canonical in seen:
                    raise ValueError(f"non-canonical or duplicate archive member: {member.name}")
                seen.add(canonical)
                if not member.isfile():
                    raise ValueError(f"non-regular archive member rejected: {member.name}")
                total += member.size
                if total > maximum_bytes:
                    raise ValueError(f"archive exceeds uncompressed limit {maximum_bytes}")
                target = staging.joinpath(*path.parts)
                target.parent.mkdir(parents=True, exist_ok=True)
                source = archive.extractfile(member)
                if source is None:
                    raise ValueError(f"unreadable archive member: {member.name}")
                with tempfile.NamedTemporaryFile(dir=target.parent, delete=False) as temporary:
                    temporary_path = Path(temporary.name)
                    while block := source.read(1 << 20):
                        temporary.write(block)
                    temporary.flush(); os.fsync(temporary.fileno())
                os.replace(temporary_path, target)
        manifest_path = staging / "artifact-manifest.json"
        if not manifest_path.is_file():
            raise ValueError("artifact-manifest.json missing")
        manifest = json.loads(manifest_path.read_text())
        if manifest.get("version") != 1 or not isinstance(manifest.get("files"), dict):
            raise ValueError("unsupported artifact manifest")
        declared = {"artifact-manifest.json", *manifest["files"]}
        if any(safe_name(name).as_posix() != name for name in declared) or seen != declared:
            raise ValueError(f"archive membership differs from manifest: extra={sorted(seen-declared)}, missing={sorted(declared-seen)}")
        for relative, expected in manifest["files"].items():
            path = staging.joinpath(*PurePosixPath(relative).parts)
            if not path.is_file() or digest(path) != expected:
                raise ValueError(f"artifact checksum mismatch: {relative}")
        os.replace(staging, destination)
    except Exception:
        shutil.rmtree(staging, ignore_errors=True)
        raise
    return {"files": len(manifest["files"]), "uncompressed_bytes": total,
            "archive_sha256": digest(archive_path), "destination": str(destination)}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("archive", type=Path)
    parser.add_argument("destination", type=Path)
    parser.add_argument("--maximum-bytes", type=int, default=2 << 30)
    args = parser.parse_args()
    print(json.dumps(extract(args.archive.resolve(), args.destination,
                             args.maximum_bytes), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
