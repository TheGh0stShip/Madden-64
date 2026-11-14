#!/usr/bin/env python3
"""Build an auditable inventory of public N64 matching-decomp projects.

The canonical discovery feed is awesome-reverse-engineered's CC0 catalogue.
Optional metadata mirrors live outside the Madden checkout and are deliberately
shallow/no-checkout.  Only build/configuration documentation is inspected; no
upstream code is admitted to a training corpus by this inventory alone.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import json
import re
import subprocess
from pathlib import Path
from urllib.parse import urlparse

SUBCATEGORY = "Matching Decompilations — Nintendo 64"
CONFIG_NAME = re.compile(
    r"(?:^|/)(?:README(?:\.[^/]*)?|Makefile|makefile|diff_settings\.py|configure\.py|"
    r"build\.py|.*\.yaml|.*\.yml|.*\.toml|.*\.json)$", re.IGNORECASE)
SIGNATURES = {
    "sn-gcc": re.compile(r"\b(?:SN\s*(?:Systems|64)|cc1n64|asn64|sn-n64|GCC\s*2\.8\.1)\b", re.I),
    "kmc-gcc": re.compile(r"\b(?:KMC|gcc[- ]?2\.7\.2|mips[- ]?gcc|gcc_kmc)\b", re.I),
    "ido": re.compile(r"\b(?:IDO|ido5\.3|ido7\.1|IRIX|qemu-irix|ido_static_recomp)\b", re.I),
    "egcs-gcc": re.compile(r"\b(?:egcs|2\.91\.66)\b", re.I),
    "psyq-gcc": re.compile(r"\b(?:PSYQ|psyq)\b", re.I),
}


def command(argv: list[str], cwd: Path | None = None, check: bool = True) -> subprocess.CompletedProcess:
    return subprocess.run(argv, cwd=cwd, capture_output=True, text=True, check=check)


def slug(url: str) -> str:
    return re.sub(r"[^A-Za-z0-9_.-]+", "_", re.sub(r"\.git$", "", url).strip("/"))[-160:]


def ensure_metadata_clone(url: str, mirrors: Path) -> tuple[Path | None, str | None]:
    parsed = urlparse(url)
    if parsed.scheme != "https" or parsed.hostname not in {"github.com", "gitlab.com", "codeberg.org"}:
        return None, f"untrusted repository URL rejected: {url}"
    destination = mirrors / slug(url)
    if not destination.exists():
        proc = command(["git", "-c", "core.hooksPath=/dev/null", "-c", "protocol.file.allow=never",
                        "-c", "protocol.ext.allow=never", "clone", "--filter=blob:none", "--depth", "1", "--no-checkout",
                        url, str(destination)], check=False)
        if proc.returncode:
            return None, (proc.stderr or proc.stdout)[-500:]
    else:
        command(["git", "-c", "core.hooksPath=/dev/null", "-c", "protocol.file.allow=never",
                 "-c", "protocol.ext.allow=never", "-C", str(destination),
                 "fetch", "--depth", "1", "origin"], check=False)
    return destination, None


def inspect_clone(repository: Path, maximum_files: int) -> tuple[list[str], list[str]]:
    tree = command(["git", "ls-tree", "-r", "--name-only", "HEAD"], repository, check=False)
    if tree.returncode:
        return [], []
    candidates = [name for name in tree.stdout.splitlines() if CONFIG_NAME.search(name)]
    # Root docs/build files first, then deterministic lexical order.
    candidates.sort(key=lambda value: (value.count("/"), len(value), value.lower()))
    evidence, families = [], set()
    for name in candidates[:maximum_files]:
        shown = command(["git", "show", f"HEAD:{name}"], repository, check=False)
        if shown.returncode or len(shown.stdout) > 2_000_000:
            continue
        for family, pattern in SIGNATURES.items():
            matches = pattern.findall(shown.stdout)
            if matches:
                families.add(family)
                evidence.append(f"{name}: {family}: {matches[0]}")
    return sorted(families), evidence[:40]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("catalogue", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--mirrors", type=Path)
    parser.add_argument("--probe", action="store_true")
    parser.add_argument("--maximum-files", type=int, default=30)
    parser.add_argument("--jobs", type=int, default=8)
    parser.add_argument("--supplement", type=Path, action="append", default=[])
    args = parser.parse_args()
    entries = json.loads(args.catalogue.read_text())
    projects = [item for item in entries if item.get("subcategory") == SUBCATEGORY]
    known = {item["url"].rstrip("/").lower() for item in projects}
    for supplement in args.supplement:
        for item in json.loads(supplement.read_text()):
            key = item["url"].rstrip("/").lower()
            if key not in known:
                projects.append(item); known.add(key)
    rows = []
    if args.probe and args.mirrors is None:
        parser.error("--probe requires --mirrors")
    if args.mirrors:
        args.mirrors.mkdir(parents=True, exist_ok=True)
    ordered = sorted(projects, key=lambda row: (row["name"].lower(), row["url"]))

    def assess(item: dict) -> dict:
        row = {key: item.get(key) for key in
               ("name", "url", "desc", "stars", "archived", "pushed", "lang", "license")}
        row.update({"discovery_source": "awesome-reverse-engineered/data/entries.json",
                    "compiler_families": [], "compiler_evidence": [], "probe_error": None,
                    "training_status": "unassessed"})
        if args.probe:
            repository, error = ensure_metadata_clone(item["url"], args.mirrors)
            row["probe_error"] = error
            if repository:
                row["compiler_families"], row["compiler_evidence"] = inspect_clone(
                    repository, args.maximum_files)
        return row

    if args.probe:
        with concurrent.futures.ThreadPoolExecutor(max_workers=max(1, args.jobs)) as executor:
            rows = list(executor.map(assess, ordered))
    else:
        rows = [assess(item) for item in ordered]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps({"version": 1, "projects": rows}, indent=2,
                                      sort_keys=True) + "\n")
    print(json.dumps({"projects": len(rows),
                      "probed": sum(not row["probe_error"] and bool(row["compiler_evidence"]) for row in rows),
                      "families": {family: sum(family in row["compiler_families"] for row in rows)
                                   for family in SIGNATURES}}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
