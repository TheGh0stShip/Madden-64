"""Initialized-data ledger, manifest and source checks (config/us/data_ledger.tsv,
config/us/matching_data_units.tsv, src/data/)."""
import re
import subprocess
import sys
import unittest
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LEDGER = ROOT / "config/us/data_ledger.tsv"
MANIFEST = ROOT / "config/us/matching_data_units.tsv"
SCOPE_BYTES = 484540          # the project's initialized-data denominator (config/us/progress.toml)
CODE_BYTES_IN_SCOPE = 329068  # executable spans inside that denominator (results: scope correction)


def ledger_rows():
    lines = LEDGER.read_text().splitlines()
    head = lines[0].split("\t")
    return [dict(zip(head, line.split("\t"))) for line in lines[1:] if line]


def manifest_rows():
    rows = []
    for line in MANIFEST.read_text().splitlines():
        if line and not line.startswith("#"):
            module, source, section, vram, size, sha, credited = line.split("\t")
            rows.append({"module": module, "source": source, "section": section, "vram": int(vram, 0),
                         "size": int(size, 0), "sha256": sha, "credited": int(credited)})
    return rows


class DataLedgerTest(unittest.TestCase):
    def test_ledger_is_gap_free_and_totals_scope(self):
        rows = ledger_rows()
        self.assertEqual(sum(int(r["size"]) for r in rows), SCOPE_BYTES)
        by_region = defaultdict(list)
        for r in rows:
            by_region[(r["module"], r["region"])].append((int(r["vram_start"], 16), int(r["vram_end"], 16)))
        for key, spans in by_region.items():
            spans.sort()
            for (a0, a1), (b0, b1) in zip(spans, spans[1:]):
                self.assertEqual(a1, b0, f"gap or overlap in {key} at 0x{a1:08X}")
            for a, b in spans:
                self.assertLess(a, b)

    def test_code_corrections_are_marked(self):
        rows = ledger_rows()
        code = sum(int(r["size"]) for r in rows if r["credit"] == "code (out of data scope)")
        self.assertEqual(code, CODE_BYTES_IN_SCOPE)

    def test_manifest_covers_every_data_byte_once(self):
        rows = ledger_rows()
        data = sum(int(r["size"]) for r in rows if r["credit"] != "code (out of data scope)")
        self.assertEqual(sum(u["size"] for u in manifest_rows()), data)
        self.assertEqual(data, SCOPE_BYTES - CODE_BYTES_IN_SCOPE)

    def test_credit_equals_ledger(self):
        rows = ledger_rows()
        credited = sum(int(r["size"]) for r in rows if r["credit"] == "credited")
        self.assertEqual(sum(u["credited"] for u in manifest_rows()), credited)

    def test_sources_have_no_binary_or_assembly_escapes(self):
        forbidden = re.compile(r"\b(asm|__asm__|__asm|incbin)\b|\.incbin|#\s*include\s*\"[^\"]+\.(bin|s|inc)\"")
        for unit in manifest_rows():
            text = (ROOT / unit["source"]).read_text()
            self.assertIsNone(forbidden.search(text), unit["source"])
            self.assertIn('#include "types.h"', text)

    @unittest.skipUnless((ROOT / "build/us/survey/main_segment.bin").exists()
                         and (ROOT / "build/us/extracted_records/archive_00").exists(),
                         "needs build/us/survey and build/us/extracted_records (make survey extract-assets)")
    def test_units_compile_to_retail_bytes(self):
        result = subprocess.run([sys.executable, str(ROOT / "tools/verify_data.py")], capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stdout[-2000:] + result.stderr[-2000:])


if __name__ == "__main__":
    unittest.main()
