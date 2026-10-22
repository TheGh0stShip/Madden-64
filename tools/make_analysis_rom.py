#!/usr/bin/env python3
"""Wrap the unpacked main segment as an N64 image for address-aware tooling.

This is an analysis fixture, never a replacement for the retail ROM.  Madden's
retail executable is packed, while several generic matching tools expect code
to live at a linear ROM-to-VRAM offset.
"""
import argparse
import struct
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("segment", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    segment = args.segment.read_bytes()
    # Rom readers validate the N64 checksum span through ROM 0x101000.
    image = bytearray(max(0x101000, 0x1000 + len(segment)))
    struct.pack_into(">IIII", image, 0, 0x80371240, 0, 0x80000400, 0)
    image[0x20:0x34] = b"MADDEN ANALYSIS     "
    image[0x3B:0x3F] = b"N8ME"
    image[0x1000:0x1000 + len(segment)] = segment
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(image)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
