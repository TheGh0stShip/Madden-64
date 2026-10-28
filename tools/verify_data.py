#!/usr/bin/env python3
"""Byte-verify the initialized-data compilation units in config/us/matching_data_units.tsv.

Each row names a typed C source that defines one contiguous data region, the section it compiles
to (.data or .rodata), the image that holds the retail bytes, the region's VRAM and size, and the
SHA-256 of the retail bytes. The source is compiled with the project's KMC GCC 2.7.2 pipeline
(n64dk.match.pipeline.build); the section is placed at the row's VRAM, its relocations are applied
with the project symbol maps, and the result must equal the retail bytes exactly. The only bytes
allowed past the region are GCC's zero section padding (under 16 bytes). Every other section
must be empty.

Images:
  resident   build/us/survey/main_segment.bin            at 0x80000400
  overlay_1  build/us/extracted_records/archive_00/record_0001.overlay.bin       linked at 0x8008B8E0
  overlay_2  build/us/extracted_records/archive_00/record_0002.overlay-data.bin  linked at 0x8008B8E0
  overlay_5  build/us/extracted_records/archive_00/record_0005.overlay-data.bin  linked at 0x800C5F48
  metadata   build/us/extracted_records/archive_00/record_0003.metadata.bin      offsets
  loader     the retail ROM, ROM 0x1000 = VRAM 0x80200400

Usage: verify_data.py [--n64dk PATH] [MANIFEST]   (prints one MATCH/DIFF line per unit; exit 1 on any DIFF)
"""
from __future__ import annotations

import argparse
import hashlib
import shlex
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
RECORDS = ROOT / "build/us/extracted_records/archive_00"
IMAGES = {
    "resident": (ROOT / "build/us/survey/main_segment.bin", 0x80000400),
    "overlay_1": (RECORDS / "record_0001.overlay.bin", 0x8008B8E0),
    "overlay_2": (RECORDS / "record_0002.overlay-data.bin", 0x8008B8E0),
    "overlay_5": (RECORDS / "record_0005.overlay-data.bin", 0x800C5F48),
    "metadata": (RECORDS / "record_0003.metadata.bin", 0),
    "loader": (ROOT / "Madden Football 64 (USA).z64", 0x80200400 - 0x1000),
}
FLAGS = "-O2 -G0 -mips3 -mgp32 -mfp32 -Wa,-r4300_mul -Iinclude"


def read_manifest(path: Path) -> list[dict[str, str]]:
    rows = []
    for number, line in enumerate(path.read_text().splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) != 7:
            raise ValueError(f"{path}:{number}: expected 7 fields")
        module, source, section, vram, size, sha, credited = fields
        rows.append({"module": module, "source": source, "section": section, "vram": vram,
                     "size": size, "sha256": sha, "credited": credited})
    return rows


def verify(row: dict[str, str], n64dk_root: Path) -> tuple[bool, str]:
    sys.path.insert(0, str(n64dk_root))
    from n64dk.elf import Elf
    from n64dk.match import symbols as symmod
    from n64dk.match.pipeline import build, split_flags
    from n64dk.match.toolchain import load_config

    vram, size = int(row["vram"], 0), int(row["size"], 0)
    path, base = IMAGES[row["module"]]
    want = path.read_bytes()[vram - base: vram - base + size]
    if hashlib.sha256(want).hexdigest() != row["sha256"]:
        return False, "retail bytes do not have the manifest SHA-256"
    work = ROOT / "build/us/data_units"
    work.mkdir(parents=True, exist_ok=True)
    obj = build(ROOT / row["source"], split_flags(shlex.split(FLAGS), "kmc+builtin"), load_config(ROOT), work)
    elf = Elf.load(obj)
    for name in (".text", ".data", ".rodata", ".sdata"):
        sec = elf.section(name)
        if name != row["section"] and sec is not None and sec.size:
            return False, f"unexpected non-empty {name}"
    syms = symmod.load([ROOT / "build/us/survey/symbol_addrs.txt", ROOT / "config/us/functions_resident.toml"])
    data = elf.relocate(row["section"], {row["section"]: vram}, syms)
    pad = data[size:]
    got = data[:size]
    if got == want and not any(pad) and len(pad) < 16:
        return True, f"0x{vram:08X}+0x{size:X}"
    first = next((i for i in range(min(len(got), size)) if got[i] != want[i]), min(len(got), size))
    return False, f"compiled 0x{len(data):X} bytes; first difference at +0x{first:X}"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("manifest", nargs="?", default=str(ROOT / "config/us/matching_data_units.tsv"))
    parser.add_argument("--n64dk", default="/home/steve/projects/n64-decomp-kit")
    args = parser.parse_args()
    ok_all = True
    total = credited = 0
    for row in read_manifest(Path(args.manifest)):
        ok, detail = verify(row, Path(args.n64dk))
        ok_all &= ok
        if ok:
            total += int(row["size"], 0)
            credited += int(row["credited"], 0)
        print(f"{'MATCH' if ok else 'DIFF '} {row['source']}: {detail}")
    print(f"Verified data regions: {total} bytes; credited typed objects: {credited} bytes")
    return 0 if ok_all else 1


if __name__ == "__main__":
    raise SystemExit(main())
