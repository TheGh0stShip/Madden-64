# Desktop decompilation compute pipeline

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
- Mixed campaigns run GPU scoring and CPU compilation in one durable Desktop job;
  the controller serializes separate durable jobs.
- Sample CPU load, CUDA utilization, VRAM, power, temperature, and forward
  progress. Low utilization is a routing defect, not success.
- Every task has a timeout, deterministic seed, heartbeat, result checksum, and
  resumable output. A stale lease is retried with a bounded attempt count.

## Artifact contracts

- `config/desktop_campaign.schema.json` describes resource-aware task lanes.
- `config/compiler_corpus.schema.json` describes cross-project compiler labels.
- `tools/gpu_function_retrieval.py` performs a broad genuine-C donor search.
- `tools/gpu_retrieval_ensemble.py` measures donor stability across randomized
  opcode-feature projections.
- `tools/gpu_candidate_bytes_rank.py` ranks actual compiled candidates and
  separates opcode, register, immediate, and other residual mismatches.

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

## Known gaps and next implementation slices

1. Build a balanced cross-project corpus for KMC, GCC, IDO, and SN attribution.
2. Fuse feature weighting, normalization, similarity, and top-k in a tuned
   CuPy/Triton kernel for the RTX 2070.
3. Stream CPU-produced relocated text into pinned buffers and score it on a
   second CUDA stream while compilation continues.
4. Train a residual classifier from exact-function perturbations to select the
   next mutation family rather than only ranking candidates.
5. Add CFG/call-graph context and boundary confidence to donor retrieval.
