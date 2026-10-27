import hashlib
import importlib.util
import json
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "extract_assets", ROOT / "tools/extract_assets.py"
)
EXTRACT = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = EXTRACT
SPEC.loader.exec_module(EXTRACT)
ROM = ROOT / "Madden Football 64 (USA).z64"
MAIN = ROOT / "build/us/survey/main_segment.bin"


@unittest.skipUnless(ROM.is_file() and MAIN.is_file(), "requires verified ROM survey")
class AssetExtractionTests(unittest.TestCase):
    def test_every_archive_record_is_losslessly_extracted(self):
        rom = EXTRACT.AUDIT.load_rom(ROM)
        with tempfile.TemporaryDirectory() as temporary:
            output = Path(temporary)
            manifest = EXTRACT.extract_all(rom, MAIN.read_bytes(), output)
            self.assertEqual(manifest["format"], "madden64-expanded-records/v1")
            self.assertEqual(manifest["archive_slots"], 15)
            self.assertEqual(manifest["records"], 1353)
            self.assertEqual(manifest["logical_stored_bytes"], 12555560)
            self.assertEqual(manifest["expanded_bytes"], 14918923)
            self.assertEqual(json.loads((output / "manifest.json").read_text()),
                             manifest)
            paths = [entry["path"] for entry in manifest["entries"]]
            self.assertEqual(len(paths), len(set(paths)))
            for entry in manifest["entries"]:
                payload = (output / entry["path"]).read_bytes()
                self.assertEqual(len(payload), entry["expanded_size"])
                self.assertEqual(hashlib.sha256(payload).hexdigest(),
                                 entry["expanded_sha256"])

    def test_record_paths_preserve_archive_and_format_identity(self):
        record = EXTRACT.AUDIT.Record(
            3, 17, 0, 4, 4, 4, 0, 4, False, "raw", "tnmf_model"
        )
        self.assertEqual(EXTRACT.relative_record_path(record).as_posix(),
                         "archive_03/record_0017.tnmf")


if __name__ == "__main__":
    unittest.main()
