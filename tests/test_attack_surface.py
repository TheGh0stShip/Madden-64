import importlib.util
import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "analyze_attack_surface", ROOT / "tools/analyze_attack_surface.py"
)
ATTACK = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = ATTACK
SPEC.loader.exec_module(ATTACK)
ROM = ROOT / "Madden Football 64 (USA).z64"
REPORT = ROOT / "config/us/attack_surface.json"


@unittest.skipUnless(ROM.is_file(), "requires verified ROM")
class AttackSurfaceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.analysis = ATTACK.build_analysis()

    def test_report_is_current_and_covers_the_rom(self):
        self.assertEqual(json.loads(REPORT.read_text()), self.analysis)
        self.assertEqual(self.analysis["coverage"]["mapped_bytes"], 0xC00000)
        self.assertEqual(self.analysis["coverage"]["unmapped_bytes"], 0)

    def test_audio_header_contract_covers_every_stream(self):
        audio = self.analysis["assets"]["format_evidence"]["audio"]
        self.assertEqual(audio["validated_records"], 237)
        self.assertEqual(audio["stream_types"], {"0": 233, "9": 4})

    def test_public_function_totals_are_preserved(self):
        modules = self.analysis["functions"]["modules"]
        self.assertEqual(sum(item["functions"] for item in modules.values()), 2823)
        self.assertEqual(sum(item["matched_functions"] for item in modules.values()),
                         548)


if __name__ == "__main__":
    unittest.main()
