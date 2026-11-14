import importlib.util
import struct
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "compiler_fingerprint", ROOT / "tools/compiler_fingerprint.py"
)
MOD = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MOD)


def blob(*values):
    return struct.pack(f">{len(values)}I", *values)


def i_type(opcode, rs, rt, immediate):
    return opcode << 26 | rs << 21 | rt << 16 | (immediate & 0xFFFF)


class CompilerFingerprintTests(unittest.TestCase):
    def test_frame_save_mask_and_delay_slots(self):
        text = blob(
            i_type(9, 29, 29, -0x30),
            i_type(43, 29, 31, 0x2C),
            i_type(43, 29, 16, 0x28),
            i_type(61, 29, 20, 0x20),
            i_type(4, 4, 0, 2),
            i_type(9, 5, 5, 1),
            0x0C000000,
            0,
            0x03E00008,
            0,
        )
        result = MOD.fingerprint(text)
        self.assertEqual(result["frame_size"], 0x30)
        self.assertEqual(result["gpr_save_mask"], (1 << 31) | (1 << 16))
        self.assertEqual(result["fpr_save_mask"], 1 << 20)
        self.assertEqual(result["calls"], 1)
        self.assertEqual(result["control_transfers"], 3)
        self.assertEqual(result["filled_delay_slots"], 1)
        self.assertEqual(result["nop_delay_slots"], 2)

    def test_exact_pair_has_no_residual(self):
        text = blob(i_type(9, 29, 29, -0x18), 0x03E00008, 0)
        result = MOD.compare(text, text)
        self.assertTrue(result["exact"])
        self.assertIsNone(result["first_mismatch_word"])
        self.assertEqual(result["word_distance"], 0)
        self.assertEqual(result["gpr_save_mask_xor"], 0)
        self.assertEqual(result["fpr_save_mask_xor"], 0)

    def test_pair_labels_prefix_frame_and_save_changes(self):
        target = blob(
            i_type(9, 29, 29, -0x20),
            i_type(43, 29, 31, 0x1C),
            0x03E00008,
            0,
        )
        candidate = blob(
            i_type(9, 29, 29, -0x30),
            i_type(43, 29, 16, 0x28),
            0x03E00008,
            0,
        )
        result = MOD.compare(target, candidate)
        self.assertFalse(result["exact"])
        self.assertEqual(result["first_mismatch_word"], 0)
        self.assertEqual(result["matching_prefix_words"], 0)
        self.assertEqual(result["word_distance"], 2)
        self.assertEqual(result["frame_size_delta"], 0x10)
        self.assertEqual(result["gpr_save_mask_xor"], (1 << 31) | (1 << 16))

    def test_unaligned_text_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "word aligned"):
            MOD.fingerprint(b"abc")

    def test_batch_labels_authoritative_bytes_and_provenance(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = blob(i_type(9, 29, 29, -0x18), 0x03E00008, 0)
            candidate = blob(i_type(9, 29, 29, -0x20), 0x03E00008, 0)
            (root / "target.bin").write_bytes(target)
            (root / "candidate.bin").write_bytes(candidate)
            row = {
                "source_project": "fixture", "source_revision": "deadbeef",
                "source_function": "f", "compiler_lane": "kmc+asn64",
                "mutation_family": "frame", "mutation_tokens": ["frame:+8"],
                "target_path": "target.bin", "candidate_path": "candidate.bin",
            }
            result = MOD.label_batch([row], root)[0]
            self.assertFalse(result["authoritative_label"]["exact"])
            self.assertEqual(result["authoritative_label"]["frame_size_delta"], 8)
            self.assertEqual(result["label_provenance"]["kind"],
                             "compiler-output-byte-compare")

    def test_batch_rejects_missing_metadata_and_path_escape(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with self.assertRaisesRegex(ValueError, "missing fields"):
                MOD.label_batch([{}], root)
            row = {key: "x" for key in MOD.REQUIRED_BATCH_FIELDS}
            row["mutation_tokens"] = ["x"]
            row["target_path"] = "../outside.bin"
            row["candidate_path"] = "candidate.bin"
            with self.assertRaisesRegex(ValueError, "escapes root"):
                MOD.label_batch([row], root)


if __name__ == "__main__":
    unittest.main()
