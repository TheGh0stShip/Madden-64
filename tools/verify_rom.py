#!/usr/bin/env python3
import argparse
import hashlib
import struct
from pathlib import Path

SIZE = 12 * 1024 * 1024
SHA1 = "b0de34b759f18ad86d39a4c68c9840d35ce25809"
SHA256 = "39f25dad3af4782a909bf58d7127acae700ea7c6f17c48d39ab76fe331735d6f"


def main() -> int:
    parser = argparse.ArgumentParser(description="Verify the supported Madden Football 64 ROM")
    parser.add_argument("rom", type=Path)
    args = parser.parse_args()
    data = args.rom.read_bytes()
    errors = []
    if len(data) != SIZE:
        errors.append(f"size {len(data)} != {SIZE}")
    if data[:4] != bytes.fromhex("80371240"):
        errors.append("ROM is not big-endian .z64 byte order")
    if data[0x20:0x34].rstrip(b" \\0") != b"MADDEN 64":
        errors.append("internal title is not MADDEN 64")
    if data[0x3B:0x3F] != b"N8ME" or data[0x3F] != 0:
        errors.append("game code/revision is not N8ME Rev 0")
    if hashlib.sha1(data).hexdigest() != SHA1:
        errors.append("SHA-1 mismatch")
    if hashlib.sha256(data).hexdigest() != SHA256:
        errors.append("SHA-256 mismatch")
    if errors:
        parser.error("; ".join(errors))
    crc1, crc2 = struct.unpack_from(">II", data, 0x10)
    print(f"verified Madden Football 64 (USA Rev 0): {len(data)} bytes, CRC {crc1:08X}/{crc2:08X}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
