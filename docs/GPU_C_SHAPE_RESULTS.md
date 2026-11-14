# GPU C-shape inference results

## Purpose

The GPU shape lane predicts compiler-relevant source families for unfinished
functions. It does not claim matches. Every prediction must still become
readable C and pass the authoritative CPU compiler/ROM matcher.

## Reproducible run

- Desktop job: `madden64-gpu-c-shape-inference-v7`
- Device: NVIDIA GeForce RTX 2070 via CUDA in the project GPU environment
- Input archive SHA-256:
  `6fa865cc6e043fb194883f34bf8715136bfceca6c7f94972a26d767517fa2acf`
- Tool SHA-256:
  `6696ff58a21a25d4aa0c73fb0b683cd7373e896b8c2f2516eeb4f19993ea4b92`
- Result archive SHA-256:
  `744c1bbc608b742c562857dc189746f06161e822a69437395f266511692e8eb8`
- Training corpus: 2,183 provenance-eligible byte-exact C functions
- Strict-incomplete queries: 1,507 functions
- Labels: 38 source-shape families
- Ensemble: eight independently seeded 180-epoch CUDA models
- Validation split: 250 unseen source files per seed; functions from one source
  file never appear in both fitting and validation sets
- Micro precision range: 0.7341–0.8058
- Micro recall range: 0.7404–0.7894

All eight prediction files and all eight metric files independently match the
SHA-256 values recorded by the remote job. The local consensus contains exactly
1,507 rows.

## Important corrections made during development

1. Assisted catalogue rows are queries, not strict training examples.
2. Inline assembly, function-specific normalizers, and `M2C_FIELD`/`M2C_UNK`
   sources are excluded from training.
3. Preprocessor directives and string/character literals are removed before
   label extraction; otherwise `#include "types.h"` falsely appears to be a
   struct-dot expression.
4. Exact functions with no positive shape labels remain all-negative training
   examples. Dropping them biases the model toward inventing complex source
   shapes for tiny functions.
5. Validation is source-file-disjoint because some C files contain multiple
   functions with the same extracted labels.

## High-value predictions

These are cross-seed hypotheses, not proof:

- `gameplay_event_dispatch` (0x1608 bytes): signed-16 data, block-scoped locals,
  indexed and address-taken local arrays, byte fields, chained assignments, and
  typed struct fields.
- `ui_scene_render` (0x1258 bytes): block-scoped locals, explicit bitmasks,
  indexed `u16`/`u8` data, chained assignments, and struct-pointer access.
- `display_object_process` (0x1070 bytes): signed-16 and floating-point data,
  compound assignments, address-taken locals, block scope, struct fields, and
  a possible union representation.
- `render_command_dispatch` (0xC50 bytes): `u16`/`s16` carriers, explicit casts,
  local arrays, block scope, indexed access, and chained assignments.
- `gameplay_event_prepare` (0x434 bytes): block-scoped signed-16 arrays plus
  `s8`, `u8`, and `u16` fields. This independently agrees with the recovered
  0x214C-byte `TeamData` layout.
- `object_orientation_apply` (0x118 bytes): explicit signed-16 truncation,
  compound assignment, narrow block scope, and explicit masks. This agrees
  with the target's observed fixed-point operations.

## Small-function experiment evidence

`nested_flag_clear` is an empirical shape test case. Ordinary C plus a volatile
flags object reproduces the target's unfilled return delay slot (score 4).
Moving the mask assignment into `do { ... } while (0)` places the constant at
the target's first instruction but swaps the mask and object registers (score
5). Typed structs, array fields, declaration order, block scope, labels,
ordinary `register`, dead initialization, and a K&R parameter did not resolve
both constraints simultaneously.

## Generated-shape production run

The first prediction-to-generation run targeted `gameplay_event_prepare` with
512 genuine-C candidates. It varied declaration order, the signed-16 team
counter hypothesis, ordinary `register` removal, and three shared
`TeamData`/statistics-base lifetimes. Desktop compiled all 512 candidates with
24 CPU workers using the real KMC toolchain; the matcher remained the oracle.

- Desktop job: `madden64-gpep-shapes-v4` (succeeded).
- Input SHA-256: `c237889fec3c62706d0af6e71dede8d61a325db5ddafbb7d9ee40abf6c4a7beb`.
- Result SHA-256: `053ff26982fcb02d813585de1bffea5547db16378cefd61bcf880797800c41aa`.
- Valid compilations: 512/512.
- Baseline score: 445; best generated score: 415.
- A follow-up inner-loop `goto` shape reduced the score again to 402 and moved
  the first difference from +0x5 to +0xD.

Declaration order and the `register` hint did not change generated code. The
improvement came from recovering a shared `D_80081860`/statistics base, while
the loop result shows that the next search should target loop-entry and
invariant-motion shapes rather than more declaration permutations.

KMC compilation initially failed on the Windows-mounted path because its old
32-bit preprocessor cannot represent modern NTFS/DrvFS inode metadata. Moving
the immutable bundle to WSL ext4 fixed the issue; this is now a documented
Desktop pipeline invariant.

## Tools

- `tools/gpu_c_shape_inference.py`: trains and predicts on CUDA.
- `tools/summarize_gpu_shape_ensemble.py`: aggregates seed agreement, mean
  model score, dispersion, and concrete C experiments.
- `tools/generate_c_shape_variants.py`: emits bounded genuine-C source shapes
  from the semantic hypotheses.
- `tests/test_gpu_c_shape_inference.py`: protects the source-label parser from
  include/literal leakage and loop/pointer false positives.
- `tests/test_generate_c_shape_variants.py`: checks deterministic generation,
  hypothesis coverage, and absence of assembly injection.
