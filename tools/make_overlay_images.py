#!/usr/bin/env python3
"""Build analysis ROM images for the extracted executable overlays."""

import struct
import tomllib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RESIDENT_VRAM = 0x80000400


def build_composite_image(overlay: int, payload: bytes, link_vram: int) -> None:
    """Build one linear image containing resident code/data and an overlay.

    Overlay functions can own jump tables and literal pools in resident
    ``.rodata``.  A payload-only image cannot verify those sections because its
    ROM-to-VRAM mapping starts at the overlay.  The composite keeps the
    resident image at 0x80000400 and inserts the overlay at its linked address,
    giving the matcher one linear mapping for both sections.
    """
    resident = (ROOT / "build/us/survey/main_segment.bin").read_bytes()
    overlay_offset = 0x1000 + link_vram - RESIDENT_VRAM
    image = bytearray(max(
        0x101000,
        0x1000 + len(resident),
        overlay_offset + len(payload),
    ))
    struct.pack_into(">IIII", image, 0, 0x80371240, 0, RESIDENT_VRAM, 0)
    image[0x20:0x34] = b"MADDEN COMPOSITE    "
    image[0x3B:0x3F] = b"N8ME"
    image[0x1000:0x1000 + len(resident)] = resident
    image[overlay_offset:overlay_offset + len(payload)] = payload
    (ROOT / f"build/us/audit/overlay_{overlay}_composite.z64").write_bytes(image)

    # Canonical overlay manifests use payload-relative ROM offsets beginning at
    # 0x1000. Rebase only generated verifier copies to the overlay's location
    # in this image; progress accounting keeps using the canonical manifests.
    delta = overlay_offset - 0x1000
    for kind in ("kmc", "asm"):
        source = ROOT / f"config/us/matching_overlay{overlay}_{kind}_units.tsv"
        if not source.exists():
            continue
        lines = []
        for line in source.read_text().splitlines():
            if not line or line.startswith("#"):
                lines.append(line)
                continue
            fields = line.split("\t")
            fields[0] = f"0x{int(fields[0], 0) + delta:X}"
            lines.append("\t".join(fields))
        output = ROOT / f"build/us/matching_overlay{overlay}_{kind}_composite.tsv"
        output.write_text("\n".join(lines) + "\n")


def build_image(overlay: int, record: int, *, suffix: str = "overlay",
                link_vram: int | None = None) -> None:
    payload = (
        ROOT
        / f"build/us/extracted_records/archive_00/record_{record:04d}.{suffix}.bin"
    ).read_bytes()
    catalogue = ROOT / f"config/us/functions_overlay{overlay}.toml"
    catalogue_vram = (
        tomllib.loads(catalogue.read_text())["section"][0]["vram"]
        if catalogue.exists()
        else link_vram
    )
    if catalogue_vram is None:
        raise ValueError(f"overlay {overlay} needs a catalogue or link_vram")
    image = bytearray(max(0x101000, 0x1000 + len(payload)))
    struct.pack_into(">IIII", image, 0, 0x80371240, 0, catalogue_vram, 0)
    image[0x20:0x34] = b"MADDEN OVERLAY      "
    image[0x3B:0x3F] = b"N8ME"
    image[0x1000 : 0x1000 + len(payload)] = payload
    (ROOT / f"build/us/audit/overlay_{overlay}.z64").write_bytes(image)

    if link_vram is not None and link_vram != catalogue_vram:
        # Overlay 1 is linked immediately after resident BSS. Its catalogue
        # symbols retain the historical +0x4724 names, so matching needs a
        # separate image whose entry point records the real link address.
        struct.pack_into(">I", image, 8, link_vram)
        (ROOT / f"build/us/audit/overlay_{overlay}_link.z64").write_bytes(image)

    build_composite_image(overlay, payload, link_vram or catalogue_vram)


def main() -> None:
    build_image(1, 1, link_vram=0x8008B8E0)
    build_image(2, 2, suffix="overlay-data", link_vram=0x8008B8E0)
    build_image(4, 4, link_vram=0x800C5F48)
    build_image(5, 5, suffix="overlay-data", link_vram=0x800C5F48)


if __name__ == "__main__":
    main()
