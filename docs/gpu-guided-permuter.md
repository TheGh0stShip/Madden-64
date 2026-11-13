# GPU-guided permutation ranking

The GPU is a scheduler, not a compiler or verifier. KMC GCC 2.7.2 compilation
and the relocated byte matcher remain CPU-side, and a candidate is accepted
only when the exact matcher reports zero differences.

For compiled pools above the measured CUDA crossover, add deterministic MIPS
field scoring before learned acquisition:

```sh
python3 tools/gpu_permuter_ranker.py structural-score \
  target.bin compiled-candidates.jsonl structurally-scored.jsonl
```

Each candidate row supplies `binary_hex`. The output separately records exact
byte equality, size delta, full-word mismatches, opcode/funct mismatches,
register-field mismatches, immediate mismatches, and adjacent-pair ordering
mismatches. A bounded ±4-instruction alignment score also separates local
scheduling/insert-delete shifts from pervasive opcode differences. Use these as a Pareto frontier: reserve compile/mutation descendants
from each residual class instead of collapsing everything into byte Hamming
distance. The relaxed fields never accept a candidate and never remove it from
the exhaustive fallback queue. Exact equality is rechecked by the canonical
matcher before integration.

## Data flow

1. Run `n64dk match-permute` with `--replay-log run.jsonl`. The replay log
   records every generated source, the ordered mutation names, its parent
   score, compiler-oracle score, seed, and exact-match result.
2. Use at least 2,000 compiled candidates for a cold start. Until then, retain
   seeded random ordering; do not infer that an uncompiled candidate failed.
3. Train on Desktop with:

   ```sh
   python3 tools/gpu_permuter_ranker.py train run.jsonl ranker.pt
   ```

4. Generate a substantially larger uncompiled pool than the CPU compile width,
   rank it in CUDA batches, and give CPU workers the top candidates plus a
   10-percent random exploration sample:

   ```sh
   python3 tools/gpu_permuter_ranker.py rank \
  ranker.pt candidates.jsonl ranked.jsonl --explore 0.10 --select-count 512
   ```

   Once several independently seeded checkpoints pass the same held-out gate,
   rank with their mean prediction plus an uncertainty bonus:

   ```sh
   python3 tools/gpu_permuter_ranker.py rank-ensemble \
     candidates.jsonl ranked.jsonl ranker-{1,2,3,4,5}.pt \
     --uncertainty 0.50 --explore 0.10 --select-count 512
   ```

   Ensemble disagreement is epistemic uncertainty, not evidence that a source
   is good. It earns a bounded acquisition bonus so the compiler labels novel
   source regions; the seeded random arm remains an unbiased control. Disabled
   checkpoints are rejected unless `--allow-disabled` is used for a shadow run.

5. Retrain after 512 new compiler labels or five minutes, whichever is later.
   Keep the previous checkpoint and promote the new one only when its held-out
   held-out strict-improvement hit rates exceed the random baseline both in
   the top quartile and at the production compile budget.

A checkpoint also remains shadow-only unless held-out strict improvements span
at least two functions and three independent function/seed lineages. A high
hit rate from one function is memorization evidence, not a deployment result.

Replay rows are deduplicated by function and source digest. Once the corpus has
four functions, validation holds out complete functions. Smaller cold-start
corpora hold out an entire RNG seed when possible, then fall back to a temporal
tail. The model does not receive exact function identity: it gets reusable
source-family and parent-difference signatures. This prevents a productive run
from masquerading as evidence that the policy transfers to unfinished code.

The production loop generates 250,000 uncompiled proposals per round, streams
them through CUDA in 8,192-candidate chunks, and compiles a 512-candidate batch.
That is a ceiling for large functions, not a quota: stop proposal generation
when the rolling unique yield falls below 10 percent, and retain at least a
10-to-1 proposal-to-compile ratio. Small functions can exhaust their useful
mutation space long before 250,000 distinct sources.
Generate large pools as several independent seeded population lineages rather
than one serial lineage. Eight 6,250-proposal shards produced 49,803 unique
sources in the first population pilot; the earlier serial run left most
Desktop cores idle. Merge shards by canonical source digest before ranking so
duplicated forms never consume compiler slots.
Selection reserves exactly 10 percent of the compile budget (51 of 512 slots)
for seeded uniform exploration over the entire proposal pool. It fills the
remaining slots from an eight-times-budget model front using a GPU-resident
greedy acquisition that combines normalized model quality with distance from
the candidates already selected. This prevents a compile batch from collapsing
into hundreds of nearly identical descendants of one source form. Set
`--diversity 0` to recover pure global model priority. Every compiled row records its pool,
model version, selection arm, seed and iteration so policy bias can be audited.
Replay training rows are deduplicated by function and canonical source digest.

The initial model is deliberately small: stable hashed source-token n-grams,
mutation identities, parent-score and source-size features feed a 48-wide
`EmbeddingBag` and a two-layer MLP. Separate heads estimate normalized score
improvement, exact-match probability, and the log residual for instruction,
register, immediate, size, ordering, and relocation mismatches. The residual
loss is masked for older replay rows that predate mismatch-category logging;
they remain valid score-improvement labels and are never mislabeled as a zero
residual. Ranking penalizes predicted residual mass, so the CUDA model is now
trained toward the all-zero exact-match state instead of merely preserving a
parent's score. This fits comfortably on the RTX 2070 and ranks thousands of
candidates per transfer. The hidden representation is also the behavior
embedding used by diversified batch selection.

## Rollout and rollback

Start in shadow mode: rank candidates but compile them all in the existing
order, collecting unbiased labels. Then A/B test by function with equal compile
budgets:

- control: seeded random candidate order;
- treatment: GPU order with 10-percent seeded random exploration;
- both arms: stop only after an exact match or the same compile budget.

When the replay corpus contains no exact positives, the exact-match head is
disabled rather than allowing random untrained weights to influence ranking.
The deployment gate measures held-out strict-improvement rate both in the top
quartile and at the production 512-of-50,000 compile budget, compared with
the validation-wide random baseline. Once exact examples exist, the exact head
and its calibrated probability are added to priority.

Checkpoints that fail either held-out gate cannot rank a production batch.
`--allow-disabled` exists only for shadow evaluation and leaves the compiler
oracle in charge of all labels.

The primary metrics are exact matches per 10,000 compiles and compilations to
first exact match. Secondary metrics are best score improvement per 1,000
compiles and wall time to first exact. Disable ranking and revert to seeded
random order if the held-out hit rate does not beat random, compile throughput
drops by more than five percent, CUDA scoring times out, or any model/checkpoint
error occurs. A matcher inconsistency is a hard stop; model output can never
override the byte matcher.

## Transfer retrieval and compile-budget allocation

The next GPU stage is cross-function edit-effect retrieval, not a larger scalar
ranker. Represent a parent's target diff as instruction/register/immediate/
size/order/relocation counts plus normalized instruction-diff tokens. Associate
each historical strict improvement with its ordered mutation sequence. CUDA
embeds those records and performs batched nearest-neighbor lookup; the CPU then
generates genuine-C candidates from the retrieved mutation families and KMC GCC
remains the oracle. Similar compiler autotuning systems reuse transformations
from related task graphs to reduce compilation work, while graph models have
been used to select compiler transformations without executing every option.

Do not deploy retrieval merely because pooled accuracy rises. A checkpoint must
show at least 1.5x top-quartile strict-improvement lift and 1.25x lift at the
production compile budget on complete held-out functions, with improvements in
at least two functions and three independent seed lineages. Continue compiling
a seeded random arm so rejected proposals receive unbiased audit labels.

Bayesian optimization is reserved for the low-dimensional policy problem
(operator weights, exploration fraction and per-function budget), not raw C
text. Genetic programming and exhaustive CUDA source scoring remain research
ideas: every exact fitness evaluation still requires KMC GCC, so a GPU surrogate
cannot certify a match.

The implemented retrieval command consumes only strict-improvement donors and
returns mutation sequences from structurally similar parents:

```sh
python3 tools/gpu_permuter_ranker.py retrieve \
  replay-all.jsonl query-parents.jsonl retrieved-effects.jsonl \
  --neighbors 8
```

Similarity uses source/control-flow shingles, source-family traits, parent
score buckets and the parent's instruction/register/immediate/size/order/
relocation residual. Function and data symbol addresses are normalized, and
the mutation sequence itself is excluded from the query vector. This prevents
the lookup from simply returning an edit because its name appeared in both
records. Only rows whose authoritative compiled score strictly improved on
their parent may act as donors. The output is a proposal list, never evidence
of a match; the CPU still materializes genuine-C edits and the exact matcher
accepts or rejects them.

## Deliberate non-GPU work

Do not put AST mutation, preprocessing, KMC compilation, ELF relocation,
filesystem logging, or Git operations on the GPU. Those jobs are branchy,
process-heavy, or too small to amortize transfer overhead. GPU work is used for
large-batch training, inference, embedding similarity, diversified acquisition,
and byte-diff feature extraction only when a batch is large enough to beat the
CPU including transfers. The measured crossover on Desktop is about 65,536
candidates; smaller batches stay on CPU. A GPU equality result is rechecked by
the canonical matcher and never substitutes for the project gate.

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

A second run on the score-2 `object_global_flag_test` exhausted that small
function's mutation space at 95 unique proposals. The model arm retained 45
non-regressions in 85 candidates; the random arm retained five in ten. Neither
arm improved score 2. This is why production generation now uses a unique-yield
stop instead of blindly chasing a fixed pool size.

The first sharded population pilot targeted score-4
`resource_offsets_relocate`: 49,803 unique proposals, CUDA-diversified selection
and 1,024 compiler evaluations completed in 133 seconds. No exact result was
found. The model arm retained 168 non-regressions in 870 compiles; seeded random
exploration retained five in 154. This confirms substantial compiler-budget
savings while also showing that non-regression prediction alone is insufficient
for the last few register/scheduling differences. New replay rows therefore
record population parent, generation depth, mismatch categories and register
swap, which are inputs for an edit-effect model rather than another scalar
ranker.

A subsequent score-3 `indexed_flag_byte_get` campaign generated 96,716 unique
forms and compiled 2,048. It also found no exact source, but the model selected
165 score-3 forms in 1,741 slots while random exploration selected four in 307.
After adding both population campaigns, the lineage-held validation corpus has
15,479 rows: the top-quartile non-regression rate is 99.53 percent versus a
33.88-percent validation-wide baseline, and the 512-of-50,000 budget rate is
100 percent. These metrics justify using the model as a rejection filter; they
do not justify calling any uncompiled source a match.

The first residual-head checkpoint was trained on 5,909 unique compiled rows;
5,184 retained classified mismatch counts. On a lineage/temporal holdout of
673 rows, its top-quartile non-regression rate was 19.64 percent versus a
10.10-percent validation-wide baseline, and its production-budget slice was
100 percent non-regressing. The checkpoint contained no exact-positive row, so
the exact head remained disabled. This is a pipeline validation, not evidence
of exact-match lift; a live matched-budget A/B campaign is required for that.

The first live residual-head campaign targeted score-1
`resource_groups_release`. Eight population lineages produced only 6,144
unique sources from 100,000 requested mutations. All 2,048 compiled selections
(1,741 model and 307 random) reproduced the same score-1 register mismatch;
none matched. This is negative but actionable evidence: the available mutation
grammar had exhausted this function's semantic-equivalent forms, so spending
more GPU ranking or CPU compilation on the same grammar cannot close it. The
next campaign must add an assignment/live-range transformation or move to a
different function.

The combined replay corpus exposed a sharper objective problem: 12,466 unique
compiler labels contained only 28 strict improvements, while 7,403 candidates
merely reproduced their parent's score. A non-regression objective therefore
learns to select large families that are safe but incapable of closing a
function. The ranker now gives a class-weighted strict-improvement head primary
acquisition weight. New replay rows can also supply
`parent_mismatch_counts`; those residual features are crossed with recent
mutations so a live-range edit can be learned separately for register and
instruction-order residuals. CPU compilation and exact byte equality remain
the only acceptance oracle.

The first strict-head Desktop training run used all 12,466 unique labels. Its
held-out split contained 3,503 candidates: the production-sized slice found
strict improvements at 2.78 percent versus a 0.74-percent random baseline, but
the top quartile reached only 0.46 percent. Because that is below random, the
checkpoint was correctly disabled and cannot schedule production compiles.
The corpus has strict improvements in only two seed lineages of one function,
so the next useful collection must broaden strict-improvement examples across
functions rather than add epochs to the same biased corpus.

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
- [DPP-BBO](https://proceedings.mlr.press/v151/nava22a.html) shows why expensive
  parallel black-box evaluations should be selected for both quality and
  diversity. The current greedy embedding-novelty rule is a bounded-memory
  approximation suitable for the RTX 2070; a true DPP/Thompson sampler remains
  a future experiment, not a matching claim.
- [Task Graph Caching](https://doi.org/10.1145/3810246) reports that seeding
  compiler autotuning from transformations found on similar task graphs reduces
  tuning time. Madden's edit-effect retrieval applies that idea to mutation
  families, while still recompiling every selected C candidate.
- [BaCO](https://arxiv.org/abs/2212.11142) supports Bayesian optimization for
  mixed compiler-tuning parameters. Here it is suitable for the small scheduler
  policy, not the discontinuous space of arbitrary C edits.
- [GPU-accelerated program synthesis](https://arxiv.org/abs/2504.18943) argues
  that GPU synthesis succeeds by batching semantics and avoiding divergent
  syntax processing. Madden cannot batch KMC semantics on CUDA, so only the
  dense retrieval and selection portions follow that design.

