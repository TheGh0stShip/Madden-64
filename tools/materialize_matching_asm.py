#!/usr/bin/env python3
"""Materialize readable assembly units from audited resident code ranges."""

from __future__ import annotations

import argparse
import struct
from pathlib import Path

from n64dk.mips import disassemble


ROOT = Path(__file__).resolve().parent.parent
ROM = ROOT / "build/us/main_unpacked.z64"
BASE_VRAM = 0x80000400
BASE_ROM = 0x1000


def branch_target(address: int, word: int) -> int | None:
    opcode = word >> 26
    if opcode in {1, 4, 5, 6, 7, 0x14, 0x15, 0x16, 0x17}:
        displacement = word & 0xFFFF
        if displacement & 0x8000:
            displacement -= 0x10000
        return address + 4 + displacement * 4
    if opcode == 0x11 and ((word >> 21) & 0x1F) == 8:
        displacement = word & 0xFFFF
        if displacement & 0x8000:
            displacement -= 0x10000
        return address + 4 + displacement * 4
    if opcode == 2:
        return ((address + 4) & 0xF0000000) | ((word & 0x03FFFFFF) << 2)
    return None


def source_for(name: str, start: int, size: int, image: bytes) -> str:
    offset = BASE_ROM + start - BASE_VRAM
    body = image[offset:offset + size]
    if len(body) != size or size % 4:
        raise ValueError(f"invalid range for {name}")

    decoded = list(disassemble(body, start))
    words = struct.unpack(f">{size // 4}I", body)
    targets = {
        target
        for index, word in enumerate(words)
        if (target := branch_target(start + index * 4, word)) is not None
        and start <= target < start + size
    }

    lines = [
        ".text", ".align 2", ".set noreorder", f".globl {name}",
        f".ent {name}", f"{name}:",
    ]
    for index, rendered in enumerate(decoded):
        address = start + index * 4
        word = words[index]
        if address in targets:
            lines.append(f".L{address:08X}:")
        instruction = rendered.split(maxsplit=2)[2]
        decoded_instruction = instruction
        target = branch_target(address, word)
        if target is not None and start <= target < start + size:
            label = f".L{target:08X}"
            if ". +" in instruction:
                instruction = instruction[:instruction.index(". +")] + label
            elif (word >> 26) == 2:
                instruction = instruction.split(maxsplit=1)[0] + " " + label
        special_hazard = (
            (word >> 26) == 0
            and (word & 0x3F) in {0x10, 0x12, 0x18, 0x19, 0x1A, 0x1B}
        )
        if (word >> 26) == 0x11 or special_hazard:
            instruction = f".word       0x{word:08X}  # {decoded_instruction}"
        lines.append(f"    {instruction}")
    lines.extend((f".end {name}", ""))
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("units", nargs="+", metavar="NAME:VRAM:SIZE")
    args = parser.parse_args()
    image = ROM.read_bytes()
    for spec in args.units:
        name, start_text, size_text = spec.split(":")
        start, size = int(start_text, 0), int(size_text, 0)
        destination = ROOT / "src/code" / f"{name}.s"
        destination.write_text(source_for(name, start, size, image))
        print(destination.relative_to(ROOT))


if __name__ == "__main__":
    main()
