# Desktop decompilation compute pipeline

## Campaign routing rule

The remaining Madden functions are not a generic permutation problem.  Use the
following order for every new function campaign:

1. Recover the real function boundary and compiler family.
2. Build a semantic dossier from callers, callees, neighboring functions,
   referenced globals, pointer consumers, field widths, loop exits, jump
   tables, and saved-register lifetimes.
3. Search exact sibling implementations and rank donor functions by call-graph,
   memory-access, constant, and control-flow signatures.
4. Write readable C whose types and control flow explain the target assembly.
5. Compare compiler pass dumps at the first divergent pass and apply only
   idioms relevant to that pass.
6. Use bounded permutation only when the candidate has the correct semantics,
   exact size, and a small residual dominated by allocation or scheduling.

GPU lanes are advisory semantic retrieval and residual-clustering lanes.  They
must emit ranked candidates, checkpoint hashes, and measured outcomes.  CPU
compilation plus byte comparison remains the only exact-match proof.  A GPU
campaign must be redirected when its held-out corpus contains no exact positive
or when broad mutation produces negligible strict improvements; additional
epochs or seeds do not turn a sparse label set into useful evidence.

`tools/gpu_c_shape_inference.py` adds a supervised shape lane.  It learns
coarse compiler-relevant source forms from the provenance-eligible exact-C
corpus and predicts promising forms for unfinished functions: loop kind,
switch/goto structure, pointer versus array access, integer widths, expression
association, temporaries, and lifetime/layout hints.  Inline assembly,
function-specific normalizers, and unfinished `M2C_FIELD`/`M2C_UNK` sources are
excluded from its training set.  Run multiple seeds and retain held-out
precision/recall so cross-seed agreement, not one opaque score, determines the
next CPU experiment.  These predictions are routing evidence only; exact CPU
compilation and ROM comparison remain mandatory.

`tools/generate_c_shape_variants.py` converts semantic guidance into bounded
source populations. Its first production lane varies declaration order,
counter width, shared object bases, and local lifetime without injecting
assembly or changing the compiler. Desktop CPUs compile the ranked population;
the GPU remains the pre-compilation shape ranker.

KMC's old 32-bit preprocessing tools must run from WSL's native ext4
filesystem. Compiling directly under `/mnt/c` can fail with `Value too large
for defined data type` while reading ordinary headers. Durable jobs therefore
unpack immutable inputs into a unique `/tmp` directory, compile there, hash the
result set, and copy only the result archive back to
`C:\N64Decomp\workspaces`.

Remote result archives use shell-safe checkpoint formats (TSV or a JSON file
written by a standalone script).  Do not embed escaped JSON inside nested
PowerShell/WSL/Bash command strings: quoting changes across those boundaries
have previously terminated otherwise productive long-running jobs.

Desktop is the compute worker for Madden 64 campaigns. The repository remains
the source of truth: remote tasks never commit, push, or edit GitHub state.

## Campaign architecture

1. **Inventory**: regenerate the function catalogue and freeze its hash.
2. **Attribute**: rank compiler family, version, assembler, ABI, and flag lanes.
   Supported lanes include KMC GCC, compatible GCC 2.x variants, IDO 5.3/7.1,
   and SN GCC/ASN64. An unknown lane remains explicit; it is not coerced to KMC.
3. **Generate**: use a portfolio of deterministic rewrites, stochastic AST
   mutation, parallel tempering, flag sampling, and donor-source adaptation.
4. **Compile**: CPU shards compile genuine C with pinned toolchain inputs.
5. **Score**: CUDA ranks large relocated-byte pools and classifies residuals;
   compilation itself remains CPU work.
6. **Allocate**: successful mutation families receive more budget while a
   diversity quota keeps other compiler and source-form hypotheses alive.
7. **Verify**: exact candidates are rebuilt independently, scanned for assembly
   escapes, and checked against the original ROM bytes before integration.
8. **Publish**: only the primary workspace updates manifests, progress, commits,
   and GitHub. Remote output is an immutable result archive plus checksums.

## Resource rules

- A CPU campaign uses explicit shards, normally one compiler process per logical
  processor. Nested parallelism is disabled unless the manifest reserves it.
- GPU work keeps feature/candidate tensors resident and uses large batches. Host
  feature construction is not counted as GPU utilization.
- `gpu_stream_rank.py` sizes its two candidate buffers from live free VRAM. The
  default uses up to 70% of currently free device memory while independently
  capping page-locked host memory at 0.75 GiB. `--batch` can override this, but
  allocating unused VRAM is not considered progress or performance.
- Mixed campaigns run GPU scoring and CPU compilation in one durable Desktop job;
  the controller serializes separate durable jobs.
- Sample CPU load, CUDA utilization, VRAM, power, temperature, and forward
  progress. Low utilization is a routing defect, not success.
- Every task has a timeout, deterministic seed, heartbeat, result checksum, and
  resumable output. A stale lease is retried with a bounded attempt count.

### Alienware legacy lane

Alienware is a separate small-batch worker: a two-core/four-thread Core i7 with
15.9 GiB RAM and a 2 GiB GeForce GT 540M. Select it through the same controller
with `COMPUTE_WORKER=Alienware`; Desktop remains the default. This lane is for
independent provenance/hash audits, metadata extraction, small compile shards,
and bounded candidate pools. It must not receive the 32-way compiler farm or
the RTX-sized CUDA models.

`tools/alienware_opencl_rank.ps1` is a Fermi-compatible OpenCL byte scorer for
fixed-size compiled candidates. It reports the device, memory, compute units,
kernel time, and deterministic score/name ordering. Kernel work must remain
short enough for the display-driver watchdog. A failed OpenCL smoke disables
the GPU lane without disabling Alienware's CPU lane; no result may claim GPU
execution merely because the NVIDIA ICD is installed.

`tools/alienware_source_audit.ps1` uses four isolated PowerShell jobs to hash
and scan source batches for assembly escapes. Its output is supporting audit
evidence, not proof that a reported use is or is not handwritten assembly.

### Transfer Iris Xe lane

Transfer's Iris Xe runs Windows-side ONNX Runtime DirectML inference through
`tools/iris_xe_lane.py` and `tools/iris_xe_directml_worker.py`. WSL constructs
all features; Windows receives tensors only. Strict sessions reject unsupported
operators instead of silently falling back to CPU. See
`docs/iris_xe_compute.md` for the measured gate and replay commands.

## Artifact contracts

- `config/desktop_campaign.schema.json` describes resource-aware task lanes.
- `config/compiler_corpus.schema.json` describes cross-project compiler labels.
- `config/compiler_corpus_projects.json` pins local and externally staged
  exact-C projects used to build the attribution corpus. External roots are
  supplied through `DECOMP_RESEARCH`; they never live in or get committed with
  the Madden checkout.
- `config/desktop_artifact.schema.json` defines immutable result archives.
- `config/desktop_permute_jobs.schema.json` defines genuine-C permutation lanes.
- `config/residual_training.schema.json` defines residual-routing examples.
- `tools/gpu_function_retrieval.py` performs a broad genuine-C donor search.
- `tools/gpu_retrieval_ensemble.py` measures donor stability across randomized
  opcode-feature projections.
- `tools/gpu_c_shape_inference.py` predicts compiler-relevant C-shape families
  from the strict exact-C corpus and emits ranked experiments for unfinished
  functions.
- `tools/summarize_gpu_shape_ensemble.py` converts independently seeded shape
  predictions into cross-seed agreement, mean confidence, dispersion, and a
  concrete source experiment for each unfinished function.
- `tools/gpu_candidate_bytes_rank.py` ranks actual compiled candidates and
  separates opcode, register, immediate, and other residual mismatches.
- `tools/gpu_stream_rank.py` fuses byte/bit/word/length scoring in one CuPy
  kernel and overlaps two pinned host buffers on two CUDA streams.
- `tools/compiler_fingerprint.py` extracts frame/save/control-flow fingerprints
  from authoritative relocated MIPS bytes and labels mutation batches with
  contained paths and immutable provenance hashes.
- `tools/evaluate_precompile_ranker.py` is the promotion gate for candidate
  routing: it compares mean authoritative compiles-to-first-exact against
  original-order, seeded-random, and cheap-CPU rankings.  GPU routing is not
  accepted merely because inference ran on CUDA or beat random ordering.
- `tools/compiler_corpus.py` extracts hash-verified exact text, assigns
  class-balance weights, enforces project-disjoint evaluation, and provides a
  deterministic portable classifier. It can also recompile upstream-verified
  decompdecomp C with its recorded SN compiler settings; those samples are
  routing evidence only, never Madden matching evidence.
- `tools/build_n64_upstream_inventory.py` builds the broad discovery inventory
  from the CC0 awesome-reverse-engineered feed and safely probes build metadata
  from 139 listed N64 projects. Remote hooks, submodules, file/ext protocols,
  source builds, and repository instructions are never executed.
- `tools/gpu_compiler_attribution.py` trains the class-balanced CUDA attribution
  model and saves its project-disjoint metrics with the checkpoint.
- `tools/build_residual_training.py` derives labelled perturbations from exact-C
  text; `tools/residual_router.py` trains and applies the mutation-family router.
- `tools/desktop_permute_farm.py` runs up to 32 isolated single-compiler lanes
  and emits ingestion-ready exact results.
- `tools/build_desktop_jobs.py` expands context donors into a configurable
  multi-compiler/multi-seed queue; the supplied campaign tries KMC builtin,
  KMC/ASN64, IDO 5.3, IDO 7.1, and SN rather than assuming KMC provenance.
- `tools/integrate_desktop_results.py` distrusts remote results: it validates
  archive hashes and paths, scans provenance, independently rebuilds every C
  candidate, transactionally updates manifests/sources/progress, and rolls back
  on any failure. A persistent checksummed journal also recovers after SIGKILL
  or power loss. It never commits or pushes.
- `tools/extract_desktop_artifact.py` rejects traversal, absolute paths,
  duplicate members, symlinks, devices, undeclared files, checksum failures,
  and oversized expansion before an artifact is inspected or integrated.
- `tools/desktop_campaign.py` validates the resource DAG, hashes tools and
  inputs, applies per-lane timeouts/retries, samples CPU/GPU telemetry, resumes
  checksum-identical outputs, and creates the immutable archive.

Remote outputs must include the input hash, toolchain hashes, exact command,
seed, start/end times, exit status, metrics, result hashes, and an archive hash.
Candidate paths alone are never sufficient provenance.

## Research basis

The design follows several independently established patterns:

- Decomp-permuter supports random/manual source mutation and distributed work:
  <https://github.com/simonlindholm/decomp-permuter>
- STOKE models superoptimization as cost-guided stochastic search:
  <https://arxiv.org/abs/1211.0557>
- BaCO treats compilers as black boxes and learns from evaluated configurations:
  <https://arxiv.org/abs/2212.11142>
- Batch active learning benefits from uncertainty plus diversity at large scale:
  <https://arxiv.org/abs/2107.14263>
- Content-addressed build caches include source, flags, and compiler identity:
  <https://ccache.dev/manual/latest.html>
- CUDA guidance favors resident data, fused kernels, pinned transfers, streams,
  and profiling rather than utilization guesses:
  <https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html>
- CUDA Graphs reduce repeated small-kernel launch overhead:
  <https://docs.nvidia.com/dl-cuda-graph/latest/cuda-graph-basics/cuda-graph.html>
- Compiler provenance can be classified from raw binary byte sequences:
  <https://github.com/Viewer-HX/BinProv>
- GPU-friendly synthesis benefits from enumerating semantics rather than syntax:
  <https://arxiv.org/abs/2504.18943>
- SLSA and in-toto provide useful models for recording build definitions and
  bit-identical artifact lineage:
  <https://slsa.dev/spec/v1.2/build-requirements>
  <https://github.com/in-toto/specification/blob/master/in-toto-spec.md>

## Reproducible operation

Build the real cross-project corpus and both routing models:

```sh
python3 tools/compiler_corpus.py collect config/compiler_corpus_projects.json \
  build/research/compiler-corpus/raw.jsonl build/research/compiler-corpus/blobs
python3 tools/compiler_corpus.py build \
  build/research/compiler-corpus/raw.jsonl \
  build/research/compiler-corpus/balanced.jsonl \
  build/research/compiler-corpus/model.json
python3 tools/build_residual_training.py \
  build/research/compiler-corpus/raw.jsonl \
  build/research/residual-router/examples.jsonl \
  build/research/residual-router/blobs
python3 tools/residual_router.py train \
  build/research/residual-router/examples.jsonl \
  build/research/residual-router/model.json
```

On Desktop, stage this repository, `n64-decomp-kit` as its read-only sibling,
the ROM/toolchains, the generated corpus/residual directories, and a validated
`build/research/desktop-jobs.jsonl`, then run:

```sh
python3 tools/desktop_campaign.py config/desktop_madden_campaign.json \
  --root . --state build/research/desktop-state.json \
  --archive build/research/desktop-results.tar.gz --cpus 32 --gpu 1
```

Fetch and extract the archive into an isolated directory. First inspect it with
the default dry run; only then request the rollback-safe local integration:

```sh
python3 tools/extract_desktop_artifact.py \
  build/research/desktop-results.tar.gz build/research/desktop-results
PYTHONPATH=../n64-decomp-kit python3 tools/integrate_desktop_results.py ARTIFACT \
  --root . --python ../n64-decomp-kit/.venv/bin/python
PYTHONPATH=../n64-decomp-kit python3 tools/integrate_desktop_results.py ARTIFACT \
  --root . --python ../n64-decomp-kit/.venv/bin/python --apply
```

## Implemented research items and validation

All five previously listed implementation gaps are now represented by runnable
code and tests:

1. The baseline corpus builder accepts 2,612 hash-verified exact-C functions
   from Madden Football 64, Rugrats, Nagano, and BattleTanx: 1,377 IDO, 1,154
   KMC GCC, and 81 SN GCC samples. Project-disjoint evaluation is stored in each
   model; low confidence must cause a multi-toolchain sweep, never coercion.
2. The fused CuPy kernel was compiled and run on the RTX 2070. Its four-candidate
   variable-length test correctly returned the exact candidate first and
   classified its one-immediate and two length residuals.
3. The same test exercised two pinned host buffers and two nonblocking CUDA
   streams. CPU compilation stays independently sharded; the GPU never replaces
   the authoritative compiler or matcher.
4. The baseline residual corpus contains 9,945 synthetic examples derived from
   2,000 exact-C functions across five mutation families. Evaluation now uses a
   project-disjoint split when multiple projects are present (and explicitly
   labels its function-disjoint fallback); accuracy, macro-F1, per-class
   precision/recall/F1, and the confusion matrix are embedded in the model.
5. The whole-program catalogue now records direct calls, basic-block/edge/back-
   edge counts, and boundary evidence. Both retrieval implementations consume
   those features.

The campaign runner passed a two-lane dependency/resume/archive test. The
ingestion tool passed an end-to-end dry run by independently rebuilding a known
exact Overlay 2 function, and its progress recomputation equals the current
authoritative count of 2,401 functions.

These models are routing aids, not decompilation proof. Their measured error is
why the pipeline retains compiler diversity and requires independent byte-exact
verification before any source receives credit. This number is regenerated
from the manifests rather than treated as a pipeline constant.
