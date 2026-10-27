#!/usr/bin/env python3
"""Losslessly extract every Madden Football 64 archive record.

The extractor verifies the supported ROM, removes physical alignment bytes,
expands every type-1 LZ payload with the audited game decoder, and writes a
hash manifest alongside the resulting record files.  Container parsing and
semantic asset reconstruction are deliberately separate follow-up stages.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def load_audit_module():
    path = ROOT / "tools/audit_rom_layout.py"
    spec = importlib.util.spec_from_file_location("audit_rom_layout", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


AUDIT = load_audit_module()

EXTENSIONS = {
    "audio_stream": ".audio.bin",
    "empty_record": ".empty.bin",
    "gameplay_table": ".gameplay.bin",
    "graphics_auxiliary": ".graphics.bin",
    "jpeg_image": ".jpg",
    "overlay_data": ".overlay-data.bin",
    "program_metadata": ".metadata.bin",
    "program_overlay": ".overlay.bin",
    "resident_program": ".resident.bin",
    "roster_database": ".roster.bin",
    "texture": ".texture.bin",
    "tmot_animation": ".tmot",
    "tnmf_model": ".tnmf",
    "tspr_sprite": ".tspr",
}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def expanded_payload(rom: bytes, record) -> tuple[bytes, bytes]:
    physical = rom[record.rom_start:record.rom_end]
    stored = physical[:record.logical_stored_size]
    if record.encoding == "lz-type-1":
        expanded = AUDIT.decode_lzta(stored)
    else:
        expanded = stored
    if len(expanded) != record.expanded_size:
        raise AUDIT.AuditError(
            f"archive {record.archive} record {record.index}: "
            f"decoded 0x{len(expanded):X}, expected 0x{record.expanded_size:X}"
        )
    return stored, expanded


def relative_record_path(record) -> Path:
    suffix = EXTENSIONS.get(record.kind, ".bin")
    return Path(f"archive_{record.archive:02d}") / f"record_{record.index:04d}{suffix}"


def extract_all(rom: bytes, main: bytes, output: Path) -> dict:
    records, archives = AUDIT.parse_records(rom, main)
    entries = []
    expanded_bytes = 0
    logical_stored_bytes = 0
    for record in records:
        stored, expanded = expanded_payload(rom, record)
        relative = relative_record_path(record)
        destination = output / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(expanded)
        logical_stored_bytes += len(stored)
        expanded_bytes += len(expanded)
        entries.append({
            "archive": record.archive,
            "index": record.index,
            "kind": record.kind,
            "encoding": record.encoding,
            "rom_start": record.rom_start,
            "rom_end": record.rom_end,
            "logical_stored_size": len(stored),
            "expanded_size": len(expanded),
            "stored_sha256": sha256(stored),
            "expanded_sha256": sha256(expanded),
            "path": relative.as_posix(),
        })
    manifest = {
        "format": "madden64-expanded-records/v1",
        "rom_sha256": AUDIT.ROM_SHA256,
        "archive_slots": len(archives),
        "records": len(entries),
        "logical_stored_bytes": logical_stored_bytes,
        "expanded_bytes": expanded_bytes,
        "entries": entries,
    }
    output.mkdir(parents=True, exist_ok=True)
    (output / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    return manifest


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("rom", type=Path)
    parser.add_argument("main", type=Path)
    parser.add_argument("--out", type=Path,
                        default=ROOT / "build/us/extracted_records")
    args = parser.parse_args()
    manifest = extract_all(AUDIT.load_rom(args.rom), args.main.read_bytes(), args.out)
    print(f"extracted {manifest['records']} records: "
          f"{manifest['expanded_bytes']} expanded bytes")
    print(f"manifest: {args.out / 'manifest.json'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
