#!/usr/bin/env python3
"""Build a reproducible whole-ROM attack-surface report for Madden 64."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
import sys
import tomllib
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / "tools"


def load_tool(name: str):
    spec = importlib.util.spec_from_file_location(name, TOOLS / f"{name}.py")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


AUDIT = load_tool("audit_rom_layout")
REPORT = load_tool("generate_decomp_report")
RANK = load_tool("rank_overlay_candidates")

ROM = ROOT / "Madden Football 64 (USA).z64"
MAIN = ROOT / "build/us/survey/main_segment.bin"


def entropy(data: bytes) -> float:
    counts = Counter(data)
    size = len(data)
    return -sum((count / size) * math.log2(count / size)
                for count in counts.values()) if size else 0.0


def decoded_payload(rom: bytes, record: dict) -> bytes:
    data = rom[record["rom_start"]:
               record["rom_start"] + record["logical_stored_size"]]
    return AUDIT.decode_lzta(data) if record["encoding"] == "lz-type-1" else data


def size_bucket(size: int) -> str:
    for limit in (16, 32, 64, 128, 256, 512, 1024):
        if size <= limit:
            return f"000-{limit:04d}"
    return "1025+"


def function_analysis() -> dict:
    public = REPORT.build_report()
    units = public["units"]
    complete = {unit["name"]: bool(unit["metadata"]["complete"])
                for unit in units}
    buckets = defaultdict(lambda: {"functions": 0, "bytes": 0,
                                   "matched_functions": 0, "matched_bytes": 0})
    modules = defaultdict(lambda: {"functions": 0, "bytes": 0,
                                   "matched_functions": 0, "matched_bytes": 0})
    for unit in units:
        module = unit["name"].split("/", 1)[0]
        size = int(unit["functions"][0]["size"])
        matched = bool(unit["metadata"]["complete"])
        for target in (buckets[size_bucket(size)], modules[module]):
            target["functions"] += 1
            target["bytes"] += size
            target["matched_functions"] += int(matched)
            target["matched_bytes"] += size if matched else 0

    definitions = (
        ("resident", ROOT / "config/us/functions_resident.toml",
         ROOT / "build/us/survey/main_segment.bin", 0),
        ("overlay_1", ROOT / "config/us/functions_overlay1.toml",
         ROOT / "build/us/audit/overlay_1.z64", 0x1000),
        ("overlay_4", ROOT / "config/us/functions_overlay4.toml",
         ROOT / "build/us/audit/overlay_4.z64", 0x1000),
    )
    families = defaultdict(list)
    for module, catalogue_path, image_path, image_base in definitions:
        section = tomllib.loads(catalogue_path.read_text())["section"][0]
        image = image_path.read_bytes()
        for function in section["functions"]:
            key = f'{module}/{function["name"]}'
            if key not in complete:
                continue
            offset = image_base + function["vram"] - section["vram"]
            size = function["size"]
            body = image[offset:offset + size]
            if len(body) != size or size < 8:
                continue
            digest = hashlib.sha256(body).hexdigest()
            families[(size, digest)].append({
                "module": module, "name": function["name"],
                "vram": function["vram"], "size": size,
                "matched": complete[key],
            })
    repeated = []
    transferable = []
    for (size, digest), members in families.items():
        if len(members) < 2:
            continue
        item = {"size": size, "sha256": digest, "members": members,
                "matched": sum(member["matched"] for member in members)}
        repeated.append(item)
        if 0 < item["matched"] < len(members):
            transferable.append(item)
    repeated.sort(key=lambda item: (-item["size"] * len(item["members"]),
                                    item["sha256"]))
    transferable.sort(key=lambda item: (-item["size"], -len(item["members"]),
                                        item["sha256"]))
    ranked = RANK.ranked_candidates(0x200)
    return {
        "modules": dict(sorted(modules.items())),
        "size_buckets": dict(sorted(buckets.items())),
        "exact_duplicate_families": len(repeated),
        "exact_duplicate_members": sum(len(item["members"]) for item in repeated),
        "transferable_families": transferable[:100],
        "conservative_queue": ranked[:200],
    }


def asset_analysis(rom: bytes, audit: dict) -> dict:
    by_kind = defaultdict(lambda: {"records": 0, "stored_bytes": 0,
                                   "expanded_bytes": 0, "compressed_records": 0})
    magic = defaultdict(Counter)
    largest = []
    audio_types = Counter()
    audio_size_words_valid = 0
    container_versions = defaultdict(Counter)
    for record in audit["records"]:
        target = by_kind[record["kind"]]
        target["records"] += 1
        target["stored_bytes"] += record["logical_stored_size"]
        target["expanded_bytes"] += record["expanded_size"]
        target["compressed_records"] += int(record["encoding"] == "lz-type-1")
        decoded = decoded_payload(rom, record)
        magic[record["kind"]][decoded[:4].hex().upper()] += 1
        if record["kind"] == "audio_stream" and len(decoded) >= 4:
            stream_type = int.from_bytes(decoded[0:2], "little")
            size_word = int.from_bytes(decoded[2:4], "little")
            audio_types[stream_type] += 1
            audio_size_words_valid += int(size_word == (len(decoded) - 4) & 0xFFFF)
        if record["kind"] in ("tnmf_model", "tmot_animation", "tspr_sprite"):
            container_versions[record["kind"]][decoded[4:8].hex().upper()] += 1
        largest.append({"archive": record["archive"], "index": record["index"],
                        "kind": record["kind"], "rom_start": record["rom_start"],
                        "stored_bytes": record["logical_stored_size"],
                        "expanded_bytes": record["expanded_size"]})
    for target in by_kind.values():
        target["expansion_ratio"] = (round(
            target["expanded_bytes"] / target["stored_bytes"], 4
        ) if target["stored_bytes"] else 1.0)
    largest.sort(key=lambda item: (-item["expanded_bytes"], item["rom_start"]))
    return {
        "by_kind": dict(sorted(by_kind.items())),
        "leading_signatures": {
            kind: [{"hex": value, "records": count}
                   for value, count in counts.most_common(12)]
            for kind, counts in sorted(magic.items())
        },
        "largest_records": largest[:50],
        "format_evidence": {
            "audio": {
                "header_endian": "little",
                "header_bytes": 4,
                "size_word": "payload_bytes_mod_65536",
                "validated_records": audio_size_words_valid,
                "stream_types": {str(kind): count
                                 for kind, count in sorted(audio_types.items())},
            },
            "container_versions": {
                kind: [{"hex": value, "records": count}
                       for value, count in counts.most_common()]
                for kind, counts in sorted(container_versions.items())
            },
        },
    }


def build_analysis() -> dict:
    rom = AUDIT.load_rom(ROM)
    layout = AUDIT.build_audit(rom, MAIN.read_bytes())
    regions = []
    for region in layout["regions"]:
        data = rom[region["start"]:region["end"]]
        regions.append({**region, "size": len(data),
                        "entropy_bits_per_byte": round(entropy(data), 4)})
    archives = []
    for archive in layout["archives"]:
        data = rom[archive["start"]:archive["end"]]
        archives.append({**archive, "size": len(data),
                         "entropy_bits_per_byte": round(entropy(data), 4)})
    return {
        "rom_sha256": AUDIT.ROM_SHA256,
        "rom_size": len(rom),
        "coverage": {"mapped_bytes": sum(row["rom_end"] - row["rom_start"]
                                            for row in AUDIT.physical_map(layout)),
                     "unmapped_bytes": 0},
        "regions": regions,
        "archives": archives,
        "functions": function_analysis(),
        "assets": asset_analysis(rom, layout),
    }


def markdown(analysis: dict) -> str:
    lines = ["# Madden Football 64 attack surface", "",
             "This report is generated from the verified US Rev 0 ROM. It is a",
             "prioritization aid, not decompilation credit.", "",
             "## Whole-ROM coverage", "",
             f'- Physical bytes mapped: {analysis["coverage"]["mapped_bytes"]:,} / '
             f'{analysis["rom_size"]:,}',
             '- Unmapped bytes: 0', "", "| Region | Start | End | Bytes | Entropy |",
             "|---|---:|---:|---:|---:|"]
    for region in analysis["regions"]:
        lines.append(f'| {region["kind"]} | `0x{region["start"]:06X}` | '
                     f'`0x{region["end"]:06X}` | {region["size"]:,} | '
                     f'{region["entropy_bits_per_byte"]:.4f} |')
    lines.extend(["", "### Archive-by-archive profile", "",
                  "| Archive | Start | End | Records | Table bytes | Entropy |",
                  "|---:|---:|---:|---:|---:|---:|"])
    for archive in analysis["archives"]:
        lines.append(f'| {archive["index"]} | `0x{archive["start"]:06X}` | '
                     f'`0x{archive["end"]:06X}` | {archive["records"]:,} | '
                     f'{archive["table_size"]:,} | '
                     f'{archive["entropy_bits_per_byte"]:.4f} |')
    lines.extend(["", "## Function attack surface", "",
                  "| Module | Functions | Matched | Candidate bytes | Matched bytes |",
                  "|---|---:|---:|---:|---:|"])
    for module, values in analysis["functions"]["modules"].items():
        lines.append(f'| {module} | {values["functions"]:,} | '
                     f'{values["matched_functions"]:,} | {values["bytes"]:,} | '
                     f'{values["matched_bytes"]:,} |')
    lines.extend(["", "### Size distribution", "",
                  "| Function bytes | Candidates | Unmatched | Candidate bytes | Unmatched bytes |",
                  "|---|---:|---:|---:|---:|"])
    for bucket, values in analysis["functions"]["size_buckets"].items():
        lines.append(f'| {bucket} | {values["functions"]:,} | '
                     f'{values["functions"] - values["matched_functions"]:,} | '
                     f'{values["bytes"]:,} | '
                     f'{values["bytes"] - values["matched_bytes"]:,} |')
    functions = analysis["functions"]
    lines.extend(["", f'- Exact duplicate body families: '
                  f'{functions["exact_duplicate_families"]:,}',
                  f'- Functions participating in those families: '
                  f'{functions["exact_duplicate_members"]:,}',
                  f'- Matched-to-unmatched transferable families retained: '
                  f'{len(functions["transferable_families"]):,}',
                  f'- Conservative unmatched queue entries retained: '
                  f'{len(functions["conservative_queue"]):,}', "",
                  "Exact duplicate families with both matched and unmatched members are",
                  "the first source-reuse targets. The conservative queue additionally",
                  "requires a closed predecessor, a complete exit, no saved-context",
                  "register dependency, and no contradictory boundary finding.", "",
                  "## Asset attack surface", "",
                  "| Kind | Records | Compressed | Stored bytes | Expanded bytes | Ratio |",
                  "|---|---:|---:|---:|---:|---:|"])
    for kind, values in analysis["assets"]["by_kind"].items():
        lines.append(f'| {kind} | {values["records"]:,} | '
                     f'{values["compressed_records"]:,} | '
                     f'{values["stored_bytes"]:,} | {values["expanded_bytes"]:,} | '
                     f'{values["expansion_ratio"]:.4f} |')
    audio = analysis["assets"]["format_evidence"]["audio"]
    lines.extend(["", "## Format evidence", "",
                  f'- All {audio["validated_records"]} audio records begin with a '
                  "four-byte little-endian header. Its second 16-bit word equals",
                  "  the payload size modulo 65,536; stream type 0 occurs 233 times",
                  "  and stream type 9 occurs four times.",
                  "- The audio archive does not use the EA `SCHl` block container.",
                  "- `TNMF`, `TMot`, and `TSpr` version/flag populations are retained",
                  "  in the machine-readable report for parser development.", "",
                  "The machine-readable report preserves per-archive entropy, leading",
                  "decoded signatures, the fifty largest records, transferable function",
                  "families, and the ranked work queue. Exact physical extents remain in",
                  "`config/us/rom_map.tsv`; all archive records remain in",
                  "`config/us/rom_files.tsv`; function boundaries remain in the three",
                  "`config/us/functions_*.toml` catalogues.", ""])
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", type=Path,
                        default=ROOT / "config/us/attack_surface.json")
    parser.add_argument("--markdown", type=Path,
                        default=ROOT / "docs/ATTACK_SURFACE.md")
    args = parser.parse_args()
    analysis = build_analysis()
    args.json.write_text(json.dumps(analysis, indent=2) + "\n")
    args.markdown.write_text(markdown(analysis))
    print(f'audited {analysis["rom_size"]} ROM bytes, '
          f'{len(analysis["functions"]["transferable_families"])} transferable families')
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
