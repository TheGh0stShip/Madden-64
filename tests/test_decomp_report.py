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
        self.assertEqual(totals["total_code"], "753420")
        self.assertEqual(totals["matched_code"], "49184")
        self.assertEqual(totals["total_data"], "484548")
        self.assertEqual(totals["matched_data"], "496")
        self.assertEqual(totals["total_functions"], 2279)
        self.assertEqual(totals["matched_functions"], 392)
        categories = {item["id"]: item["measures"] for item in report["categories"]}
        self.assertNotIn("overall_verified", categories)
        self.assertEqual(categories["overlays"]["matched_code"], "908")
        self.assertEqual(categories["overlays"]["matched_functions"], 66)
        self.assertEqual(categories["boot_loader"]["total_code"], "644")
        self.assertEqual(categories["boot_loader"]["total_data"], "76")
        self.assertEqual(categories["boot_loader"]["total_functions"], 5)
        self.assertEqual(categories["boot_loader"]["matched_code"], "172")
        self.assertEqual(categories["boot_loader"]["matched_functions"], 3)
        self.assertEqual(categories["rom_inventory"]["total_functions"], 1353)
        self.assertEqual(categories["inventory_audio"]["total_functions"], 237)
        self.assertEqual(categories["inventory_audio"]["total_data"], "7169664")
        self.assertEqual(categories["inventory_images"]["total_functions"], 43)
        self.assertEqual(categories["inventory_textures"]["total_functions"], 516)
        self.assertEqual(categories["inventory_textures"]["total_data"], "1104924")
        self.assertEqual(categories["inventory_models"]["total_functions"], 262)
        self.assertEqual(categories["inventory_animations"]["total_functions"], 67)
        self.assertEqual(categories["inventory_sprites"]["total_functions"], 2)
        self.assertEqual(categories["inventory_graphics_auxiliary"]["matched_functions"], 214)
        self.assertEqual(categories["inventory_game_data"]["matched_functions"], 4)
        self.assertEqual(categories["inventory_game_data"]["matched_data"], "155978")
        self.assertEqual(categories["rom_mapping"]["matched_data"], "12582912")

    def test_cli_writes_valid_json(self):
        report = REPORT.build_report()
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "report.json"
            path.write_text(json.dumps(report))
            self.assertEqual(json.loads(path.read_text())["version"], 2)


if __name__ == "__main__":
    unittest.main()
