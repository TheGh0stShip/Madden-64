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
        self.assertEqual(totals["total_code"], "753428")
        self.assertEqual(totals["matched_code"], "57020")
        self.assertEqual(totals["total_data"], "484540")
        self.assertEqual(totals["matched_data"], "496")
        self.assertEqual(totals["total_functions"], 2823)
        self.assertEqual(totals["matched_functions"], 521)
        categories = {item["id"]: item["measures"] for item in report["categories"]}
        self.assertEqual(set(categories), {"code", "program_data"})
        self.assertEqual(categories["code"]["total_code"], "753428")
        self.assertEqual(categories["code"]["matched_code"], "57020")
        self.assertEqual(categories["code"]["total_functions"], 2823)
        self.assertEqual(categories["code"]["matched_functions"], 521)
        self.assertEqual(categories["program_data"]["total_code"], "0")
        self.assertEqual(categories["program_data"]["matched_code"], "0")
        self.assertEqual(categories["program_data"]["total_data"], "484540")
        self.assertEqual(categories["program_data"]["matched_data"], "496")
        self.assertLessEqual(sum(int(unit["measures"]["total_code"])
                                 for unit in report["units"]), 753428)
        self.assertEqual(sum(unit["measures"]["total_functions"]
                             for unit in report["units"]), 2823)
        self.assertEqual(len(report["units"]), 2823)
        self.assertEqual(sum(unit["metadata"]["complete"]
                             for unit in report["units"]), 521)
        self.assertTrue(all(len(unit["functions"]) == 1
                            for unit in report["units"]))
        self.assertTrue(all("unmatched" not in unit["name"]
                            for unit in report["units"]))
        self.assertTrue(any(unit["metadata"]["complete"]
                            for unit in report["units"]))
        self.assertTrue(any(not unit["metadata"]["complete"]
                            for unit in report["units"]))

    def test_cli_writes_valid_json(self):
        report = REPORT.build_report()
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "report.json"
            path.write_text(json.dumps(report))
            self.assertEqual(json.loads(path.read_text())["version"], 2)


if __name__ == "__main__":
    unittest.main()
