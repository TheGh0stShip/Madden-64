import contextlib
import copy
import hashlib
import importlib.util
import io
import json
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FIXTURES = Path(__file__).resolve().parent / "fixtures" / "gpu_precompile_surrogate"


def _load(name):
    spec = importlib.util.spec_from_file_location(name, ROOT / "tools" / f"{name}.py")
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


BUILDER = _load("build_gpu_surrogate_dataset")
SURROGATE = _load("gpu_precompile_surrogate")

try:  # optional accelerator backend; tests skip cleanly without it
    import torch  # noqa: F401
    HAVE_TORCH = True
except ImportError:  # pragma: no cover - depends on environment
    HAVE_TORCH = False

REVISION = "a" * 40
LANE = "ido5.3:-O2:-g3:mips2"
FAMILIES = ("commute", "reorder", "temp_var", "cast")


def digest(text):
    return hashlib.sha256(text.encode()).hexdigest()


def make_row(cid, *, repo="local:madden64", func="f0", generation_index=0, family="commute",
             exact=False, prefix=0, target_words=10, lane=LANE, revision=REVISION,
             source_digest=None, structural=None):
    if exact:
        labels = {"exact": True, "first_mismatch_word": None,
                  "matching_prefix_words": target_words, "word_distance": 0,
                  "byte_distance": 0, "target_words": target_words,
                  "frame_size_delta": 0, "save_mask_xor": 0}
    else:
        distance = target_words - prefix
        labels = {"exact": False, "first_mismatch_word": prefix,
                  "matching_prefix_words": prefix, "word_distance": distance,
                  "byte_distance": distance * 2, "target_words": target_words,
                  "frame_size_delta": 0, "save_mask_xor": 0}
    row = {
        "schema": "n64-precompile-surrogate/v1",
        "candidate_id": cid,
        "project": "madden64",
        "repo": repo,
        "source_revision": revision,
        "function": {"name": f"func_{func}", "canonical_hash": digest(f"{repo}|{func}")},
        "generation_index": generation_index,
        "mutation": {"family": family, "tokens": [f"{family}_op", f"tok{generation_index % 3}"]},
        "compiler_lane": lane,
        "structural": structural if structural is not None else
        {"source_lines": 10 + generation_index % 5, "loops": generation_index % 2, "calls": 1},
        "labels": labels,
        "provenance": {"compiler": "ido5.3", "matcher": "word-compare", "verified": True,
                       "label_origin": "authoritative_cpu_compile", "compile_seconds": 0.4},
    }
    if source_digest is not None:
        row["candidate_source_digest"] = source_digest
    return row


def corpus(repos=10, funcs_per_repo=2, per_func=6):
    """Rows where every function has one exact candidate and canonical hashes are repo-unique."""
    rows = []
    for r in range(repos):
        repo = f"github.com/owner/repo{r}"
        for f in range(funcs_per_repo):
            for g in range(per_func):
                exact = g == (r + f) % per_func
                rows.append(make_row(
                    f"r{r}f{f}g{g}", repo=repo, func=f"r{r}f{f}", generation_index=g,
                    family=FAMILIES[(r + f + g) % len(FAMILIES)], exact=exact,
                    prefix=(g * 3) % 9, target_words=10,
                    source_digest=digest(f"src|r{r}f{f}g{g}")))
    return rows


def family_corpus():
    """Even repos mix commute/reorder within a function; odd repos use temp_var/cast only."""
    rows = []
    for r in range(8):
        repo = f"github.com/owner/repo{r}"
        fams = ("commute", "reorder") if r % 2 == 0 else ("temp_var", "cast")
        for f in range(2):
            for g in range(6):
                rows.append(make_row(
                    f"r{r}f{f}g{g}", repo=repo, func=f"r{r}f{f}", generation_index=g,
                    family=fams[g % 2], exact=(g == 5), prefix=g % 5,
                    source_digest=digest(f"src|r{r}f{f}g{g}")))
    return rows


def ids(rows):
    return sorted(row["candidate_id"] for row in rows)


def split_ids(splits):
    return {name: ids(splits[name]) for name in ("train", "valid", "test", "purged")}


def hashes(rows):
    return {row["function"]["canonical_hash"] for row in rows}


def write_jsonl(path, rows):
    path.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in rows))


VOLATILE_KEYS = ("train_seconds", "ranking_wall_seconds")


def strip_volatile(value):
    """Drop wall-clock timing fields, which legitimately differ between identical runs."""
    if isinstance(value, dict):
        return {k: strip_volatile(v) for k, v in value.items() if k not in VOLATILE_KEYS}
    if isinstance(value, list):
        return [strip_volatile(v) for v in value]
    return value


def quiet(func, *args, **kwargs):
    out, err = io.StringIO(), io.StringIO()
    with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
        return func(*args, **kwargs)


# --------------------------------------------------------------------------- splits


class SplitTests(unittest.TestCase):
    def test_same_seed_gives_identical_splits_all_modes(self):
        rows = corpus()
        for mode, extra in (("repo", {}), ("function", {}),
                            ("family", {"holdout_families": ["commute"]}), ("family", {})):
            with self.subTest(mode=mode, extra=extra):
                first = BUILDER.split_rows(copy.deepcopy(rows), mode, seed=7, **extra)
                second = BUILDER.split_rows(copy.deepcopy(rows), mode, seed=7, **extra)
                self.assertEqual(split_ids(first), split_ids(second))
                # input order must not matter either
                third = BUILDER.split_rows(list(reversed(copy.deepcopy(rows))), mode, seed=7, **extra)
                self.assertEqual(split_ids(first), split_ids(third))

    def test_different_seeds_can_differ(self):
        rows = corpus()
        for mode in ("repo", "function"):
            with self.subTest(mode=mode):
                seen = {json.dumps(split_ids(BUILDER.split_rows(copy.deepcopy(rows), mode, seed=s)),
                                   sort_keys=True) for s in range(12)}
                self.assertGreater(len(seen), 1)

    def test_repo_mode_is_repo_and_hash_disjoint(self):
        rows = corpus()
        splits = BUILDER.split_rows(rows, "repo", seed=3)
        parts = ("train", "valid", "test")
        self.assertEqual(sum(len(splits[p]) for p in parts) + len(splits["purged"]), len(rows))
        self.assertTrue(splits["test"])
        self.assertTrue(splits["train"])
        for i, a in enumerate(parts):
            for b in parts[i + 1:]:
                self.assertFalse({r["repo"] for r in splits[a]} & {r["repo"] for r in splits[b]})
                self.assertFalse(hashes(splits[a]) & hashes(splits[b]))
        for part in parts:
            for row in splits[part]:
                self.assertEqual(row["split"], part)

    def test_function_mode_is_hash_disjoint(self):
        splits = BUILDER.split_rows(corpus(), "function", seed=5)
        parts = ("train", "valid", "test")
        self.assertTrue(splits["test"])
        for i, a in enumerate(parts):
            for b in parts[i + 1:]:
                self.assertFalse(hashes(splits[a]) & hashes(splits[b]))

    def test_family_mode_holds_out_family_and_purges_shared_hashes(self):
        rows = family_corpus()
        splits = BUILDER.split_rows(rows, "family", seed=0, holdout_families=["commute"])
        self.assertTrue(splits["test"])
        self.assertEqual({r["mutation"]["family"] for r in splits["test"]}, {"commute"})
        for part in ("train", "valid"):
            self.assertNotIn("commute", {r["mutation"]["family"] for r in splits[part]})
        test_hashes = hashes(splits["test"])
        self.assertFalse(hashes(splits["train"]) & test_hashes)
        self.assertFalse(hashes(splits["valid"]) & test_hashes)
        # every function has rows of several families, so purging must have happened
        self.assertTrue(splits["purged"])
        for row in splits["purged"]:
            self.assertIn(row["function"]["canonical_hash"], test_hashes)
            self.assertNotEqual(row["mutation"]["family"], "commute")
        self.assertEqual(sum(len(splits[p]) for p in ("train", "valid", "test", "purged")),
                         len(rows))

    def test_unknown_mode_rejected(self):
        with self.assertRaises(ValueError):
            BUILDER.split_rows(corpus(), "random", seed=0)


# --------------------------------------------------------------------------- leakage


class LeakageTests(unittest.TestCase):
    def test_disjoint_splits_pass(self):
        a = make_row("a", func="x", source_digest=digest("a"))
        b = make_row("b", func="y", source_digest=digest("b"))
        self.assertIsNone(BUILDER.check_leakage({"train": [a], "valid": [], "test": [b]}))

    def test_canonical_hash_spanning_splits_raises(self):
        a = make_row("a", func="x")
        b = make_row("b", func="x", generation_index=1)
        with self.assertRaises(BUILDER.LeakageError):
            BUILDER.check_leakage({"train": [a], "valid": [], "test": [b]})
        with self.assertRaises(BUILDER.LeakageError):
            BUILDER.check_leakage({"train": [], "valid": [a], "test": [b]})

    def test_source_digest_spanning_splits_raises(self):
        shared = digest("same source text")
        a = make_row("a", func="x", source_digest=shared)
        b = make_row("b", func="y", source_digest=shared)
        with self.assertRaises(BUILDER.LeakageError):
            BUILDER.check_leakage({"train": [a], "valid": [], "test": [b]})

    def test_leakage_error_is_value_error(self):
        self.assertTrue(issubclass(BUILDER.LeakageError, ValueError))
        self.assertTrue(issubclass(BUILDER.ContractError, ValueError))

    def test_repo_split_with_cross_repo_hash_is_rejected_or_clean(self):
        # The same canonical target vendored in two repos must never land on both sides.
        rows = corpus(repos=6)
        for r in range(6):
            twin = make_row(f"twin{r}", repo=f"github.com/owner/repo{r}", func="shared",
                            generation_index=50)
            twin["function"]["canonical_hash"] = digest("shared-target")
            rows.append(twin)
        try:
            splits = BUILDER.split_rows(rows, "repo", seed=1)
        except BUILDER.LeakageError:
            return
        parts = ("train", "valid", "test")
        for i, a in enumerate(parts):
            for b in parts[i + 1:]:
                self.assertFalse(hashes(splits[a]) & hashes(splits[b]))


# --------------------------------------------------------------------------- contract


class ContractTests(unittest.TestCase):
    def assertRejected(self, row, bytes_root=None):
        with self.assertRaises(BUILDER.ContractError):
            BUILDER.validate_row(row, bytes_root=bytes_root)

    def test_valid_rows_accepted_and_copied(self):
        for row in (make_row("ok", exact=True), make_row("ok2", prefix=3)):
            out = BUILDER.validate_row(row)
            self.assertIsNot(out, row)
            self.assertEqual(out["candidate_id"], row["candidate_id"])
            self.assertEqual(out["labels"]["exact"], row["labels"]["exact"])

    def test_sha256_source_revision_accepted(self):
        BUILDER.validate_row(make_row("ok", revision="sha256:" + "b" * 64))

    def test_missing_labels_rejected(self):
        row = make_row("x")
        del row["labels"]
        self.assertRejected(row)

    def test_missing_required_fields_rejected(self):
        for field in ("candidate_id", "repo", "source_revision", "function", "generation_index",
                      "mutation", "compiler_lane", "provenance", "schema"):
            with self.subTest(field=field):
                row = make_row("x")
                del row[field]
                self.assertRejected(row)
        row = make_row("x")
        del row["function"]["canonical_hash"]
        self.assertRejected(row)

    def test_schema_mismatch_rejected(self):
        row = make_row("x")
        row["schema"] = "n64-precompile-surrogate/v0"
        self.assertRejected(row)

    def test_unverified_provenance_rejected(self):
        for value in (False, "true", 1, None):
            with self.subTest(verified=value):
                row = make_row("x")
                row["provenance"]["verified"] = value
                self.assertRejected(row)
        row = make_row("x")
        del row["provenance"]["verified"]
        self.assertRejected(row)
        row = make_row("x")
        row["provenance"]["label_origin"] = "surrogate_prediction"
        self.assertRejected(row)

    def test_inconsistent_labels_rejected(self):
        cases = {
            "exact_with_word_distance": ("exact", {"word_distance": 3}),
            "exact_with_byte_distance": ("exact", {"byte_distance": 1}),
            "exact_with_mismatch_word": ("exact", {"first_mismatch_word": 4}),
            "exact_short_prefix": ("exact", {"matching_prefix_words": 9}),
            "exact_frame_delta": ("exact", {"frame_size_delta": 8}),
            "exact_save_mask": ("exact", {"save_mask_xor": 1}),
            "inexact_zero_distance": ("inexact", {"word_distance": 0, "byte_distance": 0}),
            "inexact_no_mismatch": ("inexact", {"first_mismatch_word": None}),
            "inexact_prefix_disagrees": ("inexact", {"matching_prefix_words": 5}),
            "negative_distance": ("inexact", {"word_distance": -1}),
            "negative_target_words": ("inexact", {"target_words": -10}),
        }
        for name, (kind, patch) in cases.items():
            with self.subTest(case=name):
                row = make_row("x", exact=(kind == "exact"), prefix=3)
                row["labels"].update(patch)
                self.assertRejected(row)

    def test_bad_types_rejected(self):
        for patch in ({"generation_index": -1}, {"generation_index": "3"},
                      {"compiler_lane": ""}, {"mutation": {"family": "", "tokens": []}},
                      {"mutation": {"family": "commute", "tokens": "swap"}}):
            with self.subTest(patch=patch):
                row = make_row("x")
                row.update(patch)
                self.assertRejected(row)

    def test_bad_source_revision_rejected(self):
        for revision in ("main", "HEAD", "a" * 39, "g" * 40, "sha256:" + "a" * 63, "", 123):
            with self.subTest(revision=revision):
                self.assertRejected(make_row("x", revision=revision))

    def test_load_rows_reports_rejects_with_line_numbers(self):
        good = [make_row("g1", exact=True), make_row("g2", prefix=2, generation_index=1)]
        bad = make_row("b1", prefix=2, generation_index=2)
        bad["provenance"]["verified"] = False
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "rows.jsonl"
            write_jsonl(path, [good[0], bad, good[1]])
            valid, rejected = BUILDER.load_rows(path)
        self.assertEqual([r["candidate_id"] for r in valid], ["g1", "g2"])
        self.assertEqual(len(rejected), 1)
        self.assertEqual(rejected[0]["candidate_id"], "b1")
        self.assertEqual(rejected[0]["line"], 2)
        self.assertTrue(rejected[0]["reason"])


class ByteLabelTests(unittest.TestCase):
    def setUp(self):
        self.target = (FIXTURES / "target.bin").read_bytes()

    def test_mips_frame_and_save_mask(self):
        words = [0x27BDFFE0, 0xAFBF0014, 0x00000000, 0x03E00008, 0x27BD0020]
        self.assertEqual(BUILDER.mips_frame_size(words), 0x20)
        self.assertEqual(BUILDER.mips_save_mask(words), 1 << 31)
        self.assertEqual(BUILDER.mips_save_mask([0xAFBF0014, 0xAFB00010]), (1 << 31) | (1 << 16))
        # stores of non callee-saved registers (a0 = r4) do not count
        self.assertEqual(BUILDER.mips_save_mask([0xAFA40020]), 0)
        self.assertEqual(BUILDER.mips_frame_size([0x00000000, 0x03E00008]), 0)

    def test_exact_bytes(self):
        labels = BUILDER.compute_labels(self.target, (FIXTURES / "candidate_exact.bin").read_bytes())
        self.assertTrue(labels["exact"])
        self.assertIsNone(labels["first_mismatch_word"])
        self.assertEqual(labels["matching_prefix_words"], 5)
        self.assertEqual(labels["target_words"], 5)
        self.assertEqual(labels["candidate_words"], 5)
        self.assertEqual(labels["word_distance"], 0)
        self.assertEqual(labels["byte_distance"], 0)
        self.assertEqual(labels["frame_size_delta"], 0)
        self.assertEqual(labels["save_mask_xor"], 0)

    def test_frame_and_save_mask_deltas(self):
        labels = BUILDER.compute_labels(self.target, (FIXTURES / "candidate_frame.bin").read_bytes())
        self.assertFalse(labels["exact"])
        self.assertEqual(labels["first_mismatch_word"], 0)
        self.assertEqual(labels["matching_prefix_words"], 0)
        self.assertEqual(labels["frame_size_delta"], 0x28 - 0x20)
        self.assertEqual(labels["save_mask_xor"], 1 << 16)
        self.assertGreater(labels["word_distance"], 0)
        self.assertGreater(labels["byte_distance"], 0)

    def test_tail_mismatch(self):
        labels = BUILDER.compute_labels(self.target, (FIXTURES / "candidate_tail.bin").read_bytes())
        self.assertFalse(labels["exact"])
        self.assertEqual(labels["first_mismatch_word"], 3)
        self.assertEqual(labels["matching_prefix_words"], 3)
        self.assertEqual(labels["word_distance"], 1)
        self.assertEqual(labels["frame_size_delta"], 0)
        self.assertEqual(labels["save_mask_xor"], 0)

    def _byte_row(self, candidate):
        row = make_row("bytes", prefix=3, target_words=5)
        row["target_bytes_path"] = "target.bin"
        row["candidate_bytes_path"] = candidate
        return row

    def test_labels_computed_from_bytes(self):
        row = self._byte_row("candidate_frame.bin")
        del row["labels"]
        out = BUILDER.validate_row(row, bytes_root=FIXTURES)
        self.assertFalse(out["labels"]["exact"])
        self.assertEqual(out["labels"]["frame_size_delta"], 8)
        self.assertEqual(out["labels"]["save_mask_xor"], 1 << 16)

    def test_matching_supplied_labels_accepted(self):
        row = self._byte_row("candidate_tail.bin")
        row["labels"] = {k: v for k, v in BUILDER.compute_labels(
            self.target, (FIXTURES / "candidate_tail.bin").read_bytes()).items()
            if k != "candidate_words"}
        BUILDER.validate_row(row, bytes_root=FIXTURES)

    def test_disagreeing_labels_rejected(self):
        row = self._byte_row("candidate_frame.bin")
        row["labels"] = {"exact": True, "first_mismatch_word": None, "matching_prefix_words": 5,
                         "word_distance": 0, "byte_distance": 0, "target_words": 5,
                         "frame_size_delta": 0, "save_mask_xor": 0}
        with self.assertRaises(BUILDER.ContractError):
            BUILDER.validate_row(row, bytes_root=FIXTURES)
        row = self._byte_row("candidate_tail.bin")
        row["labels"] = {k: v for k, v in BUILDER.compute_labels(
            self.target, (FIXTURES / "candidate_tail.bin").read_bytes()).items()
            if k != "candidate_words"}
        row["labels"]["save_mask_xor"] = 4
        with self.assertRaises(BUILDER.ContractError):
            BUILDER.validate_row(row, bytes_root=FIXTURES)


class BuildCliTests(unittest.TestCase):
    def _build(self, rows, out, *extra):
        with tempfile.TemporaryDirectory() as tmp:
            src = Path(tmp) / "in.jsonl"
            write_jsonl(src, rows)
            return quiet(BUILDER.main, ["build", str(src), "--out", str(out), "--mode", "repo",
                                        "--seed", "4", *extra])

    def test_build_rejects_exit_nonzero_without_outputs(self):
        rows = corpus(repos=4)
        rows[3]["provenance"]["verified"] = False
        with tempfile.TemporaryDirectory() as tmp:
            out = Path(tmp) / "out"
            code = self._build(rows, out)
            self.assertNotEqual(code, 0)
            self.assertFalse((out / "train.jsonl").exists())
            self.assertFalse((out / "manifest.json").exists())

    def test_validate_subcommand_exit_codes(self):
        rows = corpus(repos=2)
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "in.jsonl"
            write_jsonl(path, rows)
            self.assertEqual(quiet(BUILDER.main, ["validate", str(path)]), 0)
            rows[0]["labels"]["word_distance"] = 0
            rows[0]["labels"]["byte_distance"] = 0
            if rows[0]["labels"]["exact"]:
                rows[0]["labels"]["first_mismatch_word"] = 1
            write_jsonl(path, rows)
            self.assertNotEqual(quiet(BUILDER.main, ["validate", str(path)]), 0)

    def test_build_outputs_deterministic_with_manifest(self):
        rows = corpus()
        with tempfile.TemporaryDirectory() as tmp:
            a, b = Path(tmp) / "a", Path(tmp) / "b"
            self.assertEqual(self._build(rows, a), 0)
            self.assertEqual(self._build(list(reversed(rows)), b), 0)
            names = ("train.jsonl", "valid.jsonl", "test.jsonl", "hard_negatives.jsonl",
                     "manifest.json")
            for name in names:
                self.assertTrue((a / name).exists(), name)
                if name != "manifest.json":
                    self.assertEqual((a / name).read_bytes(), (b / name).read_bytes(), name)
            manifest = json.loads((a / "manifest.json").read_text())
            self.assertEqual(manifest["leakage_check"], "passed")
            self.assertEqual(manifest["mode"], "repo")
            self.assertEqual(manifest["seed"], 4)
            self.assertEqual(manifest["schema"], BUILDER.SCHEMA)
            self.assertEqual(manifest["rejected"], [])
            for name, sha in manifest["files"].items():
                self.assertEqual(hashlib.sha256((a / name).read_bytes()).hexdigest(), sha, name)
            manifest_b = json.loads((b / "manifest.json").read_text())
            # the input file itself was written in a different order, so only its digest differs
            manifest.pop("input_sha256", None)
            manifest_b.pop("input_sha256", None)
            self.assertEqual(manifest, manifest_b)
            # split files are leakage-free on disk
            loaded = {}
            for part in ("train", "valid", "test"):
                text = (a / f"{part}.jsonl").read_text()
                loaded[part] = [json.loads(line) for line in text.splitlines() if line.strip()]
            BUILDER.check_leakage(loaded)
            self.assertEqual(sum(len(v) for v in loaded.values()), len(rows))


# --------------------------------------------------------------------------- hard negatives


class HardNegativeTests(unittest.TestCase):
    def test_same_pool_ordering_cap_and_exactless_pools(self):
        rows = [make_row("A-exact", func="A", generation_index=9, exact=True)]
        prefixes = {"A0": (2, 0), "A1": (7, 1), "A2": (5, 2), "A3": (7, 3), "A4": (1, 4),
                    "A5": (5, 5)}
        for cid, (prefix, gen) in prefixes.items():
            rows.append(make_row(cid, func="A", generation_index=gen, prefix=prefix))
        # A2 and A5 share prefix 5; give A5 a smaller word distance so it wins the tie
        for row in rows:
            if row["candidate_id"] == "A5":
                row["labels"]["word_distance"] = 1
        # pool without exact
        rows += [make_row(f"B{i}", func="B", generation_index=i, prefix=8) for i in range(4)]
        # same function, different compiler lane: separate pool without an exact
        rows += [make_row(f"C{i}", func="A", generation_index=i, prefix=9,
                          lane="gcc2.7.2:-O2") for i in range(3)]
        negatives = BUILDER.mine_hard_negatives(copy.deepcopy(rows), per_function=4)
        self.assertEqual([r["candidate_id"] for r in negatives], ["A1", "A3", "A5", "A2"])
        for row in negatives:
            self.assertTrue(row["hard_negative"])
            self.assertFalse(row["labels"]["exact"])
            self.assertEqual(row["compiler_lane"], LANE)
        capped = BUILDER.mine_hard_negatives(copy.deepcopy(rows), per_function=2)
        self.assertEqual([r["candidate_id"] for r in capped], ["A1", "A3"])

    def test_does_not_mutate_input(self):
        rows = [make_row("e", exact=True), make_row("n", prefix=2, generation_index=1)]
        before = copy.deepcopy(rows)
        negatives = BUILDER.mine_hard_negatives(rows, per_function=4)
        self.assertEqual(rows, before)
        self.assertEqual(len(negatives), 1)

    def test_no_exact_anywhere_yields_nothing(self):
        rows = [make_row(f"n{i}", generation_index=i, prefix=i) for i in range(5)]
        self.assertEqual(BUILDER.mine_hard_negatives(rows, per_function=4), [])


# --------------------------------------------------------------------------- metrics


def pool(func, size, exact_at, *, repo="github.com/owner/eval", family="commute"):
    return [make_row(f"{func}-{g:02d}", repo=repo, func=func, generation_index=g,
                     family=family, exact=(g == exact_at), prefix=g % 4)
            for g in range(size)]


def original_scores(rows):
    return [-float(row["generation_index"]) for row in rows]


def oracle_scores(rows):
    return [1.0 if row["labels"]["exact"] else 0.0 for row in rows]


def reversed_scores(rows):
    return [float(row["generation_index"]) for row in rows]


class MetricTests(unittest.TestCase):
    def test_single_pool_hand_computed(self):
        rows = pool("P", 10, 7)
        report = SURROGATE.evaluate(rows, {"original": original_scores(rows),
                                           "perfect": oracle_scores(rows),
                                           "reverse": reversed_scores(rows),
                                           "ties": [0.0] * len(rows)},
                                    ks=(1, 5, 8, 10))
        orig = report["orderings"]["original"]
        self.assertEqual(orig["pools_with_exact"], 1)
        self.assertAlmostEqual(orig["mean_compiles_to_first_exact"], 8.0)
        self.assertAlmostEqual(orig["exact_recall_at_k"]["1"], 0.0)
        self.assertAlmostEqual(orig["exact_recall_at_k"]["5"], 0.0)
        self.assertAlmostEqual(orig["exact_recall_at_k"]["8"], 1.0)
        self.assertAlmostEqual(orig["exact_recall_at_k"]["10"], 1.0)
        perfect = report["orderings"]["perfect"]
        self.assertAlmostEqual(perfect["mean_compiles_to_first_exact"], 1.0)
        self.assertAlmostEqual(perfect["exact_recall_at_k"]["1"], 1.0)
        self.assertAlmostEqual(report["orderings"]["reverse"]["mean_compiles_to_first_exact"], 3.0)
        # all-equal scores fall back to generation order
        self.assertAlmostEqual(report["orderings"]["ties"]["mean_compiles_to_first_exact"], 8.0)

    def test_multi_pool_mean_and_exactless_pool_excluded(self):
        rows = pool("P", 10, 7) + pool("Q", 6, 2) + pool("N", 5, None)
        report = SURROGATE.evaluate(rows, {"original": original_scores(rows),
                                           "perfect": oracle_scores(rows)},
                                    ks=(1, 3, 25))
        orig = report["orderings"]["original"]
        self.assertEqual(orig["pools_with_exact"], 2)
        self.assertAlmostEqual(orig["mean_compiles_to_first_exact"], (8 + 3) / 2)
        self.assertAlmostEqual(orig["exact_recall_at_k"]["1"], 0.0)
        self.assertAlmostEqual(orig["exact_recall_at_k"]["3"], 0.5)
        self.assertAlmostEqual(orig["exact_recall_at_k"]["25"], 1.0)
        perfect = report["orderings"]["perfect"]
        self.assertAlmostEqual(perfect["mean_compiles_to_first_exact"], 1.0)
        self.assertAlmostEqual(perfect["exact_recall_at_k"]["1"], 1.0)

    def test_pools_are_keyed_by_lane_and_revision(self):
        # same function in two lanes = two pools; scores in one lane cannot help the other
        a = pool("P", 4, 3)
        b = pool("P", 4, 0)
        for row in b:
            row["compiler_lane"] = "gcc2.7.2:-O2"
            row["candidate_id"] += "-gcc"
        rows = a + b
        report = SURROGATE.evaluate(rows, {"original": original_scores(rows)}, ks=(1,))
        orig = report["orderings"]["original"]
        self.assertEqual(orig["pools_with_exact"], 2)
        self.assertAlmostEqual(orig["mean_compiles_to_first_exact"], (4 + 1) / 2)

    def test_per_family_breakdown(self):
        rows = pool("P", 10, 7, family="commute") + pool("Q", 6, 2, family="reorder")
        report = SURROGATE.evaluate(rows, {"original": original_scores(rows)}, ks=(25,))
        fams = report["orderings"]["original"]["per_family"]
        self.assertAlmostEqual(fams["commute"]["mean_compiles_to_first_exact"], 8.0)
        self.assertAlmostEqual(fams["reorder"]["mean_compiles_to_first_exact"], 3.0)
        self.assertEqual(fams["commute"]["pools_with_exact"], 1)

    def test_misaligned_scores_rejected(self):
        rows = pool("P", 4, 1)
        with self.assertRaises(ValueError):
            SURROGATE.evaluate(rows, {"short": [0.0, 1.0]})


# --------------------------------------------------------------------------- model + gate


def honest_report(rows, model_scores, split_mode="repo"):
    orderings = {"original": original_scores(rows), "model": model_scores}
    orderings["heuristic"] = list(SURROGATE.heuristic_scores(rows))
    orderings["random"] = list(SURROGATE.random_scores(rows, 0))
    report = SURROGATE.evaluate(rows, orderings)
    report["split_mode"] = split_mode
    report["leakage_check"] = "passed"
    return report


class ModelCapTests(unittest.TestCase):
    def test_default_config_under_cap(self):
        self.assertEqual(SURROGATE.MAX_PARAMETERS, 10_000_000)
        count = SURROGATE.parameter_count(SURROGATE.DEFAULT_CONFIG)
        self.assertGreater(count, 0)
        self.assertLess(count, SURROGATE.MAX_PARAMETERS)

    def test_oversized_config_rejected(self):
        big = dict(SURROGATE.DEFAULT_CONFIG)
        big.update({"buckets": 1 << 22, "embed_dim": 64})
        self.assertGreater(SURROGATE.parameter_count(big), SURROGATE.MAX_PARAMETERS)
        rows = corpus(repos=2)
        with self.assertRaises(ValueError):
            SURROGATE.train_model(rows, config=big, backend="numpy")


class GateTests(unittest.TestCase):
    def test_no_exact_candidates_never_claims_savings(self):
        rows = pool("P", 10, None) + pool("Q", 8, None)
        report = honest_report(rows, reversed_scores(rows))
        verdict = SURROGATE.gate(report)
        self.assertIs(verdict["claimed_savings"], False)
        self.assertNotEqual(verdict["verdict"], "accept")
        self.assertTrue(verdict["reasons"])

    def test_model_not_better_than_baseline_rejected(self):
        rows = []
        for i in range(12):
            rows += pool(f"P{i}", 10, 1 + i % 3)
        # model ordering equals the original generation order: zero improvement
        report = honest_report(rows, original_scores(rows))
        verdict = SURROGATE.gate(report)
        self.assertIs(verdict["claimed_savings"], False)
        self.assertEqual(verdict["verdict"], "reject")
        # strictly worse than original
        report = honest_report(rows, reversed_scores(rows))
        self.assertIs(SURROGATE.gate(report)["claimed_savings"], False)

    def test_non_repo_split_never_claims_savings(self):
        rows = []
        for i in range(40):
            rows += pool(f"P{i}", 30, 20 + i % 9, repo=f"github.com/owner/r{i}")
        for mode in ("function", "family"):
            with self.subTest(mode=mode):
                report = honest_report(rows, oracle_scores(rows), split_mode=mode)
                verdict = SURROGATE.gate(report)
                self.assertIs(verdict["claimed_savings"], False)
                self.assertNotEqual(verdict["verdict"], "accept")

    def test_missing_or_failed_leakage_check_never_claims(self):
        rows = []
        for i in range(40):
            rows += pool(f"P{i}", 30, 20 + i % 9, repo=f"github.com/owner/r{i}")
        report = honest_report(rows, oracle_scores(rows))
        del report["leakage_check"]
        self.assertIs(SURROGATE.gate(report)["claimed_savings"], False)
        report["leakage_check"] = "failed"
        self.assertIs(SURROGATE.gate(report)["claimed_savings"], False)

    def test_clear_win_on_repo_split_can_claim(self):
        rows = []
        for i in range(40):
            rows += pool(f"P{i}", 30, 20 + i % 9, repo=f"github.com/owner/r{i}")
        verdict = SURROGATE.gate(honest_report(rows, oracle_scores(rows)))
        self.assertIs(verdict["claimed_savings"], True)
        self.assertEqual(verdict["verdict"], "accept")


class FeatureGuardTests(unittest.TestCase):
    def test_featurize_ignores_labels_provenance_and_identity(self):
        row = make_row("base", prefix=3, generation_index=2)
        base = SURROGATE.featurize(copy.deepcopy(row))
        variants = []
        v = copy.deepcopy(row)
        v["labels"] = {"exact": True, "first_mismatch_word": None, "matching_prefix_words": 10,
                       "word_distance": 0, "byte_distance": 0, "target_words": 10,
                       "frame_size_delta": 0, "save_mask_xor": 0}
        variants.append(v)
        v = copy.deepcopy(row)
        v["provenance"] = {"compiler": "other", "matcher": "x", "verified": False,
                           "label_origin": "elsewhere", "compile_seconds": 99.0}
        variants.append(v)
        v = copy.deepcopy(row)
        del v["labels"]
        del v["provenance"]
        variants.append(v)
        v = copy.deepcopy(row)
        v["function"]["name"] = "func_80001234"
        v["candidate_id"] = "renamed"
        v["split"] = "test"
        v["hard_negative"] = True
        v["target_bytes_path"] = "target.bin"
        v["candidate_bytes_path"] = "candidate_frame.bin"
        v["candidate_source_digest"] = digest("other source")
        variants.append(v)
        for variant in variants:
            self.assertEqual(SURROGATE.featurize(variant), base)

    def test_featurize_responds_to_precompile_fields(self):
        row = make_row("base", prefix=3)
        other = copy.deepcopy(row)
        other["mutation"] = {"family": "reorder", "tokens": ["move_stmt"]}
        self.assertNotEqual(SURROGATE.featurize(row), SURROGATE.featurize(other))


# --------------------------------------------------------------------------- CLI smoke


class SmokeTests(unittest.TestCase):
    def _dataset(self, tmp):
        rows = corpus(repos=10, funcs_per_repo=2, per_func=8)
        src = tmp / "rows.jsonl"
        write_jsonl(src, rows)
        data = tmp / "data"
        code = quiet(BUILDER.main, ["build", str(src), "--out", str(data), "--mode", "repo",
                                    "--seed", "2"])
        self.assertEqual(code, 0)
        return data

    def _pipeline(self, data, out, backend):
        out.mkdir(parents=True)
        model = out / "model.bin"
        self.assertEqual(quiet(SURROGATE.main, [
            "train", "--train", str(data / "train.jsonl"), "--valid", str(data / "valid.jsonl"),
            "--hard-negatives", str(data / "hard_negatives.jsonl"), "--out", str(model),
            "--backend", backend, "--seed", "11", "--epochs", "3"]), 0)
        report = out / "report.json"
        self.assertEqual(quiet(SURROGATE.main, [
            "evaluate", "--model", str(model), "--test", str(data / "test.jsonl"),
            "--manifest", str(data / "manifest.json"), "--out", str(report),
            "--random-repeats", "4", "--seed", "3"]), 0)
        ranked = out / "ranked.jsonl"
        self.assertEqual(quiet(SURROGATE.main, [
            "rank", "--model", str(model), "--candidates", str(data / "test.jsonl"),
            "--out", str(ranked)]), 0)
        artifact = SURROGATE.load_artifact(model)
        return {
            "artifact": artifact,
            "report": strip_volatile(json.loads(report.read_text())),
            "ranked": ranked.read_bytes(),
        }

    def _check_backend(self, backend):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            data = self._dataset(tmp)
            first = self._pipeline(data, tmp / "run1", backend)
            second = self._pipeline(data, tmp / "run2", backend)
            self.assertEqual(first["ranked"], second["ranked"])
            self.assertEqual(first["report"], second["report"])
            a, b = first["artifact"], second["artifact"]
            self.assertEqual(strip_volatile({k: v for k, v in a.items() if k != "state"}),
                             strip_volatile({k: v for k, v in b.items() if k != "state"}))
            self.assertEqual(sorted(a["state"]), sorted(b["state"]))
            for key in a["state"]:
                self.assertEqual(a["state"][key].tolist(), b["state"][key].tolist(), key)
            self.assertLess(a["parameters"], SURROGATE.MAX_PARAMETERS)

            report = first["report"]
            self.assertEqual(report["split_mode"], "repo")
            self.assertEqual(report["leakage_check"], "passed")
            for name in ("model", "original", "heuristic", "random"):
                self.assertIn(name, report["orderings"])
            self.assertIn(report["gate"]["claimed_savings"], (True, False))
            self.assertIn(report["gate"]["verdict"], ("accept", "reject", "not_applicable"))

            ranked = [json.loads(line) for line in first["ranked"].decode().splitlines()]
            test_rows = (data / "test.jsonl").read_text().splitlines()
            self.assertEqual(len(ranked), len(test_rows))
            self.assertEqual([r["surrogate"]["rank"] for r in ranked], list(range(1, len(ranked) + 1)))
            scores = [r["surrogate"]["score"] for r in ranked]
            self.assertEqual(scores, sorted(scores, reverse=True))
            for row in ranked:
                self.assertNotIn("labels", row)

    def test_selftest_on_synthetic_labels_never_claims_savings(self):
        # synthetic rows carry provenance.synthetic, so the gate must refuse to claim savings
        self.assertEqual(quiet(SURROGATE.main, ["selftest", "--backend", "numpy", "--seed", "0"]), 0)

    def test_numpy_pipeline_deterministic(self):
        self._check_backend("numpy")

    @unittest.skipUnless(HAVE_TORCH, "torch not installed")
    def test_torch_pipeline_deterministic(self):
        self._check_backend("torch")

    def test_predict_heads(self):
        rows = corpus(repos=3)
        artifact = SURROGATE.train_model(rows, config=None, backend="numpy")
        preds = SURROGATE.predict(artifact, rows)
        self.assertEqual(len(preds), len(rows))
        for head in ("prefix_quality", "residual", "frame_delta", "save_mask_ok", "exact_prob",
                     "score"):
            self.assertIn(head, preds[0])
        for p in preds:
            self.assertGreaterEqual(p["exact_prob"], 0.0)
            self.assertLessEqual(p["exact_prob"], 1.0)


# --------------------------------------------------------------------------- hardening regressions

SMALL_CONFIG = {"epochs": 2, "buckets": 1 << 10, "seed": 0}
PASSED_REPO_MANIFEST = {"mode": "repo", "leakage_check": "passed"}


def win_rows(n_pools):
    """Pools of 30 where the exact candidate sits late (generation 20..28) in its own repo."""
    rows = []
    for i in range(n_pools):
        rows += pool(f"P{i}", 30, 20 + i % 9, repo=f"github.com/owner/r{i}")
    return rows


class FullEvaluationLeakageTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.train = corpus(repos=3)
        cls.artifact = SURROGATE.train_model(cls.train, config=SMALL_CONFIG, backend="numpy")

    def _test_rows(self):
        rows = []
        for r in range(3):
            rows += [make_row(f"t{r}g{g}", repo=f"github.com/other/test{r}", func=f"t{r}",
                              generation_index=g, exact=(g == 2), prefix=g % 3,
                              source_digest=digest(f"test-src|{r}|{g}"))
                     for g in range(5)]
        return rows

    def _run(self, artifact, rows, manifest=PASSED_REPO_MANIFEST):
        return SURROGATE.full_evaluation(artifact, rows, dict(manifest), ks=(1, 5),
                                         random_repeats=2, seed=0)

    def test_clean_disjoint_evaluation_passes(self):
        report = self._run(self.artifact, self._test_rows())
        self.assertEqual(report["leakage_check"], "passed")
        self.assertIsNone(report["leakage_detail"])

    def test_artifact_missing_train_sets_fails_closed(self):
        for key in ("train_canonical_hashes", "train_repos", "train_source_digests"):
            with self.subTest(missing=key):
                artifact = dict(self.artifact)
                del artifact[key]
                report = self._run(artifact, self._test_rows())
                self.assertEqual(report["leakage_check"], "failed")
                self.assertIn(key, report["leakage_detail"])
                self.assertIs(report["gate"]["claimed_savings"], False)
                self.assertNotEqual(report["gate"]["verdict"], "accept")

    def test_repo_overlap_fails_in_repo_mode(self):
        rows = self._test_rows()
        # new functions and sources, but one of them lives in a repo the model trained on
        for row in rows[:5]:
            row["repo"] = self.train[0]["repo"]
        report = self._run(self.artifact, rows)
        self.assertEqual(report["leakage_check"], "failed")
        self.assertIn("repo", report["leakage_detail"])
        self.assertIs(report["gate"]["claimed_savings"], False)
        # the same rows are acceptable for a function-mode split (which can never claim anyway)
        report = self._run(self.artifact, rows, {"mode": "function", "leakage_check": "passed"})
        self.assertEqual(report["leakage_check"], "passed")
        self.assertIs(report["gate"]["claimed_savings"], False)

    def test_shared_candidate_source_digest_fails(self):
        rows = self._test_rows()
        rows[3]["candidate_source_digest"] = self.train[0]["candidate_source_digest"]
        report = self._run(self.artifact, rows)
        self.assertEqual(report["leakage_check"], "failed")
        self.assertIn("digest", report["leakage_detail"])
        self.assertIs(report["gate"]["claimed_savings"], False)


class EvaluateManifestBindingTests(unittest.TestCase):
    def _build(self, tmp, mode):
        rows = corpus(repos=10, funcs_per_repo=2, per_func=8)
        src = tmp / "rows.jsonl"
        write_jsonl(src, rows)
        data = tmp / f"data_{mode}"
        self.assertEqual(quiet(BUILDER.main, ["build", str(src), "--out", str(data), "--mode", mode,
                                              "--seed", "2"]), 0)
        model = tmp / f"model_{mode}.bin"
        self.assertEqual(quiet(SURROGATE.main, [
            "train", "--train", str(data / "train.jsonl"), "--valid", str(data / "valid.jsonl"),
            "--out", str(model), "--backend", "numpy", "--seed", "1", "--epochs", "2"]), 0)
        return data, model

    def _evaluate(self, model, test, manifest, out):
        self.assertEqual(quiet(SURROGATE.main, [
            "evaluate", "--model", str(model), "--test", str(test), "--manifest", str(manifest),
            "--out", str(out), "--random-repeats", "2"]), 0)
        return json.loads(out.read_text())

    def test_manifest_not_matching_test_file_is_unbound(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            data, model = self._build(tmp, "repo")
            bound = self._evaluate(model, data / "test.jsonl", data / "manifest.json", tmp / "r0.json")
            self.assertEqual(bound["split_mode"], "repo")
            self.assertEqual(bound["leakage_check"], "passed")
            # same rows, different bytes: the manifest no longer describes this file
            other = tmp / "other_test.jsonl"
            lines = (data / "test.jsonl").read_text().splitlines()
            other.write_text("\n".join(reversed(lines)) + "\n")
            report = self._evaluate(model, other, data / "manifest.json", tmp / "r1.json")
            self.assertEqual(report["split_mode"], "unbound")
            self.assertNotEqual(report["leakage_check"], "passed")
            self.assertIs(report["gate"]["claimed_savings"], False)
            self.assertNotEqual(report["gate"]["verdict"], "accept")

    def test_forged_manifest_mode_does_not_pass(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            data, model = self._build(tmp, "function")
            manifest_path = data / "manifest.json"
            manifest = json.loads(manifest_path.read_text())
            self.assertEqual(manifest["mode"], "function")
            manifest["mode"] = "repo"
            manifest_path.write_text(json.dumps(manifest))
            report = self._evaluate(model, data / "test.jsonl", manifest_path, tmp / "r.json")
            # a function split shares repos between train and test, so a "repo" label is caught
            self.assertEqual(report["leakage_check"], "failed")
            self.assertIs(report["gate"]["claimed_savings"], False)
            self.assertNotEqual(report["gate"]["verdict"], "accept")


class GateCriteriaHardeningTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        rows = win_rows(40)
        cls.report = honest_report(rows, oracle_scores(rows))

    def test_baseline_report_accepts(self):
        self.assertIs(SURROGATE.gate(self.report)["claimed_savings"], True)

    def test_unknown_key_rejected(self):
        with self.assertRaises(ValueError):
            SURROGATE.gate(self.report, {"min_factr": 3.0})

    def test_non_finite_or_non_numeric_thresholds_rejected(self):
        bad_values = (float("inf"), float("-inf"), float("nan"), "3", None, True)
        for key in ("min_factor", "min_relative_reduction", "recall_k", "min_pools_with_exact"):
            for value in bad_values:
                with self.subTest(key=key, value=value):
                    with self.assertRaises(ValueError):
                        SURROGATE.gate(self.report, {key: value})
        for value in ("original", [], None):
            with self.subTest(baselines=value):
                with self.assertRaises(ValueError):
                    SURROGATE.gate(self.report, {"baselines": value})

    def test_weakened_criteria_never_claim(self):
        cases = {
            "min_factor": {"min_factor": 0},
            "min_relative_reduction": {"min_relative_reduction": -1},
            "min_pools_with_exact": {"min_pools_with_exact": 1},
            "baselines": {"baselines": ["heuristic"]},
            "required_split_mode": {"required_split_mode": "function"},
        }
        for name, criteria in cases.items():
            with self.subTest(weakened=name):
                report = copy.deepcopy(self.report)
                if name == "required_split_mode":
                    report["split_mode"] = "function"
                verdict = SURROGATE.gate(report, criteria)
                self.assertIs(verdict["claimed_savings"], False)
                self.assertEqual(verdict["verdict"], "not_applicable")
                self.assertIn(name, verdict["weakened_criteria"])

    def test_stricter_criteria_can_still_accept(self):
        for criteria in ({"min_factor": 5}, {"min_factor": 5.0, "min_pools_with_exact": 20},
                         {"baselines": ["original", "random", "heuristic"], "min_relative_reduction": 0.5}):
            with self.subTest(criteria=criteria):
                verdict = SURROGATE.gate(self.report, criteria)
                self.assertIs(verdict["claimed_savings"], True)
                self.assertEqual(verdict["verdict"], "accept")
                self.assertEqual(verdict["weakened_criteria"], [])

    def test_recall_k_not_evaluated_never_claims(self):
        self.assertNotIn(7, self.report["ks"])
        verdict = SURROGATE.gate(self.report, {"recall_k": 7})
        self.assertIs(verdict["claimed_savings"], False)
        self.assertNotEqual(verdict["verdict"], "accept")


class GateMinPoolsTests(unittest.TestCase):
    def test_default_min_pools_with_exact_is_ten(self):
        self.assertEqual(SURROGATE.DEFAULT_CRITERIA["min_pools_with_exact"], 10)

    def test_clear_win_needs_ten_exact_pools(self):
        for n_pools, expect in ((1, False), (9, False), (10, True), (12, True)):
            with self.subTest(pools=n_pools):
                rows = win_rows(n_pools)
                verdict = SURROGATE.gate(honest_report(rows, oracle_scores(rows)))
                self.assertIs(verdict["claimed_savings"], expect)
                self.assertEqual(verdict["verdict"] == "accept", expect)


class StructuralLabelGuardTests(unittest.TestCase):
    def test_label_like_structural_keys_ignored(self):
        base = make_row("s", structural={"source_lines": 12, "word_distance": 5})
        other = make_row("s", structural={"source_lines": 12, "word_distance": 0})
        self.assertEqual(SURROGATE.featurize(base), SURROGATE.featurize(other))
        leaky = {"exact": 1, "matching_prefix_words": 9, "Byte_Distance": 4, "first_mismatch_word": 3,
                 "frame_size_delta": 8, "save_mask_xor": 1, "my_prefix_len": 7, "is_exact_guess": 1}
        for key, value in leaky.items():
            with self.subTest(key=key):
                with_key = make_row("s", structural={"source_lines": 12, key: value})
                zeroed = make_row("s", structural={"source_lines": 12, key: 0})
                self.assertEqual(SURROGATE.featurize(with_key), SURROGATE.featurize(zeroed))

    def test_legitimate_structural_keys_still_matter(self):
        a = make_row("s", structural={"source_lines": 5, "word_distance": 5})
        b = make_row("s", structural={"source_lines": 50, "word_distance": 5})
        self.assertNotEqual(SURROGATE.featurize(a), SURROGATE.featurize(b))


class SyntheticDetectionTests(unittest.TestCase):
    def test_synthetic_marker_case_insensitive(self):
        for field in ("compiler", "matcher"):
            for value in ("Synthetic-Fixture", "SYNTHETIC-FIXTURE", "synthetic-fixture"):
                with self.subTest(field=field, value=value):
                    row = make_row("x")
                    row["provenance"][field] = value
                    self.assertTrue(SURROGATE.is_synthetic(row))
        row = make_row("x")
        row["provenance"]["synthetic"] = True
        self.assertTrue(SURROGATE.is_synthetic(row))
        self.assertFalse(SURROGATE.is_synthetic(make_row("x")))

    def test_synthetic_rows_block_claim_in_full_evaluation(self):
        train = corpus(repos=3)
        artifact = SURROGATE.train_model(train, config=SMALL_CONFIG, backend="numpy")
        rows = win_rows(12)
        for row in rows:
            row["provenance"]["matcher"] = "Synthetic-Fixture"
        report = SURROGATE.full_evaluation(artifact, rows, dict(PASSED_REPO_MANIFEST), ks=(150,),
                                           random_repeats=2)
        self.assertEqual(report["synthetic_rows"], len(rows))
        self.assertIs(report["gate"]["claimed_savings"], False)


class NumpyCapTests(unittest.TestCase):
    def test_numpy_parameter_cap_enforced(self):
        config = dict(SURROGATE.DEFAULT_CONFIG)
        config.update({"buckets": 2_000_000, "embed_dim": 1, "hidden": 8, "trunk": 8})
        # under the torch cap, so only the numpy-specific check can reject it
        self.assertLess(SURROGATE.parameter_count(config), SURROGATE.MAX_PARAMETERS)
        self.assertGreaterEqual(SURROGATE.numpy_parameter_count(config), SURROGATE.MAX_PARAMETERS)
        with self.assertRaises(ValueError):
            SURROGATE.train_model(corpus(repos=1), config=config, backend="numpy")


class RankCliTests(unittest.TestCase):
    def _model(self, tmp):
        model = tmp / "model.bin"
        artifact = SURROGATE.train_model(corpus(repos=2), config=SMALL_CONFIG, backend="numpy")
        SURROGATE.save_artifact(artifact, model)
        return model

    def test_negative_top_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            model = self._model(tmp)
            cands = tmp / "cands.jsonl"
            write_jsonl(cands, corpus(repos=1))
            with self.assertRaises(SystemExit):
                quiet(SURROGATE.main, ["rank", "--model", str(model), "--candidates", str(cands),
                                       "--out", str(tmp / "ranked.jsonl"), "--top", "-1"])

    def test_none_generation_index_does_not_crash(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            model = self._model(tmp)
            rows = corpus(repos=1)
            for row in rows[::2]:
                row["generation_index"] = None
            rows[1]["generation_index"] = "7"
            cands = tmp / "cands.jsonl"
            write_jsonl(cands, rows)
            out = tmp / "ranked.jsonl"
            self.assertEqual(quiet(SURROGATE.main, ["rank", "--model", str(model), "--candidates",
                                                    str(cands), "--out", str(out), "--top", "5"]), 0)
            ranked = [json.loads(line) for line in out.read_text().splitlines()]
            self.assertEqual([r["surrogate"]["rank"] for r in ranked], [1, 2, 3, 4, 5])


class ArtifactDeterminismTests(unittest.TestCase):
    def test_numpy_cli_training_is_byte_identical(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            train = tmp / "train.jsonl"
            write_jsonl(train, corpus(repos=3))
            blobs = []
            for name in ("a.bin", "b.bin"):
                out = tmp / name
                self.assertEqual(quiet(SURROGATE.main, [
                    "train", "--train", str(train), "--out", str(out), "--backend", "numpy",
                    "--seed", "5", "--epochs", "2"]), 0)
                blobs.append(out.read_bytes())
            self.assertEqual(blobs[0], blobs[1])
            self.assertNotIn("train_seconds", SURROGATE.load_artifact(tmp / "a.bin"))


# --------------------------------------------------------------------------- repository hygiene


class DeliverableHygieneTests(unittest.TestCase):
    def test_deliverables_contain_no_blocked_words(self):
        blocked = ("cl" + "aude", "co" + "dex", "anth" + "ropic", "chat" + "gpt", "l" + "lm")
        files = [ROOT / "tools" / "build_gpu_surrogate_dataset.py",
                 ROOT / "tools" / "gpu_precompile_surrogate.py",
                 Path(__file__).resolve()]
        doc = ROOT / "docs" / "gpu_precompile_surrogate.md"
        if doc.exists():
            files.append(doc)
        files += sorted(p for p in FIXTURES.rglob("*") if p.is_file())
        violations = []
        for path in files:
            text = path.read_bytes().decode("utf-8", errors="ignore").lower()
            hits = [word for word in blocked if word in text]
            if hits:
                violations.append((path.name, hits))
        self.assertEqual(violations, [])


if __name__ == "__main__":
    unittest.main()
