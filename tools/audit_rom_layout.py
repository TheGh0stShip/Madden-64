#!/usr/bin/env python3
"""Audit Madden Football 64's complete cartridge archive layout.

The resident program starts with sixteen cartridge addresses.  Adjacent
addresses delimit fifteen archive slots; one slot is deliberately empty.
Every non-empty archive begins with a packed array of 12-byte records:

    u32 payload_offset;
    u32 expanded_size;
    u32 stored_size_and_flags;

The first payload offset is therefore also the table size.  Payloads are
two-byte aligned.  A payload beginning with codec byte 1 uses the boot
loader's LZ copy format and is decoded here for signature classification.
ROM-derived bytes are never written by this tool.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ROM_SHA256 = "39f25dad3af4782a909bf58d7127acae700ea7c6f17c48d39ab76fe331735d6f"
ROM_SIZE = 0xC00000
CART_BASE = 0xB0000000
ARCHIVE_POINTERS = 16
LOADER_MAP = ROOT / "config/us/loader_map.tsv"


class AuditError(ValueError):
    pass


@dataclass(frozen=True)
class Record:
    archive: int
    index: int
    rom_start: int
    rom_end: int
    stored_size: int
    logical_stored_size: int
    alignment_bytes: int
    expanded_size: int
    flagged: bool
    encoding: str
    kind: str


def be32(data: bytes, offset: int) -> int:
    if offset < 0 or offset + 4 > len(data):
        raise AuditError(f"word at 0x{offset:X} is outside the image")
    return struct.unpack_from(">I", data, offset)[0]


def load_rom(path: Path) -> bytes:
    data = path.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if len(data) != ROM_SIZE or digest != ROM_SHA256:
        raise AuditError(f"unsupported ROM: size 0x{len(data):X}, SHA-256 {digest}")
    return data


def archive_bounds(main: bytes) -> list[int]:
    bounds = [be32(main, index * 4) - CART_BASE for index in range(ARCHIVE_POINTERS)]
    if bounds != sorted(bounds):
        raise AuditError("archive boundary table is not ascending")
    if bounds[0] != 0x12D0 or bounds[-1] != 0xBFE9D6:
        raise AuditError("unexpected archive boundary table")
    return bounds


def loader_inventory(rom: bytes, bounds: list[int]) -> dict:
    """Validate and total the hand-audited loader instruction/data map."""
    rows = []
    for number, line in enumerate(LOADER_MAP.read_text().splitlines()[1:], 2):
        if not line:
            continue
        fields = line.split("\t")
        if len(fields) != 7:
            raise AuditError(f"{LOADER_MAP}:{number}: malformed row")
        start, end, vram, size = (int(field, 0) for field in fields[:4])
        kind, candidate_text, name = fields[4:]
        if candidate_text not in ("0", "1"):
            raise AuditError(f"{LOADER_MAP}:{number}: invalid function flag")
        if start < 0x1000 or end > bounds[0] or end - start != size:
            raise AuditError(f"{LOADER_MAP}:{number}: invalid loader extent")
        if vram != 0x80200400 + start - 0x1000:
            raise AuditError(f"{LOADER_MAP}:{number}: invalid VRAM mapping")
        rows.append({"start": start, "end": end, "vram": vram,
                     "size": size, "kind": kind,
                     "function_candidate": candidate_text == "1", "name": name})
    rows.sort(key=lambda row: row["start"])
    cursor = 0x1000
    for row in rows:
        if row["start"] != cursor:
            raise AuditError(f"loader map gap or overlap at 0x{cursor:X}")
        cursor = row["end"]
    if cursor != bounds[0]:
        raise AuditError("loader map does not cover the complete loader")
    table = rows[-1]
    if table["name"] != "archive_boundary_table":
        raise AuditError("loader map does not end with the archive boundary table")
    table_values = [be32(rom, table["start"] + 4 * index) - CART_BASE
                    for index in range(ARCHIVE_POINTERS)]
    if table_values != bounds:
        raise AuditError("loader archive boundary table does not match resident copy")
    return {
        "rows": rows,
        "code_bytes": sum(row["size"] for row in rows if row["kind"] == "code"),
        "initialized_data_bytes": sum(
            row["size"] for row in rows if row["kind"] == "initialized_data"
        ),
        "function_candidates": sum(row["function_candidate"] for row in rows),
    }


def decode_lzta(data: bytes) -> bytes:
    """Decode the type-1 LZ stream implemented at boot address 0x802004DC."""
    if len(data) < 6 or data[0] != 1:
        raise AuditError("not a type-1 LZ stream")
    source = 5
    output = bytearray()
    while True:
        if source >= len(data):
            raise AuditError("unterminated LZ stream")
        control = data[source]
        source += 1
        if control == 0:
            return bytes(output)
        if control & 0x80:
            count = control & 0x7F
            end = source + count
            if end > len(data):
                raise AuditError("literal extends past stored payload")
            output.extend(data[source:end])
            source = end
        else:
            if source + 2 > len(data):
                raise AuditError("copy token extends past stored payload")
            distance = data[source] | data[source + 1] << 8
            source += 2
            if distance == 0 or distance > len(output):
                raise AuditError("invalid LZ copy distance")
            for _ in range(control):
                output.append(output[-distance])


def classify(data: bytes, archive: int, index: int) -> tuple[str, str]:
    decoded = data
    encoding = "raw"
    if data[:1] == b"\x01":
        decoded = decode_lzta(data)
        encoding = "lz-type-1"
    if archive == 0 and index == 0:
        return encoding, "resident_program"
    if archive == 0 and index in (1, 4):
        return encoding, "program_overlay"
    if decoded.startswith(b"\xFF\xD8\xFF"):
        return encoding, "jpeg_image"
    if decoded.startswith(b"TNMF"):
        return encoding, "tnmf_model"
    if decoded.startswith(b"TMot"):
        return encoding, "tmot_animation"
    if decoded.startswith(b"TSpr"):
        return encoding, "tspr_sprite"
    if len(decoded) >= 8 and decoded[:6] == b"\x00\x08\x00\x01\x00\x01":
        return encoding, "texture"
    if archive == 7:
        return encoding, "audio_stream"
    if archive == 0 and index in (2, 5):
        return encoding, "overlay_data"
    if archive == 0 and index == 3:
        return encoding, "program_metadata"
    if (archive, index) in ((8, 0), (14, 26)):
        return encoding, "empty_record"
    if archive in (1, 3, 4, 8, 9):
        return encoding, "graphics_auxiliary"
    if archive == 5:
        return encoding, "gameplay_table"
    if archive == 13:
        return encoding, "roster_database"
    return encoding, "binary_record"


def parse_records(rom: bytes, main: bytes) -> tuple[list[Record], list[dict]]:
    bounds = archive_bounds(main)
    records: list[Record] = []
    archives = []
    for archive, (start, end) in enumerate(zip(bounds, bounds[1:])):
        if start == end:
            archives.append({"index": archive, "start": start, "end": end,
                             "table_size": 0, "records": 0})
            continue
        table_size = be32(rom, start)
        if table_size == 0 or table_size % 12:
            raise AuditError(f"archive {archive}: invalid table size 0x{table_size:X}")
        count = table_size // 12
        if start + table_size > end:
            raise AuditError(f"archive {archive}: table exceeds archive")
        offsets = [be32(rom, start + 12 * index) for index in range(count)]
        if offsets[0] != table_size or offsets != sorted(offsets):
            raise AuditError(f"archive {archive}: invalid payload offsets")
        for index, offset in enumerate(offsets):
            expanded = be32(rom, start + 12 * index + 4)
            flags = be32(rom, start + 12 * index + 8)
            next_offset = offsets[index + 1] if index + 1 < count else end - start
            if next_offset < offset or start + next_offset > end:
                raise AuditError(f"archive {archive} record {index}: invalid extent")
            payload = rom[start + offset:start + next_offset]
            logical_size = (flags & 0x7FFFFFFF) if flags & 0x80000000 else expanded
            padding = len(payload) - logical_size
            if (logical_size > len(payload) or padding > 1) and not (
                logical_size == 0 and len(payload) == 2 and payload == b"\0\0"
            ):
                raise AuditError(
                    f"archive {archive} record {index}: invalid logical stored size"
                )
            encoding, kind = classify(payload, archive, index)
            if encoding == "lz-type-1" and len(decode_lzta(payload)) != expanded:
                raise AuditError(f"archive {archive} record {index}: expanded-size mismatch")
            records.append(Record(archive, index, start + offset, start + next_offset,
                                  len(payload), logical_size, padding,
                                  expanded, bool(flags & 0x80000000),
                                  encoding, kind))
        archives.append({"index": archive, "start": start, "end": end,
                         "table_size": table_size, "records": count})
    return records, archives


def build_audit(rom: bytes, main: bytes) -> dict:
    records, archives = parse_records(rom, main)
    kinds = Counter(record.kind for record in records)
    stored = Counter()
    logical_stored = Counter()
    expanded = Counter()
    for record in records:
        stored[record.kind] += record.stored_size
        logical_stored[record.kind] += record.logical_stored_size
        expanded[record.kind] += record.expanded_size
    bounds = archive_bounds(main)
    loader = loader_inventory(rom, bounds)
    archive_bytes = bounds[-1] - bounds[0]
    table_bytes = sum(item["table_size"] for item in archives)
    payload_bytes = sum(record.stored_size for record in records)
    logical_payload_bytes = sum(record.logical_stored_size for record in records)
    alignment_bytes = sum(record.alignment_bytes for record in records)
    if table_bytes + payload_bytes != archive_bytes:
        raise AuditError("archive tables and payload extents do not cover the archive region")
    return {
        "rom_size": len(rom),
        "regions": [
            {"start": 0, "end": 0x1000, "kind": "rom_header_and_ipl3"},
            {"start": 0x1000, "end": bounds[0], "kind": "boot_loader"},
            {"start": bounds[0], "end": bounds[-1], "kind": "archive_region"},
            {"start": bounds[-1], "end": len(rom), "kind": "unused_padding"},
        ],
        "archives": archives,
        "records": [asdict(record) for record in records],
        "summary": {
            "archive_slots": len(archives),
            "nonempty_archives": sum(item["records"] != 0 for item in archives),
            "records": len(records),
            "table_bytes": table_bytes,
            "payload_bytes": payload_bytes,
            "logical_payload_bytes": logical_payload_bytes,
            "alignment_bytes": alignment_bytes,
            "padding_bytes": len(rom) - bounds[-1],
            "counts_by_kind": dict(sorted(kinds.items())),
            "stored_bytes_by_kind": dict(sorted(stored.items())),
            "logical_stored_bytes_by_kind": dict(sorted(logical_stored.items())),
            "expanded_bytes_by_kind": dict(sorted(expanded.items())),
            "program": {
                "code_bytes": 1082496,
                "initialized_data_bytes": 155472,
                "bss_bytes": 82464,
                "function_candidates": 2751,
                "loader": {key: loader[key] for key in (
                    "code_bytes", "initialized_data_bytes", "function_candidates"
                )},
                "resident": {"code_bytes": 393288, "initialized_data_bytes": 94840,
                             "bss_bytes": 82464, "function_candidates": 1366},
                "overlay_1": {"code_bytes": 226792, "initialized_data_bytes": 12416,
                              "function_candidates": 960},
                "overlay_4": {"code_bytes": 132728, "initialized_data_bytes": 0,
                              "function_candidates": 420},
                "overlay_2": {"code_bytes": 204776, "initialized_data_bytes": 33930,
                              "function_candidates": 0},
                "overlay_5": {"code_bytes": 124268, "initialized_data_bytes": 14178,
                              "function_candidates": 0},
                "program_metadata": {"bytes": 32, "records": 1},
            },
        },
        "loader_map": loader["rows"],
    }


def records_tsv(audit: dict) -> str:
    lines = ["archive\tindex\trom_start\trom_end\tstored_extent\tlogical_stored_size\t"
             "alignment_bytes\texpanded_size\tencoding\tkind"]
    for record in audit["records"]:
        lines.append("\t".join((str(record["archive"]), str(record["index"]),
                                f'0x{record["rom_start"]:X}', f'0x{record["rom_end"]:X}',
                                str(record["stored_size"]), str(record["logical_stored_size"]),
                                str(record["alignment_bytes"]), str(record["expanded_size"]),
                                record["encoding"], record["kind"])))
    return "\n".join(lines) + "\n"


def physical_map(audit: dict) -> list[dict]:
    """Return non-overlapping intervals covering every physical ROM byte."""
    rows = [
        {"rom_start": 0, "rom_end": 0x1000, "kind": "rom_header_and_ipl3",
         "archive": None, "record": None},
        {"rom_start": 0x1000, "rom_end": audit["archives"][0]["start"],
         "kind": "boot_loader", "archive": None, "record": None},
    ]
    records = {(record["archive"], record["index"]): record
               for record in audit["records"]}
    for archive in audit["archives"]:
        if archive["table_size"] == 0:
            continue
        rows.append({"rom_start": archive["start"],
                     "rom_end": archive["start"] + archive["table_size"],
                     "kind": "archive_table", "archive": archive["index"],
                     "record": None})
        for index in range(archive["records"]):
            record = records[(archive["index"], index)]
            logical_end = record["rom_start"] + record["logical_stored_size"]
            if logical_end > record["rom_start"]:
                rows.append({"rom_start": record["rom_start"],
                             "rom_end": logical_end, "kind": record["kind"],
                             "archive": archive["index"], "record": index})
            if logical_end < record["rom_end"]:
                rows.append({"rom_start": logical_end,
                             "rom_end": record["rom_end"],
                             "kind": "record_alignment", "archive": archive["index"],
                             "record": index})
    rows.append({"rom_start": audit["archives"][-1]["end"],
                 "rom_end": audit["rom_size"], "kind": "unused_padding",
                 "archive": None, "record": None})
    rows.sort(key=lambda row: row["rom_start"])
    cursor = 0
    for row in rows:
        if row["rom_start"] != cursor or row["rom_end"] <= row["rom_start"]:
            raise AuditError(f"physical map discontinuity at 0x{cursor:X}")
        cursor = row["rom_end"]
    if cursor != audit["rom_size"]:
        raise AuditError(f"physical map ends at 0x{cursor:X}")
    return rows


def physical_map_tsv(audit: dict) -> str:
    lines = ["rom_start\trom_end\tsize\tkind\tarchive\trecord"]
    for row in physical_map(audit):
        lines.append("\t".join((f'0x{row["rom_start"]:06X}',
                                f'0x{row["rom_end"]:06X}',
                                str(row["rom_end"] - row["rom_start"]),
                                row["kind"],
                                "-" if row["archive"] is None else str(row["archive"]),
                                "-" if row["record"] is None else str(row["record"]))))
    return "\n".join(lines) + "\n"


def address_space_summary(audit: dict) -> dict:
    """Account for every offset in the unsigned 32-bit offset namespace."""
    limit = 1 << 32
    rom_size = audit["rom_size"]
    if not 0 < rom_size <= limit:
        raise AuditError("ROM size is outside the 32-bit offset namespace")
    return {
        "offset_start": 0,
        "offset_end_exclusive": limit,
        "cartridge_start": 0,
        "cartridge_end_exclusive": rom_size,
        "cartridge_bytes": rom_size,
        "outside_cartridge_start": rom_size,
        "outside_cartridge_end_exclusive": limit,
        "outside_cartridge_bytes": limit - rom_size,
        "last_offset": limit - 1,
    }


def write_outputs(audit: dict, output: Path) -> None:
    output.mkdir(parents=True, exist_ok=True)
    audit["address_space"] = address_space_summary(audit)
    (output / "rom_layout.json").write_text(json.dumps(audit, indent=2) + "\n")
    (output / "rom_files.tsv").write_text(records_tsv(audit))
    (output / "rom_map.tsv").write_text(physical_map_tsv(audit))
    summary = audit["summary"]
    md = ["# Madden Football 64 ROM audit", "",
          f"- Archive slots: {summary['archive_slots']} ({summary['nonempty_archives']} non-empty)",
          f"- File records: {summary['records']}",
          f"- Archive table bytes: {summary['table_bytes']}",
          f"- Stored payload bytes: {summary['payload_bytes']}",
          f"- Logical stored bytes: {summary['logical_payload_bytes']}",
          f"- Alignment bytes: {summary['alignment_bytes']}",
          f"- Unused tail padding: {summary['padding_bytes']}", "", "| Kind | Files | Stored bytes | Expanded bytes |",
          "|---|---:|---:|---:|"]
    for kind, count in summary["counts_by_kind"].items():
        md.append(f"| {kind} | {count} | {summary['stored_bytes_by_kind'][kind]} | "
                  f"{summary['expanded_bytes_by_kind'][kind]} |")
    (output / "rom_layout.md").write_text("\n".join(md) + "\n")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("rom", type=Path)
    parser.add_argument("main", type=Path)
    parser.add_argument("--out", type=Path, default=ROOT / "build/us/audit")
    args = parser.parse_args()
    audit = build_audit(load_rom(args.rom), args.main.read_bytes())
    write_outputs(audit, args.out)
    print(f"audited {audit['summary']['records']} records in "
          f"{audit['summary']['nonempty_archives']} archives")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
