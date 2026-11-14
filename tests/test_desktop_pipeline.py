import hashlib
import importlib.util
import json
import tempfile
import tarfile
import unittest
import io
from pathlib import Path


ROOT = Path(__file__).parents[1]


def load(name):
    spec = importlib.util.spec_from_file_location(name, ROOT / "tools" / f"{name}.py")
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


CORPUS = load("compiler_corpus")
ROUTER = load("residual_router")
CAMPAIGN = load("desktop_campaign")
INGEST = load("integrate_desktop_results")
RETRIEVAL = load("gpu_function_retrieval")
CATALOG = load("build_function_research_catalog")
EXTRACT = load("extract_desktop_artifact")


class CompilerCorpusTests(unittest.TestCase):
    def test_features_are_deterministic_and_instruction_sensitive(self):
        addu = bytes.fromhex("0085202103e0000800000000")
        subu = bytes.fromhex("0085202303e0000800000000")
        self.assertEqual(CORPUS.features(addu), CORPUS.features(addu))
        self.assertNotEqual(CORPUS.features(addu), CORPUS.features(subu))

    def test_project_split_has_no_leakage(self):
        rows = [{"project": p, "compiler_family": "gcc"} for p in ("a", "a", "b", "c")]
        train, test = CORPUS.split_projects(rows, 7, .34)
        self.assertFalse({r["project"] for r in train} & {r["project"] for r in test})

    def test_project_split_preserves_all_families_in_training(self):
        rows = [
            {"project": "mixed", "compiler_family": "gcc"},
            {"project": "mixed", "compiler_family": "ido"},
            {"project": "gcc-only", "compiler_family": "gcc"},
            {"project": "ido-only", "compiler_family": "ido"},
            {"project": "sn-only", "compiler_family": "sn-gcc"},
            {"project": "mixed-sn", "compiler_family": "sn-gcc"},
            {"project": "mixed-sn", "compiler_family": "gcc"},
        ]
        train, test = CORPUS.split_projects(rows, 19, .34)
        self.assertEqual({row["compiler_family"] for row in train}, {"gcc", "ido", "sn-gcc"})
        self.assertEqual({row["compiler_family"] for row in test}, {"gcc", "ido", "sn-gcc"})

    def test_centroid_classifier_prefers_identical_family(self):
        left = {"compiler_family": "gcc", "_features": {1: 1.0}}
        right = {"compiler_family": "ido", "_features": {2: 1.0}}
        model = CORPUS.train([left, right])
        self.assertEqual(CORPUS.predict(model, {1: 1.0})[0][0], "gcc")

    def test_load_rows_resolves_each_corpus_relative_to_itself(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for name, word in (("left", "00000000"), ("right", "03e00008")):
                directory = root / name
                directory.mkdir()
                blob = bytes.fromhex(word)
                (directory / "text.bin").write_bytes(blob)
                row = {"project": name, "function": name, "compiler_family": "gcc",
                       "compiler_version": "test", "flags": [],
                       "text_sha256": hashlib.sha256(blob).hexdigest(),
                       "text_path": "text.bin"}
                (directory / "corpus.jsonl").write_text(json.dumps(row) + "\n")
            rows = (CORPUS.load_rows(root / "left" / "corpus.jsonl") +
                    CORPUS.load_rows(root / "right" / "corpus.jsonl"))
            self.assertEqual([row["project"] for row in rows], ["left", "right"])


class ResidualRouterTests(unittest.TestCase):
    def test_residual_separates_register_and_immediate(self):
        target = bytes.fromhex("0085202124020001")
        register = bytes.fromhex("0086202124020001")
        immediate = bytes.fromhex("0085202124020002")
        self.assertGreater(ROUTER.features(target, register)["kind:register"], 0)
        self.assertGreater(ROUTER.features(target, immediate)["kind:immediate"], 0)

    def test_router_probabilities_normalize(self):
        model = {"classes": {"decl": 2, "order": 2}, "totals": {"decl": 2, "order": 2},
                 "counts": {"decl": {"kind:register": 2}, "order": {"kind:opcode": 2}},
                 "vocabulary": ["kind:register", "kind:opcode"]}
        choices = ROUTER.predict(model, ROUTER.Counter({"kind:register": 1}))
        self.assertAlmostEqual(sum(value for _, value in choices), 1.0)
        self.assertEqual(choices[0][0], "decl")


class ContextRetrievalTests(unittest.TestCase):
    def test_context_adds_cfg_and_callee_evidence(self):
        # jal 0x80001000; beqz v0 backwards; nop
        blob = bytes.fromhex("0c0004001040ffff00000000")
        entry = {"vram": "0x80000000", "size": 12, "module": "resident",
                 "boundary_confidence": "verified"}
        callee = {0x80001000: {"size": 32, "module": "resident"}}
        self.assertNotEqual(RETRIEVAL.feature_indices(blob),
                            RETRIEVAL.contextual_features(entry, blob, callee))

    def test_catalogue_rejects_function_specific_rewriters(self):
        source = "src/overlays/overlay2/return_zero.c"
        self.assertTrue(CATALOG.genuine_c(source, "--normalizer-enable-KMC-LID-PAIR -O2"))
        self.assertFalse(CATALOG.genuine_c(source, "--normalizer-enable-KMC-SPECIAL -O2"))


class IngestionTests(unittest.TestCase):
    def test_confined_rejects_escape(self):
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaises(ValueError):
                INGEST.confined(Path(tmp), "../escape")

    def test_artifact_hashes_and_provenance(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "good.c").write_text("int good(void) { return 1; }\n")
            (root / "results.jsonl").write_text("{}\n")
            files = {name: hashlib.sha256((root / name).read_bytes()).hexdigest()
                     for name in ("good.c", "results.jsonl")}
            (root / "artifact-manifest.json").write_text(json.dumps(
                {"version": 1, "files": files, "results": "results.jsonl"}))
            self.assertEqual(INGEST.verify_artifact(root), [{}])
            INGEST.provenance(root / "good.c", "-O2")
            (root / "bad.c").write_text('asm("nop");\n')
            with self.assertRaises(ValueError):
                INGEST.provenance(root / "bad.c", "-O2")

    def test_manifest_merge_replaces_contained_fragments_and_rejects_partial(self):
        rows = ["# header", "0x100\t0x8\ta.c\t-O2\tx", "0x108\t0x8\tb.c\t-O2\ty"]
        merged = INGEST.merge_manifest(rows, ["0x100\t0x10\twhole.c\t-O2\tz"])
        self.assertEqual(merged, ["# header", "0x100\t0x10\twhole.c\t-O2\tz"])
        with self.assertRaises(ValueError):
            INGEST.merge_manifest(rows, ["0x104\t0x8\tpartial.c\t-O2\tz"])

    def test_interrupted_transaction_recovery_restores_pre_state(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            destination = root / "config" / "unit.tsv"
            destination.parent.mkdir(parents=True)
            destination.write_text("before\n")
            transaction = root / INGEST.TRANSACTION_ROOT
            backup = transaction / "backup"
            backup.mkdir(parents=True)
            (backup / "000000").write_text("before\n")
            destination.write_text("partially-published\n")
            journal = {"version": 1, "state": "prepared", "files": [{
                "path": "config/unit.tsv", "slot": "000000", "existed": True,
                "backup_sha256": hashlib.sha256(b"before\n").hexdigest()}]}
            (transaction / "journal.json").write_text(json.dumps(journal))
            self.assertTrue(INGEST.recover_transaction(root))
            self.assertEqual(destination.read_text(), "before\n")
            self.assertFalse(transaction.exists())


class CampaignTests(unittest.TestCase):
    def test_validation_rejects_cycle(self):
        config = {"version": 1, "campaign": "x", "timeout_seconds": 60,
                  "lanes": [
                      {"name": "a", "resource": "cpu", "command": ["true"],
                       "inputs": [], "outputs": [], "depends_on": ["b"]},
                      {"name": "b", "resource": "cpu", "command": ["true"],
                       "inputs": [], "outputs": [], "depends_on": ["a"]}]}
        with self.assertRaises(ValueError):
            CAMPAIGN.validate(config)

    def test_digest_is_content_and_path_sensitive(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "a").write_text("x")
            first = CAMPAIGN.digest(root)
            (root / "b").write_text("x")
            self.assertNotEqual(first, CAMPAIGN.digest(root))

    def test_safe_artifact_extractor_rejects_traversal(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); archive = root / "bad.tar.gz"
            with tarfile.open(archive, "w:gz") as stream:
                info = tarfile.TarInfo("../escape"); payload = b"bad"
                info.size = len(payload); stream.addfile(info, io.BytesIO(payload))
            with self.assertRaises(ValueError):
                EXTRACT.extract(archive, root / "out", 1024)

    def test_campaign_archive_is_byte_deterministic(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); state = root / "state.json"; result = root / "result.txt"
            state.write_text('{}\n'); result.write_text("answer\n")
            config = {"campaign": "deterministic", "lanes": [{"outputs": ["result.txt"]}]}
            first, second = root / "first.tar.gz", root / "second.tar.gz"
            CAMPAIGN.archive_results(root, config, state, first)
            CAMPAIGN.archive_results(root, config, state, second)
            self.assertEqual(first.read_bytes(), second.read_bytes())


if __name__ == "__main__":
    unittest.main()
