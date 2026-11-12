# GPU-guided permutation ranking

The GPU is a scheduler, not a compiler or verifier. KMC GCC 2.7.2 compilation
and the relocated byte matcher remain CPU-side, and a candidate is accepted
only when the exact matcher reports zero differences.

## Data flow

1. Run `n64dk match-permute` with `--replay-log run.jsonl`. The replay log
   records every generated source, the ordered mutation names, its parent
   score, compiler-oracle score, seed, and exact-match result.
2. Use at least 2,000 compiled candidates for a cold start. Until then, retain
   seeded random ordering; do not infer that an uncompiled candidate failed.
3. Train on Desktop with:

   ```sh
   codex-gpu python tools/gpu_permuter_ranker.py train run.jsonl ranker.pt
   ```

4. Generate a substantially larger uncompiled pool than the CPU compile width,
   rank it in CUDA batches, and give CPU workers the top candidates plus a
   10-percent random exploration sample:

   ```sh
   codex-gpu python tools/gpu_permuter_ranker.py rank \
  ranker.pt candidates.jsonl ranked.jsonl --explore 0.10 --select-count 512
   ```

5. Retrain after 512 new compiler labels or five minutes, whichever is later.
   Keep the previous checkpoint and promote the new one only when its held-out
   top-quartile improvement hit rate exceeds the random baseline.

Replay rows are deduplicated by function and source digest. Validation holds
out an entire RNG seed for every function with multiple runs; a single-seed
function temporarily uses the final temporal fifth. This prevents the model
from appearing accurate merely because a candidate and its near-identical
siblings were randomly scattered across train and validation sets.

This split measures fresh mutation lineages for functions already represented
in training. It does not establish generalization to a new function. Before a
new function receives model-prioritized slots, collect an unbiased seed run for
it and retain the 10-percent random arm; a leave-one-function-out evaluation is
the separate cross-function gate.

The production loop generates 250,000 uncompiled proposals per round, streams
them through CUDA in 8,192-candidate chunks, and compiles a 512-candidate batch.
Selection reserves exactly 10 percent of the compile budget (51 of 512 slots)
for seeded uniform exploration over the entire proposal pool, then fills the
remaining slots by global model priority. Every compiled row records its pool,
model version, selection arm, seed and iteration so policy bias can be audited.
Replay training rows are deduplicated by function and canonical source digest.

The initial model is deliberately small: stable hashed source-token n-grams,
mutation identities, parent-score and source-size features feed a 48-wide
`EmbeddingBag` and a two-layer MLP. Separate heads estimate normalized score
improvement and exact-match probability. This fits comfortably on the RTX 2070
and ranks thousands of candidates per transfer.

## Rollout and rollback

Start in shadow mode: rank candidates but compile them all in the existing
order, collecting unbiased labels. Then A/B test by function with equal compile
budgets:

- control: seeded random candidate order;
- treatment: GPU order with 10-percent seeded random exploration;
- both arms: stop only after an exact match or the same compile budget.

When the replay corpus contains no exact positives, the exact-match head is
disabled rather than allowing random untrained weights to influence ranking.
The deployment gate then measures held-out non-regression rate both in the top
quartile and at the production 512-of-50,000 compile budget, compared with
the validation-wide random baseline. Once exact examples exist, the exact head
and its calibrated probability are added to priority.

The primary metrics are exact matches per 10,000 compiles and compilations to
first exact match. Secondary metrics are best score improvement per 1,000
compiles and wall time to first exact. Disable ranking and revert to seeded
random order if the held-out hit rate does not beat random, compile throughput
drops by more than five percent, CUDA scoring times out, or any model/checkpoint
error occurs. A matcher inconsistency is a hard stop; model output can never
override the byte matcher.

## Deliberate non-GPU work

Do not put AST mutation, preprocessing, KMC compilation, ELF relocation,
instruction classification, exact byte comparison, filesystem logging, or Git
operations on the GPU. Those jobs are branchy, process-heavy, or too small to
amortize transfer overhead. GPU work is limited to large-batch training and
candidate inference. CPU compiler workers remain the expensive oracle.

## Madden pilot

Desktop job `madden64-gpu-guided-pilot-v3` exercised the complete loop on
`indexed_flag_byte_get`: generate 10,000 uncompiled proposals, rank them on
CUDA, reserve 51 of 512 compile slots for uniform exploration, and compile the
selected sources with KMC GCC 2.7.2 on 30 CPU lanes. It completed in 64.5
seconds and recovered the known best score of 3, but found no exact match.

The model arm produced 185 non-regressions in 461 compiles (40.1 percent) and
23 score-3 candidates. The random arm produced 10 non-regressions in 51
compiles (19.6 percent) and one score-3 candidate. This is evidence that the
ranker saves compiler budget on this represented function; it is not evidence
that the model can predict exact matches, because the training corpus still
contains no exact-positive row.

## Rationale

- [decomp-permuter](https://github.com/simonlindholm/decomp-permuter) describes
  random source transformations and notes that the method is strongest late in
  a match when register allocation dominates. The Madden ranker therefore
  prioritizes, but does not replace, those transformations.
- [OpenTuner](https://dspace.mit.edu/handle/1721.1/81958) reports that ensembles
  of search techniques can be allocated tests dynamically according to their
  observed performance. Mutation identity and observed improvement are retained
  so this can be added after the first ranker A/B test.
- [LLVM MLGO](https://llvm.org/docs/MLGO.html) separates compiler-side corpus and
  feature extraction facilities from dependency-heavy model training. The same
  separation is used here: the matcher emits replay data; Desktop owns PyTorch.
- [CompilerGym](https://arxiv.org/abs/2109.08267) treats compiler optimization as
  an environment with measured feedback. This pipeline uses the narrower and
  safer formulation of supervised ranking from exact compiler-oracle outcomes.

