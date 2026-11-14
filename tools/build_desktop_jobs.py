#!/usr/bin/env python3
"""Turn context-aware donor retrieval into a broad Desktop permutation queue."""
from __future__ import annotations

import argparse
import json
from pathlib import Path

LANES = {
    "kmc+builtin": "-O2 -G0 -mips3 -mgp32 -mfp32 -Wa,-r4300_mul -Iinclude",
    "kmc+asn64": "--assembler=asn64 -O2 -G0 -mips3 -mgp32 -mfp32 -Wa,-r4300_mul -Iinclude",
    "ido5.3": "-O2 -mips2 -non_shared -Xcpluscomm -Wab,-r4300_mul -G 0 -Iinclude",
    "ido7.1": "-O2 -mips2 -non_shared -Xcpluscomm -Wab,-r4300_mul -G 0 -Iinclude",
    "sn": "-O2 -G0 -mcpu=vr4300 -mhard-float -meb -mips3 -Iinclude",
}
DESTINATIONS = {
    "resident": "src/code", "overlay_1": "src/overlays/overlay1",
    "overlay_2": "src/overlays/overlay2", "overlay_4": "src/overlays/overlay4",
    "overlay_5": "src/overlays/overlay5",
}


def donor_lane(root: Path, source: str) -> tuple[str, str] | None:
    for manifest in (root / "config/us").glob("matching*_units.tsv"):
        for line in manifest.read_text().splitlines():
            fields = line.split("\t")
            if len(fields) < 4 or fields[2] != source:
                continue
            name = manifest.name
            if "ido7" in name: pipeline = "ido7.1"
            elif "ido" in name: pipeline = "ido5.3"
            elif "sn" in name: pipeline = "sn"
            elif "--assembler=asn64" in fields[3]: pipeline = "kmc+asn64"
            else: pipeline = "kmc+builtin"
            return pipeline, fields[3]
    return None


def build(root: Path, retrieval: Path, lanes: list[str], limit: int,
          donors_per_target: int, iterations: int, seeds: list[int]) -> list[dict]:
    rows = [json.loads(line) for line in retrieval.read_text().splitlines() if line.strip()]
    rows.sort(key=lambda row: (-int(row["size"]), row["module"], row["vram"]))
    jobs = []
    for query in rows:
        if len({job["vram"] for job in jobs}) >= limit:
            break
        if query["module"] not in DESTINATIONS:
            continue
        for donor_index, donor in enumerate(query.get("donors", [])[:donors_per_target]):
            source = donor.get("source")
            if not source or not (root / source).is_file():
                continue
            inferred = donor_lane(root, source)
            selected = lanes or ([inferred[0]] if inferred else ["kmc+builtin"])
            for pipeline in selected:
                flags = inferred[1] if inferred and pipeline == inferred[0] else LANES[pipeline]
                name = query["name"]
                jobs.append({
                    "id": f"{query['module']}-{name}-d{donor_index}-{pipeline.replace('+','_').replace('.','_')}",
                    "source": source,
                    "destination": f"{DESTINATIONS[query['module']]}/{name}.c",
                    "module": query["module"], "vram": query["vram"],
                    "size": f"{int(query['size']):X}", "function": donor["name"],
                    "target_function": name,
                    "pipeline": pipeline, "flags": flags, "iterations": iterations,
                    "max_mutations": 5, "temperature": 1.0, "seeds": seeds,
                    "donor": {"module": donor["module"], "name": donor["name"],
                              "score": donor.get("mean_score", donor.get("score")),
                              "frequency": donor.get("frequency")},
                })
    return jobs


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("retrieval", type=Path); ap.add_argument("output", type=Path)
    ap.add_argument("--root", type=Path, default=Path(".")); ap.add_argument("--limit", type=int, default=100)
    ap.add_argument("--donors", type=int, default=3); ap.add_argument("--iterations", type=int, default=3000)
    ap.add_argument("--seeds", default="20261113,20261114,20261115")
    ap.add_argument("--lanes", default="", help="comma-separated compiler lanes; empty uses donor lane")
    args = ap.parse_args(); lanes = [item for item in args.lanes.split(",") if item]
    unknown = set(lanes) - LANES.keys()
    if unknown: raise SystemExit(f"unknown compiler lanes: {sorted(unknown)}")
    jobs = build(args.root.resolve(), args.retrieval.resolve(), lanes, args.limit, args.donors,
                 args.iterations, [int(value, 0) for value in args.seeds.split(",")])
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("".join(json.dumps(job, sort_keys=True) + "\n" for job in jobs))
    print(json.dumps({"targets": len({job['vram'] for job in jobs}), "jobs": len(jobs),
                      "lanes": lanes or ["donor"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
