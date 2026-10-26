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
    def test_instruction_emitting_inline_assembly_receives_no_c_credit(self):
        self.assertTrue(REPORT.contains_instruction_asm(
            "src/code/vector_fixed_scale.c"
        ))
        self.assertFalse(REPORT.contains_instruction_asm(
            "src/code/audio_level_calculate.c"
        ))

    def test_report_totals_match_reviewed_manifests(self):
        report = REPORT.build_report()
        totals = report["measures"]
        self.assertEqual(report["version"], 2)
        self.assertEqual(totals["total_code"], "753428")
        self.assertEqual(totals["matched_code"], "128724")
        self.assertEqual(totals["total_data"], "484540")
        self.assertEqual(totals["matched_data"], "496")
        self.assertEqual(totals["total_functions"], 2820)
        self.assertEqual(totals["matched_functions"], 1184)
        categories = {item["id"]: item["measures"] for item in report["categories"]}
        self.assertEqual(set(categories), {
            "code", "assembly_reference", "assembly_assisted_reference",
            "program_data",
        })
        self.assertEqual(categories["code"]["total_code"], "753428")
        self.assertEqual(categories["code"]["matched_code"], "128724")
        self.assertEqual(categories["code"]["total_functions"], 2820)
        self.assertEqual(categories["code"]["matched_functions"], 1184)
        self.assertEqual(categories["assembly_reference"]["matched_code"], "435520")
        self.assertEqual(categories["assembly_assisted_reference"]["matched_code"], "296")
        self.assertEqual(categories["program_data"]["total_code"], "0")
        self.assertEqual(categories["program_data"]["matched_code"], "0")
        self.assertEqual(categories["program_data"]["total_data"], "484540")
        self.assertEqual(categories["program_data"]["matched_data"], "496")
        self.assertLessEqual(sum(int(unit["measures"]["total_code"])
                                 for unit in report["units"]), 753428)
        self.assertEqual(sum(unit["measures"]["total_functions"]
                                 for unit in report["units"]), 2820)
        self.assertEqual(len(report["units"]), 2820)
        self.assertEqual(sum(unit["metadata"]["complete"]
                             for unit in report["units"]), 1184)
        partial_units = {
            unit["name"]: (
                int(unit["measures"]["matched_code"]),
                int(unit["measures"]["total_code"]),
            )
            for unit in report["units"]
            if 0 < int(unit["measures"]["matched_code"])
            < int(unit["measures"]["total_code"])
        }
        self.assertEqual(partial_units, {
            "overlay_1/func_800B4F08": (136, 140),
            "overlay_1/func_800BD370": (64, 68),
        })
        self.assertTrue(all(len(unit["functions"]) == 1
                            for unit in report["units"]))
        self.assertTrue(all("unmatched" not in unit["name"]
                            for unit in report["units"]))
        self.assertTrue(any(unit["metadata"]["complete"]
                            for unit in report["units"]))
        self.assertTrue(any(not unit["metadata"]["complete"]
                            for unit in report["units"]))
        self.assertTrue(all(
            unit["metadata"]["source_path"].endswith(".c")
            for unit in report["units"]
            if unit["metadata"]["complete"]
        ))

    def test_cli_writes_valid_json(self):
        report = REPORT.build_report()
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "report.json"
            path.write_text(json.dumps(report))
            self.assertEqual(json.loads(path.read_text())["version"], 2)

    def test_decomphub_report_preserves_independent_scopes(self):
        report = REPORT.build_decomphub_report(REPORT.build_report())
        tracks = {track["id"]: track for track in report["tracks"]}
        self.assertEqual(report["format"], "decomphub.progress/v1")
        self.assertEqual(tracks["matching-code"]["measurement"], {
            "kind": "ratio", "completed": 128724, "total": 753428,
            "unit": "bytes",
        })
        self.assertEqual(tracks["initialized-data"]["measurement"], {
            "kind": "ratio", "completed": 496, "total": 484540,
            "unit": "bytes",
        })
        self.assertEqual(tracks["matching-functions"]["measurement"], {
            "kind": "ratio", "completed": 1184, "total": 2820,
            "unit": "functions",
        })
        self.assertEqual(tracks["assembly-reference"]["measurement"], {
            "kind": "ratio", "completed": 435520, "total": 753428,
            "unit": "bytes",
        })
        self.assertEqual(tracks["assembly-assisted-reference"]["measurement"], {
            "kind": "ratio", "completed": 296, "total": 753428,
            "unit": "bytes",
        })
        self.assertIsNone(tracks["asset-reconstruction"]["measurement"])
        self.assertNotIn("overall", tracks)


if __name__ == "__main__":
    unittest.main()
