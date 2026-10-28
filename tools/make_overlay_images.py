#!/usr/bin/env python3
"""Build analysis ROM images for the extracted executable overlays."""

import struct
import tomllib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def build_image(overlay: int, record: int) -> None:
    payload = (
        ROOT
        / f"build/us/extracted_records/archive_00/record_{record:04d}.overlay.bin"
    ).read_bytes()
    catalogue_vram = tomllib.loads(
        (ROOT / f"config/us/functions_overlay{overlay}.toml").read_text()
    )["section"][0]["vram"]
    image = bytearray(max(0x101000, 0x1000 + len(payload)))
    struct.pack_into(">IIII", image, 0, 0x80371240, 0, catalogue_vram, 0)
    image[0x20:0x34] = b"MADDEN OVERLAY      "
    image[0x3B:0x3F] = b"N8ME"
    image[0x1000 : 0x1000 + len(payload)] = payload
    (ROOT / f"build/us/audit/overlay_{overlay}.z64").write_bytes(image)

    if overlay == 1:
        # Overlay 1 is linked immediately after resident BSS. Its catalogue
        # symbols retain the historical +0x4724 names, so matching needs a
        # separate image whose entry point records the real link address.
        struct.pack_into(">I", image, 8, 0x8008B8E0)
        (ROOT / "build/us/audit/overlay_1_link.z64").write_bytes(image)


def main() -> None:
    build_image(1, 1)
    build_image(4, 4)


if __name__ == "__main__":
    main()
