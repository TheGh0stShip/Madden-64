import importlib.util
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "audit_rom_layout", ROOT / "tools/audit_rom_layout.py"
)
AUDIT = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = AUDIT
SPEC.loader.exec_module(AUDIT)
ROM = ROOT / "Madden Football 64 (USA).z64"
MAIN = ROOT / "build/us/survey/main_segment.bin"
LEDGER = ROOT / "config/us/rom_files.tsv"


@unittest.skipUnless(ROM.is_file() and MAIN.is_file(), "requires verified ROM survey")
class RomLayoutTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.audit = AUDIT.build_audit(AUDIT.load_rom(ROM), MAIN.read_bytes())

    def test_archive_inventory(self):
        summary = self.audit["summary"]
        self.assertEqual(summary["archive_slots"], 15)
        self.assertEqual(summary["nonempty_archives"], 14)
        self.assertEqual(summary["records"], 1353)
        self.assertEqual(summary["logical_payload_bytes"], 12555560)
        self.assertEqual(summary["alignment_bytes"], 626)

    def test_archive_region_is_gap_free(self):
        summary = self.audit["summary"]
        self.assertEqual(summary["table_bytes"] + summary["payload_bytes"],
                         0xBFE9D6 - 0x12D0)
        self.assertEqual(sum(region["end"] - region["start"]
                             for region in self.audit["regions"]), 0xC00000)

    def test_every_record_has_a_physical_content_class(self):
        counts = self.audit["summary"]["counts_by_kind"]
        self.assertNotIn("structured_data", counts)
        self.assertNotIn("binary_record", counts)
        self.assertEqual(sum(counts.values()), 1353)
        self.assertEqual(counts["texture"], 516)
        self.assertEqual(counts["graphics_auxiliary"], 214)
        self.assertEqual(counts["audio_stream"], 237)

    def test_whole_program_accounting(self):
        program = self.audit["summary"]["program"]
        self.assertEqual(program["code_bytes"], 753420)
        self.assertEqual(program["initialized_data_bytes"], 484548)
        self.assertEqual(program["function_candidates"], 2279)
        self.assertEqual(program["code_bytes"] + program["initialized_data_bytes"],
                         1237968)

    def test_committed_record_ledger_is_current(self):
        self.assertEqual(LEDGER.read_text(), AUDIT.records_tsv(self.audit))

    def test_boot_lz_decoder_reproduces_main_image(self):
        rom = AUDIT.load_rom(ROM)
        first = self.audit["records"][0]
        decoded = AUDIT.decode_lzta(rom[first["rom_start"]:first["rom_end"]])
        main = MAIN.read_bytes()
        self.assertEqual(decoded[0x40:], main[0x40:])
        self.assertEqual(decoded[:0x40], bytes(0x40))


if __name__ == "__main__":
    unittest.main()
