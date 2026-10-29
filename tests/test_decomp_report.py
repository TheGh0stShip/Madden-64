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
        self.assertTrue(REPORT.contains_instruction_asm(
            "src/code/fixed_square_root.c"
        ))

    def test_assembly_escape_patterns_are_rejected(self):
        self.assertTrue(REPORT.AMBIGUOUS_ASM.search(
            '__asm__("" ".word 0");'
        ))
        self.assertTrue(REPORT.AMBIGUOUS_ASM.search(
            '__asm__(OPCODE);'
        ))
        self.assertTrue(REPORT.ASSEMBLY_SOURCE_ESCAPE.search(
            '#include "handwritten.s"'
        ))
        self.assertTrue(REPORT.ASSEMBLY_SOURCE_ESCAPE.search(
            '__attribute__((naked)) void function(void);'
        ))

    def test_function_specific_normalizers_receive_no_c_credit(self):
        self.assertTrue(REPORT.uses_function_specific_normalizer(
            "--normalizer-enable-KMC-RECORD-MATRIX-CLEAR -O2"
        ))
        self.assertTrue(REPORT.uses_function_specific_normalizer(
            "--normalizer-enable-KMC-MENU-RESOURCE-STATE -O2"
        ))
        self.assertFalse(REPORT.uses_function_specific_normalizer(
            "--normalizer-enable-KMC-LID-PAIR "
            "--normalizer-enable-KMC-FP-PAIR-WORDS "
            "--normalizer-enable-KMC-LID-ALIGN4 -O2"
        ))

    def test_report_totals_match_reviewed_manifests(self):
        report = REPORT.build_report()
        totals = report["measures"]
        self.assertEqual(report["version"], 2)
        self.assertEqual(totals["total_code"], "1082496")
        self.assertEqual(totals["matched_code"], "300460")
        self.assertEqual(totals["total_data"], "155472")
        self.assertEqual(totals["matched_data"], "90777")
        self.assertEqual(totals["total_functions"], 3717)
        self.assertEqual(totals["matched_functions"], 1909)
        categories = {item["id"]: item["measures"] for item in report["categories"]}
        self.assertEqual(set(categories), {
            "code", "assembly_reference", "assembly_assisted_reference",
            "program_data",
        })
        self.assertEqual(categories["code"]["total_code"], "1082496")
        self.assertEqual(categories["code"]["matched_code"], "300460")
        self.assertEqual(categories["code"]["total_functions"], 3717)
        self.assertEqual(categories["code"]["matched_functions"], 1909)
        self.assertEqual(categories["assembly_reference"]["matched_code"], "305988")
        self.assertEqual(categories["assembly_assisted_reference"]["matched_code"], "58312")
        self.assertEqual(categories["program_data"]["total_code"], "0")
        self.assertEqual(categories["program_data"]["matched_code"], "0")
        self.assertEqual(categories["program_data"]["total_data"], "155472")
        self.assertEqual(categories["program_data"]["matched_data"], "90777")
        self.assertLessEqual(sum(int(unit["measures"]["total_code"])
                                 for unit in report["units"]), 1082496)
        self.assertEqual(sum(unit["measures"]["total_functions"]
                                 for unit in report["units"]), 3717)
        self.assertEqual(len(report["units"]), 3717)
        self.assertEqual(sum(unit["metadata"]["complete"]
                             for unit in report["units"]), 1909)
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
            "kind": "ratio", "completed": 300460, "total": 1082496,
            "unit": "bytes",
        })
        self.assertEqual(tracks["initialized-data"]["measurement"], {
            "kind": "ratio", "completed": 90777, "total": 155472,
            "unit": "bytes",
        })
        self.assertEqual(tracks["matching-functions"]["measurement"], {
            "kind": "ratio", "completed": 1909, "total": 3717,
            "unit": "functions",
        })
        self.assertEqual(tracks["assembly-reference"]["measurement"], {
            "kind": "ratio", "completed": 305988, "total": 1082496,
            "unit": "bytes",
        })
        self.assertEqual(tracks["assembly-assisted-reference"]["measurement"], {
            "kind": "ratio", "completed": 58312, "total": 1082496,
            "unit": "bytes",
        })
        self.assertEqual(tracks["archive-payload-extraction"]["measurement"], {
            "kind": "ratio", "completed": 14918923, "total": 14918923,
            "unit": "bytes",
        })
        self.assertIsNone(tracks["asset-reconstruction"]["measurement"])
        self.assertNotIn("overall", tracks)


if __name__ == "__main__":
    unittest.main()
