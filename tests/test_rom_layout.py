import importlib.util
import sys
import tomllib
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
MAP = ROOT / "config/us/rom_map.tsv"
PROGRESS = ROOT / "config/us/progress.toml"
OVERLAY1_FINDINGS = ROOT / "config/us/overlay1_boundary_findings.tsv"
OVERLAY4_FINDINGS = ROOT / "config/us/overlay4_boundary_findings.tsv"
RESIDENT_FINDINGS = ROOT / "config/us/resident_boundary_findings.tsv"


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
        self.assertEqual(program["code_bytes"], 753428)
        self.assertEqual(program["initialized_data_bytes"], 484540)
        self.assertEqual(program["function_candidates"], 2817)
        self.assertEqual(program["code_bytes"] + program["initialized_data_bytes"],
                         1237968)

    def test_boot_loader_map_is_complete(self):
        loader = self.audit["summary"]["program"]["loader"]
        self.assertEqual(loader["code_bytes"], 644)
        self.assertEqual(loader["initialized_data_bytes"], 76)
        self.assertEqual(loader["function_candidates"], 5)
        rows = self.audit["loader_map"]
        self.assertEqual(rows[0]["start"], 0x1000)
        self.assertEqual(rows[-1]["end"], 0x12D0)
        self.assertEqual(sum(row["size"] for row in rows), 720)

    def test_committed_record_ledger_is_current(self):
        self.assertEqual(LEDGER.read_text(), AUDIT.records_tsv(self.audit))

    def test_physical_map_is_gap_free_and_current(self):
        rows = AUDIT.physical_map(self.audit)
        self.assertEqual(rows[0]["rom_start"], 0)
        self.assertEqual(rows[-1]["rom_end"], 0xC00000)
        self.assertEqual(sum(row["rom_end"] - row["rom_start"] for row in rows),
                         0xC00000)
        self.assertEqual(MAP.read_text(), AUDIT.physical_map_tsv(self.audit))

    def test_complete_32_bit_offset_namespace_is_accounted_for(self):
        summary = AUDIT.address_space_summary(self.audit)
        self.assertEqual(summary["offset_start"], 0)
        self.assertEqual(summary["offset_end_exclusive"], 0x100000000)
        self.assertEqual(summary["last_offset"], 0xFFFFFFFF)
        self.assertEqual(summary["cartridge_end_exclusive"], 0xC00000)
        self.assertEqual(summary["cartridge_bytes"] +
                         summary["outside_cartridge_bytes"], 0x100000000)

    def test_public_inventory_totals_are_current(self):
        inventory = tomllib.loads(PROGRESS.read_text())["inventory"]
        summary = self.audit["summary"]
        mappings = {
            "audio": "audio_stream",
            "jpeg": "jpeg_image",
            "texture": "texture",
            "model": "tnmf_model",
            "animation": "tmot_animation",
            "sprite": "tspr_sprite",
            "graphics_auxiliary": "graphics_auxiliary",
            "gameplay_table": "gameplay_table",
            "roster_database": "roster_database",
        }
        self.assertEqual(inventory["rom_size"], self.audit["rom_size"])
        self.assertEqual(inventory["records"], summary["records"])
        for public_name, audit_name in mappings.items():
            self.assertEqual(inventory[f"{public_name}_records"],
                             summary["counts_by_kind"][audit_name])
            self.assertEqual(inventory[f"{public_name}_bytes"],
                             summary["stored_bytes_by_kind"][audit_name])

    def test_boot_lz_decoder_reproduces_main_image(self):
        rom = AUDIT.load_rom(ROM)
        first = self.audit["records"][0]
        decoded = AUDIT.decode_lzta(rom[first["rom_start"]:first["rom_end"]])
        main = MAIN.read_bytes()
        self.assertEqual(decoded[0x40:], main[0x40:])
        self.assertEqual(decoded[:0x40], bytes(0x40))

    def test_overlay1_boundary_findings_are_well_formed(self):
        lines = OVERLAY1_FINDINGS.read_text().splitlines()
        self.assertEqual(lines[0], "address\tkind\tfunction\tdetail")
        self.assertEqual(len(lines) - 1, 953)
        allowed_kinds = {
            "branch_outside", "branch_to_entry", "cross_branch",
            "falls_through", "in_text_data", "interior_alias", "junk_start",
            "late_start", "rejected_start", "shared_epilogue", "stray_words",
            "start_in_delay_slot",
        }
        for line in lines[1:]:
            address, kind, _function, detail = line.split("\t", 3)
            self.assertGreaterEqual(int(address, 16), 0x80090004)
            self.assertLess(int(address, 16), 0x800C75EC)
            self.assertIn(kind, allowed_kinds)
            self.assertTrue(detail)

    def test_resident_rsp_region_is_not_catalogued_as_cpu_functions(self):
        lines = RESIDENT_FINDINGS.read_text().splitlines()
        self.assertEqual(lines[0], "address\tkind\tfunction\tdetail")
        self.assertEqual(len(lines) - 1, 5)
        self.assertIn("0x38C8-byte resident RSP microcode/data region", lines[1])
        fields = [line.split("\t", 3) for line in lines[1:]]
        self.assertEqual(fields[1][:3],
                         ["0x80050EA8", "rsp_text", "rspbootTextStart"])
        self.assertEqual(fields[2][:3],
                         ["0x80050F78", "rsp_text", "gspF3DEX_fifoTextStart"])
        self.assertFalse(any(
            function["vram"] in (0x80050ED8, 0x80050EF0)
            for function in tomllib.loads(
                (ROOT / "config/us/functions_resident.toml").read_text()
            )["section"][0]["functions"]
        ))

    def test_overlay4_boundary_findings_are_well_formed(self):
        lines = OVERLAY4_FINDINGS.read_text().splitlines()
        self.assertEqual(lines[0], "address\tkind\tfunction\tdetail")
        self.assertEqual(len(lines) - 1, 349)
        allowed_kinds = {
            "branch_outside", "branch_to_entry", "cross_branch",
            "falls_through", "in_text_data", "interior_alias", "junk_start",
            "late_start", "rejected_start", "shared_epilogue", "stray_words",
            "start_in_delay_slot",
        }
        for line in lines[1:]:
            address, kind, _function, detail = line.split("\t", 3)
            self.assertGreaterEqual(int(address, 16), 0x800C77E8)
            self.assertLess(int(address, 16), 0x800E7E60)
            self.assertIn(kind, allowed_kinds)
            self.assertTrue(detail)


if __name__ == "__main__":
    unittest.main()
