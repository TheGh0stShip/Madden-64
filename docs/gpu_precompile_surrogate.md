# GPU-assisted pre-compile pruning surrogate

## Purpose

A permuter run generates far more C mutation candidates than the CPU compile
workers can process. This surrogate predicts, **before compiling**, which of the
already-generated candidates are most likely to compile to the target bytes, so
that the limited authoritative CPU compile slots are spent on the most
promising candidates first.

What the surrogate is, and is not:

- It is a **prioritizer** over candidates that the permuter has already
  generated. It only reorders (and optionally truncates) a pending queue.
- The GPU **never emits code bytes**, never rewrites or patches assembler
  output, and never edits candidate C source. It is not a compiler and not a
  matcher.
- The legacy CPU compiler followed by the exact byte matcher is the **only
  proof of exactness**. A high predicted exact probability is not evidence of a
  match; it is only a reason to compile that candidate sooner.
- Pruning is a scheduling decision. A candidate that was ranked low has not
  "failed"; it simply has not been compiled yet.

Two tools implement the pipeline:

| Tool | Role |
| --- | --- |
| `tools/build_gpu_surrogate_dataset.py` | Validates rows against the row contract, computes labels from byte files, builds leakage-checked splits, mines hard negatives, writes a manifest. |
| `tools/gpu_precompile_surrogate.py` | Featurizes rows, trains the surrogate, evaluates it against baselines, applies the gate, and ranks pending candidates. |

## Row contract `n64-precompile-surrogate/v1`

Input is JSONL: one JSON object per line. Each row describes one candidate that
was compiled by the authoritative CPU compiler and compared by the exact
matcher (training/evaluation data), or one pending candidate (ranking input;
labels and provenance are not used for ranking).

| Field | Type | Required | Meaning |
| --- | --- | --- | --- |
| `schema` | str | yes | Must equal `n64-precompile-surrogate/v1`. |
| `candidate_id` | str | yes | Unique identifier of the candidate. |
| `project` | str | yes | Project name, e.g. `madden64`. |
| `repo` | str | yes | Repository identity, e.g. `github.com/owner/name` or `local:madden64`. Grouping key for repo-disjoint splits. |
| `source_revision` | str | yes | Immutable revision: a 40-hex git commit id, or `sha256:<64 hex>`. |
| `function.name` | str | yes | Function symbol, e.g. `func_800049F0`. Never used as a feature. |
| `function.canonical_hash` | str | yes | 64-hex SHA-256 of the canonicalized target function. Grouping key for function-identity splits and leakage checks. |
| `function.address` | str | no | Optional address string. |
| `generation_index` | int >= 0 | yes | Position in the permuter's original generation order within its pool. Used for the "original order" baseline and for tie-breaking. |
| `mutation.family` | str (non-empty) | yes | Mutation family, e.g. `commute`. Used for family holdout and per-family reporting. |
| `mutation.tokens` | list[str] | yes | Ordered mutation operator tokens applied to produce this candidate. |
| `compiler_lane` | str (non-empty) | yes | Compiler identity and flags, e.g. `ido5.3:-O2:-g3:mips2` or the project's GCC lane string. |
| `structural` | dict[str, number] | no | Pre-compile structural counts of the candidate source (e.g. `source_lines`, `loops`, `calls`). Must not contain anything derived from compiled output. |
| `candidate_source_digest` | str | no | SHA-256 (64 hex) of the candidate source text. Used for leakage checks. |
| `target_bytes_path` | str | no | Target function bytes, relative to `--bytes-root`. |
| `candidate_bytes_path` | str | no | Candidate compiled bytes, relative to `--bytes-root`. |
| `labels` | dict | yes, unless both byte paths are given | See label table below. Computed from bytes when both byte paths are given. |
| `provenance.compiler` | str | yes | Compiler that produced the candidate bytes. |
| `provenance.matcher` | str | yes | Matcher that produced the labels. |
| `provenance.verified` | bool | yes | Must be literally `true`. |
| `provenance.label_origin` | str | yes | Must equal `authoritative_cpu_compile`. |
| `provenance.compile_seconds` | number >= 0 | no | Wall time of the authoritative compile. |

Label fields:

| Label | Type | Meaning |
| --- | --- | --- |
| `exact` | bool | Candidate bytes equal target bytes. |
| `first_mismatch_word` | int or null | Index of the first differing 32-bit word; `null` iff `exact`. |
| `matching_prefix_words` | int >= 0 | Number of leading words that match. |
| `word_distance` | int >= 0 | Number of differing words. |
| `byte_distance` | int >= 0 | Number of differing bytes. |
| `target_words` | int >= 0 | Target length in 32-bit words. |
| `frame_size_delta` | int | Candidate frame size minus target frame size. |
| `save_mask_xor` | int >= 0 | XOR of candidate and target callee-saved/`ra` save masks. |

### Rejection rules

A row is rejected (`ContractError`) when any of the following holds:

- a required field is missing, or any field has the wrong type;
- `schema` is not `n64-precompile-surrogate/v1`;
- `provenance.verified` is not literally `true` (truthy strings or `1` are
  rejected);
- `provenance.label_origin` is not `authoritative_cpu_compile`;
- label inconsistency:
  - `exact` must hold exactly when `first_mismatch_word` is `null`, and exactly
    when `word_distance == 0` and `byte_distance == 0`;
  - if `exact`, then `matching_prefix_words == target_words`,
    `frame_size_delta == 0`, and `save_mask_xor == 0`;
  - if not `exact`, then `matching_prefix_words == first_mismatch_word`;
- any count is negative;
- both byte paths and `labels` are supplied, and the labels recomputed from the
  bytes disagree with the supplied labels.

`validate` and `build` report rejected rows as
`{"line": n, "candidate_id": ..., "reason": ...}`. `build` refuses to write any
output if a row is rejected, unless `--allow-rejects` is given.

## Labels from bytes

When `target_bytes_path` and `candidate_bytes_path` are both present, labels
are computed from the files under `--bytes-root` (`compute_labels`):

- Both byte strings are read as big-endian 32-bit MIPS words.
- `first_mismatch_word`, `matching_prefix_words`, `word_distance`, and
  `byte_distance` come from a positional comparison; length differences count
  as mismatches. `candidate_words` is also reported.
- Both extractors scan only the **prologue**: at most the first 32 words,
  stopping after the first branch-like instruction and its delay slot.
- **Frame size** (`mips_frame_size`): the first stack allocation
  `addiu sp, sp, -N` (`word & 0xFFFF0000 == 0x27BD0000` with a negative 16-bit
  immediate) gives the frame size `N`; 0 if none. `frame_size_delta` is
  `candidate_frame - target_frame`.
- **Save mask** (`mips_save_mask`): stores of the form `sw rt, off(sp)`
  (`word & 0xFFE00000 == 0xAFA00000`, `rt = (word >> 16) & 31`). For `rt` in
  the callee-saved set (`s0`-`s7` = 16..23, `fp`/`s8` = 30, `ra` = 31) bit `rt`
  is set in the mask. `save_mask_xor` is the XOR of the candidate and target
  masks; 0 means the same registers are saved.

These labels are derived only from bytes that the authoritative CPU compiler
produced. They are training targets, never inputs to the ranker.

## Splits

`split_rows` / `build --mode` produce `train`, `valid`, and `test` splits plus a
`purged` list. Split assignment is deterministic: it hashes the group key with
the seed (no Python `hash()` and no global random state), so the same input and
seed always produce the same split. Every output row carries `"split": <name>`.

| Mode | Group key | Use |
| --- | --- | --- |
| `repo` | `repo` | Repo-disjoint: every repository is entirely in one split. This is the mode used for the gating decision. |
| `function` | `function.canonical_hash` | Function-identity-disjoint: the same canonicalized function (even under a different name, address, or revision) never appears in two splits. |
| `family` | `mutation.family` | Mutation-family holdout: the holdout families (`--holdout-families a,b`, or a deterministic hashed choice by default) go to `test`; the remaining rows are split into train/valid by `function.canonical_hash`, and any train/valid row whose `function.canonical_hash` also appears in `test` is **purged** and recorded in the `purged` list. The resolved holdout families are written to the manifest. |

`--test-fraction` (default 0.2) and `--valid-fraction` (default 0.1) set the
approximate group fractions.

### Leakage rejection

After splitting, `check_leakage` always runs. It raises `LeakageError` if any
`function.canonical_hash` or any `candidate_source_digest` appears in more than
one of `train`, `valid`, `test`. The manifest records
`"leakage_check": "passed"` only after this check succeeds; a leaking split is
never written.

### Hard-negative mining

`mine_hard_negatives` (`build --hard-negatives K`, default 4) selects
near-misses to sharpen the decision boundary. Rows are pooled by
`(source_revision, function.canonical_hash, compiler_lane)`. For each pool that
contains at least one exact row, up to `K` non-exact rows from the same pool
are chosen, ordered by
`(-matching_prefix_words, word_distance, generation_index, candidate_id)`.
They are written to `hard_negatives.jsonl` as copies tagged
`"hard_negative": true`.

### Build outputs

`build` writes into `--out`:

- `train.jsonl`, `valid.jsonl`, `test.jsonl`, `hard_negatives.jsonl`;
- `manifest.json`: schema, mode, seed, per-split counts, SHA-256 of each split
  file, rejected rows, purged count, `leakage_check`, and the number of
  canonical hashes per split.

## Model

Features (`featurize`) use **only pre-compile fields**: `mutation.tokens`,
`mutation.family`, `compiler_lane`, and `structural`. Labels, provenance,
function name, and address are never features.

- **Mutation tokens, family, compiler lane**: hashed into a fixed number of
  buckets (default 65,536) and pooled with a weighted `EmbeddingBag`
  (`mode="sum"`, default embedding width 64). Hashing the lane lets one model
  serve several compiler lanes.
- **Structural features**: a small dense vector of numeric pre-compile counts,
  log-scaled.
- **Shared trunk**: a small MLP (default hidden 128, trunk 64) over the pooled
  embedding and the dense vector.
- **Five heads** (output name in parentheses):

| Head | Target | Output |
| --- | --- | --- |
| prefix quality (`prefix_quality`) | `matching_prefix_words / target_words` | sigmoid |
| normalized residual distance (`residual`) | `min(1, word_distance / target_words)` | sigmoid |
| frame-size delta (`frame_delta`) | signed `log1p(abs(frame_size_delta)) / 4` | linear |
| save-mask compatibility (`save_mask_ok`) | P(`save_mask_xor == 0`) | sigmoid |
| exact probability (`exact_prob`) | P(`exact`) | sigmoid |

The ranking `score` is a weighted combination of the head outputs (default
weights: exact 1.0, prefix 0.5, residual 0.5, save 0.25, frame 0.1), led by
exact probability, with the auxiliary heads supplying dense signal where exacts
are rare. Rows listed in a `--hard-negatives` file get extra training weight
(default 2.0). Defaults can be overridden with `train --config CONFIG.json`.

Size and hardware:

- The parameter count is capped at `MAX_PARAMETERS = 10_000_000`; the default
  configuration is about 4.2M parameters.
- The model is designed to train and rank on a single RTX 2070 (8 GB).
  `--device` accepts `auto`, `cpu`, or `cuda[:N]` for the torch backend.
- A numpy CPU backend (`--backend numpy`; a linear multi-head model, not the
  GPU network) exists **for tests and smoke runs only**. `selftest` uses it by
  default, and `--backend auto` falls back to it when PyTorch is not
  installed. Do not use numpy-backend results to decide whether to enable the
  surrogate.

## Evaluation

`evaluate` replays the test split, which already contains authoritative labels,
under several orderings of each candidate pool and measures how quickly each
ordering reaches an exact match.

A pool is the set of test rows sharing
`(repo, source_revision, function.canonical_hash, compiler_lane)`. Within each
ordering, ties break on `generation_index`, then `candidate_id`.

Baselines:

- **Original generation order** (`original`): sort by `generation_index`.
- **Seeded random** (`random`): deterministic seeded permutations, averaged
  over `--random-repeats` repeats (default 32) to reduce single-shuffle noise.
- **Label-free heuristic** (`heuristic`): smaller edits first (fewer, simpler
  mutation tokens), using only pre-compile fields.

Metrics, reported per ordering (`model`, `original`, `random`, `heuristic`),
overall and per mutation family:

- **Top-k exact recall** at k = 25, 50, 150, 500 (`--ks`, comma-separated):
  fraction of pools with an exact whose first exact lies within the first k
  compiles; also the fraction of all exact candidates found within k.
- **Mean (and median) compiles-to-first-exact** over pools that contain an
  exact, plus the number of pools without any exact and the compiles that
  would be spent exhausting them.
- **Mean compile seconds to first exact**, when every row carries
  `provenance.compile_seconds`.
- **Wall time**: ranking wall seconds per ordering and training seconds, so
  pruning overhead can be compared with the compile time it saves.

## Gating

`gate` turns an evaluation report into a verdict JSON with
`"verdict"` (`accept`, `reject`, or `not_applicable`), reasons, and
`"claimed_savings": true|false`. Savings are claimed only when the surrogate,
compared with the **best** of the three baselines (lowest mean
compiles-to-first-exact):

- reduces mean compiles-to-first-exact by **at least 3x**; **or**
- reduces it by **at least 20%** and has **nonzero** exact recall at k = 150.

The verdict is `not_applicable` (never a claim; metrics are informational)
when:

- the split mode in the manifest is not `repo` (repo-disjoint evaluation is
  required);
- the manifest's leakage check is not `passed`;
- any row carries synthetic labels;
- the test split has no pool with an exact match (no exacts, no claimed
  savings);
- a baseline is missing;
- fewer than `min_pools_with_exact` (default **10**) test pools contain an
  exact candidate (one lucky pool is not evidence);
- `recall_k` is not among the evaluated `--ks`;
- the criteria are weaker than the defaults (see below).

Leakage is checked fail-closed in `evaluate`: the model artifact records its
training canonical hashes, repos and candidate source digests; any overlap with
the test rows (or, for `repo` mode, any shared repo) fails the leakage check,
and an artifact without these fields fails it too. The manifest's split mode
is only trusted when the manifest's recorded sha256 of `test.jsonl` equals the
file passed to `--test`. `structural` keys that look like labels (distance,
prefix, mismatch, exact, frame, save_mask, ...) are ignored by `featurize`.

Default criteria (`DEFAULT_CRITERIA`) can be overridden per key with a JSON
file passed to `evaluate --criteria`. Unknown keys and non-finite numbers are
rejected. Criteria may be made *stricter*; any weakening (lower thresholds,
dropping a default baseline, a non-`repo` split requirement) still produces
metrics but forces `not_applicable` with no claimed savings. Example:

```json
{"required_split_mode": "repo", "min_factor": 3.0,
 "min_relative_reduction": 0.20, "recall_k": 150, "min_pools_with_exact": 10,
 "baselines": ["original", "random", "heuristic"], "candidate_ordering": "model"}
```

## Example commands

```sh
# 1. Validate and split authoritative rows (repo-disjoint), mine hard negatives.
python3 tools/build_gpu_surrogate_dataset.py validate rows.jsonl
python3 tools/build_gpu_surrogate_dataset.py build rows.jsonl --out splits/ --mode repo --seed 0

# 2. Train (GPU when available).
python3 tools/gpu_precompile_surrogate.py train \
  --train splits/train.jsonl --valid splits/valid.jsonl --out model.pt --seed 0 --device cuda

# 3. Evaluate against baselines and gate.
python3 tools/gpu_precompile_surrogate.py evaluate \
  --model model.pt --test splits/test.jsonl --manifest splits/manifest.json \
  --out report.json --criteria criteria.json

# 4. Rank a pending pool of not-yet-compiled candidates.
python3 tools/gpu_precompile_surrogate.py rank \
  --model model.pt --candidates pending.jsonl --out ranked.jsonl

# Offline smoke test (numpy backend, no GPU required; never claims savings).
python3 tools/gpu_precompile_surrogate.py selftest
```

Optional flags (see `--help` for each subcommand):

- `build`: `--test-fraction`, `--valid-fraction`, `--holdout-families a,b`,
  `--hard-negatives K`, `--bytes-root DIR`, `--allow-rejects`.
- `train`: `--hard-negatives splits/hard_negatives.jsonl`, `--config C.json`,
  `--epochs N`, `--backend auto|torch|numpy`, `--device auto|cpu|cuda[:N]`,
  `--bytes-root DIR` (recompute labels from byte files; without it, split rows
  are validated on their builder-written labels and byte paths are ignored).
- `evaluate`: `--manifest` (needed for the gate to see the split mode and
  leakage check), `--criteria`, `--ks 25,50,150,500`, `--random-repeats N`,
  `--seed`, `--device`, `--bytes-root DIR`. The manifest is honoured only if
  its recorded sha256 of `test.jsonl` equals the `--test` file; `train.jsonl`
  and `valid.jsonl` next to it are then re-checked for leakage against test.
- `rank`: `--top N` (keep only the first N ranked rows), `--device`.
- `selftest`: `--seed`, `--backend`.

`rank` drops `labels` from its output and adds a `surrogate` object to each
row containing the head outputs, `score`, `rank`, and a note that exactness
requires a CPU compile and byte match.

## Integration with a permuter loop

1. The permuter generates a pool of candidate sources as usual and writes them
   as pending rows (pre-compile fields only) to `pending.jsonl`.
2. `rank` writes `ranked.jsonl` with per-head predictions and a score. Prefer
   ranking the whole pool; if `--top N` is used, keep the unranked remainder
   in the queue rather than discarding it.
3. CPU compile workers take candidates **in ranked order**. The loop (not
   `rank`) reserves a **random exploration slice** (for example 10% of compile
   slots) drawn uniformly from the not-yet-compiled pool. This keeps new
   training labels less biased and catches regions the model scores poorly.
4. Every compile is checked by the exact byte matcher. **Every exact claim is
   re-verified** by an authoritative CPU compile plus byte comparison before it
   is accepted; the surrogate's prediction plays no part in acceptance.
5. Newly compiled candidates become new labeled rows
   (`label_origin: authoritative_cpu_compile`) for the next training round.
6. Unranked or low-ranked candidates stay in the queue. If compute allows, the
   full pool can still be exhausted; ranking only changes the order.
7. Only enable ranked scheduling for a model whose gate verdict has
   `"claimed_savings": true`; otherwise use original or seeded random order.

## Limitations

- The surrogate sees only mutation tokens, compiler lane, and coarse structural
  counts. It cannot see the actual source text semantics, register allocation,
  or instruction scheduling, so its predictions are weak priors.
- Exact matches are rare. With few exacts, top-k recall estimates have high
  variance, and the gate may correctly refuse to claim savings.
- Training labels come from historical permuter runs, whose generation policy
  biases the data. The random exploration slice mitigates but does not remove
  this feedback bias.
- Generalization across repositories and compilers is unproven until a
  repo-disjoint evaluation passes the gate; function- and family-disjoint
  results are optimistic relative to new projects.
- Frame-size and save-mask labels rely on simple prologue pattern matching
  (`addiu sp,sp,-N` and `sw rX,off(sp)`); functions with unusual prologues,
  multiple stack adjustments, or saves through another base register are
  summarized imperfectly.
- The numpy backend is a test fallback; it is not tuned and should not be used
  for gating decisions.
- Savings measured on replayed pools assume the compile cost per candidate is
  roughly constant; real wall-clock savings also depend on ranking overhead
  and worker scheduling.
- The surrogate never proves anything about correctness. Only the CPU compiler
  and exact byte matcher do.
