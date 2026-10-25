#!/usr/bin/env python3
"""Build the whole-program catalogue used by upstream research sweeps."""

from __future__ import annotations

import csv
import hashlib
import json
import struct
import tomllib
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "build/research/function_catalog.json"

MODULES = (
    {
        "id": "resident",
        "functions": "config/us/functions_resident.toml",
        "image": "build/us/main_unpacked.z64",
        "vram": 0x80000400,
        "rom": 0x1000,
        "minimum_vram": 0x8000047C,
        "manifests": (
            "config/us/matching_ido_sources.tsv",
            "config/us/matching_kmc_units.tsv",
            "config/us/matching_asm_units.tsv",
        ),
    },
    {
        "id": "overlay_1",
        "functions": "config/us/functions_overlay1.toml",
        "image": "build/us/audit/overlay_1.z64",
        "vram": 0x80090004,
        "rom": 0x1000,
        "minimum_vram": None,
        "manifests": (
            "config/us/matching_overlay1_kmc_units.tsv",
            "config/us/matching_overlay1_asm_units.tsv",
        ),
    },
    {
        "id": "overlay_4",
        "functions": "config/us/functions_overlay4.toml",
        "image": "build/us/audit/overlay_4.z64",
        "vram": 0x800C77E8,
        "rom": 0x1000,
        "minimum_vram": None,
        "manifests": (
            "config/us/matching_overlay4_kmc_units.tsv",
            "config/us/matching_overlay4_asm_units.tsv",
        ),
    },
)

COMMON_IMMEDIATES = {
    0, 1, 2, 3, 4, 8, 0x10, 0x18, 0x20, 0x28, 0x30, 0x38, 0x40,
    0xFF, 0xFFFF, 0x8000,
}


def manifest_ranges(paths: tuple[str, ...]) -> list[tuple[int, int, str]]:
    ranges = []
    for relpath in paths:
        path = ROOT / relpath
        with path.open(newline="") as stream:
            for row in csv.reader(stream, delimiter="\t"):
                if not row or not row[0].startswith("0x"):
                    continue
                start, size = int(row[0], 0), int(row[1], 0)
                ranges.append((start, start + size, row[2]))
    return sorted(ranges)


def is_covered(start: int, size: int,
               ranges: list[tuple[int, int, str]]) -> tuple[bool, str | None]:
    end = start + size
    cursor = start
    source = None
    for left, right, candidate in ranges:
        if right <= cursor or left >= end:
            continue
        if left > cursor:
            return False, None
        cursor = max(cursor, right)
        source = candidate if source in (None, candidate) else "multiple"
        if cursor >= end:
            return True, source
    return False, None


def opcode_name(word: int) -> str:
    op = word >> 26
    if op == 0:
        return {
            0x00: "sll", 0x02: "srl", 0x03: "sra", 0x08: "jr",
            0x09: "jalr", 0x10: "mfhi", 0x12: "mflo", 0x18: "mult",
            0x19: "multu", 0x1A: "div", 0x1B: "divu", 0x20: "add",
            0x21: "addu", 0x22: "sub", 0x23: "subu", 0x24: "and",
            0x25: "or", 0x26: "xor", 0x27: "nor", 0x2A: "slt",
            0x2B: "sltu",
        }.get(word & 0x3F, "special")
    return {
        0x01: "regimm", 0x02: "j", 0x03: "jal", 0x04: "beq",
        0x05: "bne", 0x06: "blez", 0x07: "bgtz", 0x08: "addi",
        0x09: "addiu", 0x0A: "slti", 0x0B: "sltiu", 0x0C: "andi",
        0x0D: "ori", 0x0E: "xori", 0x0F: "lui", 0x10: "cop0",
        0x11: "cop1", 0x14: "beql", 0x15: "bnel", 0x20: "lb",
        0x21: "lh", 0x22: "lwl", 0x23: "lw", 0x24: "lbu",
        0x25: "lhu", 0x26: "lwr", 0x28: "sb", 0x29: "sh",
        0x2A: "swl", 0x2B: "sw", 0x2E: "swr", 0x31: "lwc1",
        0x39: "swc1",
    }.get(op, f"op{op:02x}")


def normalize_word(word: int) -> int:
    op = word >> 26
    if op in (2, 3):
        return word & 0xFC000000
    if op == 0:
        return word & 0xFC00003F
    return word & 0xFC000000


def signatures(blob: bytes) -> dict[str, object]:
    words = struct.unpack(f">{len(blob) // 4}I", blob)
    opcodes = [opcode_name(word) for word in words]
    normalized = b"".join(struct.pack(">I", normalize_word(word))
                          for word in words)
    immediates = Counter(word & 0xFFFF for word in words
                         if (word >> 26) not in (0, 2, 3))
    rare = [value for value, count in immediates.most_common()
            if value not in COMMON_IMMEDIATES and count <= 3][:8]
    calls = sum(1 for word in words if word >> 26 == 3)
    branches = sum(1 for word in words
                   if word >> 26 in (1, 4, 5, 6, 7, 0x14, 0x15))
    return {
        "sha256": hashlib.sha256(blob).hexdigest(),
        "normalized_sha256": hashlib.sha256(normalized).hexdigest(),
        "word_prefix": [f"0x{word:08X}" for word in words[:8]],
        "opcode_prefix": opcodes[:12],
        "opcode_histogram": dict(sorted(Counter(opcodes).items())),
        "rare_immediates": [f"0x{value:X}" for value in rare],
        "calls": calls,
        "branches": branches,
    }


def catalogue_module(spec: dict[str, object]) -> list[dict[str, object]]:
    image = (ROOT / str(spec["image"])).read_bytes()
    document = tomllib.loads((ROOT / str(spec["functions"])).read_text())
    ranges = manifest_ranges(spec["manifests"])
    functions = []
    for section in document["section"]:
        for function in section.get("functions", ()):
            vram, size = int(function["vram"]), int(function["size"])
            if spec["minimum_vram"] is not None and vram < int(spec["minimum_vram"]):
                continue
            image_offset = int(spec["rom"]) + vram - int(spec["vram"])
            matched, source = is_covered(image_offset, size, ranges)
            blob = image[image_offset:image_offset + size]
            if len(blob) != size or size % 4:
                raise ValueError(f"invalid body for {function['name']}")
            entry = {
                "module": spec["id"],
                "name": function["name"],
                "vram": f"0x{vram:08X}",
                "image_offset": f"0x{image_offset:X}",
                "size": size,
                "matched": matched,
                "matching_source": source,
            }
            entry.update(signatures(blob))
            if not matched:
                constants = " ".join(entry["rare_immediates"][:3])
                opcodes = " ".join(entry["opcode_prefix"][:8])
                entry["research_queries"] = [
                    f'"{entry["normalized_sha256"][:16]}" MIPS',
                    f'"{constants}" N64 decomp' if constants else
                    f'"{size} bytes" N64 decomp function',
                    f'"{opcodes}" KMC GCC MIPS decomp',
                ]
            functions.append(entry)
    return functions


def loader_catalogue() -> list[dict[str, object]]:
    image = (ROOT / "Madden Football 64 (USA).z64").read_bytes()
    ranges = manifest_ranges(("config/us/matching_loader_asm_units.tsv",))
    functions = []
    rows = (ROOT / "config/us/loader_map.tsv").read_text().splitlines()[1:]
    for line in rows:
        fields = line.split("\t")
        if fields[4] != "code" or not int(fields[5]):
            continue
        start, vram, size = int(fields[0], 0), int(fields[2], 0), int(fields[3])
        matched, source = is_covered(start, size, ranges)
        entry = {
            "module": "boot_loader", "name": fields[6],
            "vram": f"0x{vram:08X}", "image_offset": f"0x{start:X}",
            "size": size, "matched": matched, "matching_source": source,
        }
        entry.update(signatures(image[start:start + size]))
        if not matched:
            constants = " ".join(entry["rare_immediates"][:3])
            opcodes = " ".join(entry["opcode_prefix"][:8])
            entry["research_queries"] = [
                f'"{entry["normalized_sha256"][:16]}" MIPS',
                f'"{constants}" N64 boot loader' if constants else
                f'"{size} bytes" N64 boot loader',
                f'"{opcodes}" MIPS N64 loader',
            ]
        functions.append(entry)
    return functions


def main() -> None:
    functions = loader_catalogue()
    for module in MODULES:
        functions.extend(catalogue_module(module))
    pending = [function for function in functions if not function["matched"]]
    by_module = Counter(function["module"] for function in pending)
    result = {
        "schema": 1,
        "functions": len(functions),
        "matched_functions": len(functions) - len(pending),
        "pending_functions": len(pending),
        "pending_by_module": dict(sorted(by_module.items())),
        "research_rounds_required": len(pending) * 3,
        "entries": functions,
    }
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(result, indent=2) + "\n")
    print(f"wrote {OUT.relative_to(ROOT)}: {len(pending)} pending functions, "
          f"{len(pending) * 3} research rounds")


if __name__ == "__main__":
    main()
