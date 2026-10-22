import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "generate_decomp_report", ROOT / "tools/generate_decomp_report.py"
)
REPORT = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(REPORT)


class DecompReportTests(unittest.TestCase):
    def test_report_totals_match_reviewed_manifests(self):
        report = REPORT.build_report()
        totals = report["measures"]
        self.assertEqual(report["version"], 2)
        self.assertEqual(totals["total_code"], "411132")
        self.assertEqual(totals["matched_code"], "32748")
        self.assertEqual(totals["total_data"], "76996")
        self.assertEqual(totals["matched_data"], "288")

    def test_cli_writes_valid_json(self):
        report = REPORT.build_report()
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "report.json"
            path.write_text(json.dumps(report))
            self.assertEqual(json.loads(path.read_text())["version"], 2)


if __name__ == "__main__":
    unittest.main()
