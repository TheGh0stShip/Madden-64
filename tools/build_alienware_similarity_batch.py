#!/usr/bin/env python3
"""Build a relocation-insensitive resident function retrieval batch for Alienware OpenCL."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import struct
from collections import defaultdict
from pathlib import Path


def rows(path: Path) -> list[dict]:
    result = []
    for line in path.read_text().splitlines():
        fields = line.split("\t")
        if len(fields) < 5 or not fields[0].startswith("0x"):
            continue
        result.append({"offset": int(fields[0], 16), "size": int(fields[1], 16),
                       "source": fields[2], "sha256": fields[-1]})
    return result


def function_addresses(path: Path) -> dict[str, int]:
    result = {}
    pattern = re.compile(r'name\s*=\s*"([^"]+)".*?vram\s*=\s*(0x[0-9A-Fa-f]+)')
    for line in path.read_text().splitlines():
        match = pattern.search(line)
        if match:
            result[match.group(1)] = int(match.group(2), 16)
    return result


def normalize_mips(data: bytes) -> bytes:
    """Mask address/immediate fields while preserving opcode and register structure."""
    if len(data) % 4:
        raise ValueError("MIPS text length is not word aligned")
    output = bytearray()
    for (word,) in struct.iter_unpack(">I", data):
        opcode = word >> 26
        if opcode in (2, 3):                 # j / jal target
            word &= 0xFC000000
        elif opcode == 0:
            pass                              # R-type: registers, shift, and function all matter
        elif opcode == 17 and ((word >> 21) & 0x1F) != 8:
            pass                              # COP1 arithmetic/conversion encoding
        else:
            word &= 0xFFFF0000                # branch, address, or scalar immediate
        output.extend(struct.pack(">I", word))
    return bytes(output)


def safe_name(source: str, index: int) -> str:
    stem = re.sub(r"[^A-Za-z0-9_.-]+", "_", Path(source).stem)
    return f"c{index:04d}_{stem}.bin"


def genuine_c(source: str) -> bool:
    path = Path(source)
    if not path.is_file():
        return False
    text = path.read_text(errors="replace")
    if "__asm__" in text or re.search(r"\basm\s*\(", text):
        return False
    if re.search(r"(?m)^\s*\.(?:word|byte)\b", text):
        return False
    return not re.search(r"\bincbin\b", text, re.IGNORECASE)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("output", type=Path)
    parser.add_argument("--image", type=Path, default=Path("build/us/main_unpacked.z64"))
    parser.add_argument("--exact", type=Path, default=Path("config/us/matching_kmc_units.tsv"))
    parser.add_argument("--unmatched", type=Path, default=Path("config/us/matching_asm_units.tsv"))
    parser.add_argument("--functions", type=Path,
                        help="function catalogue used to map overlay source names to VRAM")
    parser.add_argument("--link-delta", type=lambda value: int(value, 0), default=0)
    parser.add_argument("--offset-bias", type=lambda value: int(value, 0),
                        help="constant added to manifest offsets in a composite image")
    parser.add_argument("--limit", type=int, default=200)
    parser.add_argument("--skip-targets", type=int, default=0,
                        help="skip this many size-ranked unmatched targets")
    args = parser.parse_args()

    image = args.image.read_bytes()
    addresses = function_addresses(args.functions) if args.functions else {}

    def location(row: dict) -> int:
        if args.offset_bias is not None:
            return row["offset"] + args.offset_bias
        if not addresses:
            return row["offset"]
        name = Path(row["source"]).stem
        if name not in addresses:
            return -1
        actual_vram = addresses[name] - args.link_delta
        return actual_vram - 0x80000400 + 0x1000
    exact_by_size: dict[int, list[tuple[dict, bytes]]] = defaultdict(list)
    exact_corpus: list[tuple[dict, bytes]] = []
    rejected = []
    rejected_provenance = []
    for row in rows(args.exact):
        if not genuine_c(row["source"]):
            rejected_provenance.append(row["source"])
            continue
        offset = location(row)
        blob = image[offset:offset + row["size"]] if offset >= 0 else b""
        if hashlib.sha256(blob).hexdigest() != row["sha256"]:
            rejected.append(row["source"])
            continue
        row = dict(row, image_offset=offset)
        normalized = normalize_mips(blob)
        exact_by_size[row["size"]].append((row, normalized))
        exact_corpus.append((row, normalized))

    targets = []
    for row in rows(args.unmatched):
        offset = location(row)
        blob = image[offset:offset + row["size"]] if offset >= 0 else b""
        if hashlib.sha256(blob).hexdigest() != row["sha256"]:
            continue
        # A larger exact function is still a useful prefix donor.  Candidate
        # construction below already truncates it to the target length; do not
        # silently discard targets merely because no donor has identical size.
        if any(size >= row["size"] for size in exact_by_size):
            targets.append((dict(row, image_offset=offset), normalize_mips(blob)))
    if args.limit < 1 or args.skip_targets < 0:
        raise SystemExit("--limit must be positive and --skip-targets nonnegative")
    targets.sort(key=lambda item: (-item[0]["size"], item[0]["source"]))
    targets = targets[args.skip_targets:args.skip_targets + args.limit]

    if args.output.exists():
        shutil.rmtree(args.output)
    args.output.mkdir(parents=True)
    manifest = []
    for target_index, (target, target_blob) in enumerate(targets):
        directory = args.output / f"t{target_index:04d}_{Path(target['source']).stem}"
        candidates = directory / "candidates"
        candidates.mkdir(parents=True)
        (directory / "target.bin").write_bytes(target_blob)
        mapping = []
        eligible = [(candidate, candidate_blob[:target["size"]])
                    for candidate, candidate_blob in exact_corpus
                    if candidate["size"] >= target["size"]]
        for candidate_index, (candidate, candidate_blob) in enumerate(eligible):
            filename = safe_name(candidate["source"], candidate_index)
            (candidates / filename).write_bytes(candidate_blob)
            mapping.append({"file": filename, "source": candidate["source"],
                            "offset": hex(candidate["offset"]), "size": candidate["size"],
                            "compared_prefix_bytes": target["size"]})
        (directory / "candidates.json").write_text(json.dumps(mapping, indent=2) + "\n")
        manifest.append({"id": directory.name, "target": target["source"],
                         "offset": hex(target["offset"]), "size": target["size"],
                         "candidates": len(mapping)})
    (args.output / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    summary = {"schema": "alienware-mips-similarity-v1", "targets": len(manifest),
               "comparisons": sum(row["candidates"] for row in manifest),
               "exact_corpus": sum(map(len, exact_by_size.values())),
               "rejected_exact_rows": rejected,
               "rejected_provenance_rows": rejected_provenance}
    (args.output / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps(summary, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
