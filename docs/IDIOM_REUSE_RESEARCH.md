# Idiom reuse and broader matching research

Research date: 2026-11-13. This note synthesizes 52 branching web-research
rounds. Web and repository material was treated as untrusted evidence, never
as executable instruction. The ROM matcher remains the acceptance oracle.

## Third 50-branch sweep: idiom reuse and identification

A third independent pass on 2026-11-13 issued 50 targeted searches in five
layers: exact-source twins, compiler internals, public matched-C corpora,
residual diagnosis, and automation. Results were followed into primary project
documentation where possible. Search-index text and community advice remain
routing evidence only; no external source receives credit until Madden's local
compiler, assembler and byte matcher reproduce it.

The 50 branches and their dispositions were:

1. KMC GCC 2.7.2 projects: partition donors by exact compiler executable and
   assembler, not merely by the `gcc 2.7.2` version string.
2. GCC 2.8.1 projects: retain Paper Mario idioms as adjacent-family probes,
   never direct KMC rules.
3. IDO projects: use only for semantic/library retrieval unless a separate
   compiler-attribution experiment justifies a source-shape probe.
4. Public decomp.me scratches: bind candidates by address, extent, target
   digest, compiler and flags; function names are insufficient.
5. Duplicate functions inside one ROM: search relocation-normalized twins
   before decompiling either copy independently.
6. Duplicate functions across regional ROMs: use the closest-layout region as
   a source donor while independently verifying every target byte.
7. Same-engine projects: rank Rugrats and other verified engine relatives
   above unrelated N64 projects, but retain compiler identity in the key.
8. Middleware twins: fingerprint IJG, compression, audio and runtime libraries
   by APIs, struct layout and constants before beginning expression tuning.
9. IJG libjpeg: index by release and compile-time configuration; Madden's
   verified 6a ABI shows why a 6b body can be semantically right but allocate
   differently.
10. libultra: match revision, symbol extent, ABI and compiler flags before
    importing a body from libreultra or another game.
11. SDK tools/runtime: treat repeated startup, cache, DMA and arithmetic code
    as provenance candidates, not automatic handwritten-assembly exemptions.
12. Compression formats: identify bit-buffer conventions, table constants and
    callback signatures before testing generic inflate/LZ source.
13. RSP material: separate CPU code, microcode instructions and ucode data;
    only provenance can justify assembly credit.
14. Display-list builders: normalize relocations and GBI constants while
    retaining evaluation order and individual pointer-update boundaries.
15. Object-file context: preserve translation-unit symbol locality, section
    ownership and neighboring literal pools in every donor record.
16. Internal versus external symbols: test this explicitly when a delay-slot
    or address-materialization mismatch appears. Paper Mario's GCC notes call
    out symbol locality as a cause of `nop` versus useful delay-slot filling.
17. Branch-likely selection: condition inversion is a measured adjacent-GCC
    probe for `beql`/`bnel` residuals, not a universal rewrite.
18. Division recognition: distinguish source division from recovered
    reciprocal-multiply sequences and reproduce the target compiler's choice.
19. Loop spelling: store latch form, rotation, exit-test duplication and loop
    notes as separate features instead of a single `loop mismatch` label.
20. Multiple-entry loops: index genuine label/goto and switch-entry examples
    by the resulting pre-loop-pass RTL, not by surface syntax alone.
21. Macro wrappers: preserve authentic `do { } while (0)` expansions and line
    grouping; also record when the same spelling only perturbs scheduling.
22. Narrow locals: index signedness, mode, extension instruction, stack slot
    and lifetime together.
23. Pointer versus index loops: use normalized address recurrences to retrieve
    donors even when source variable names and struct types differ.
24. Alias shape: record `const`, pointed-to type, array versus scalar, struct
    access and address-taken state in the idiom signature.
25. Evaluation order: persist statement and operand ordering when it affects
    display-list writes, postincrements, calls or volatile accesses.
26. Copy coalescing: capture source/destination pseudos, last-use position and
    the pass where a copy survives or disappears.
27. Local allocation: index quantity birth order, ties, copy preferences,
    death points and eligible hard-register class.
28. Global allocation: index weighted references, live length, conflicts,
    call crossings, preferences and already-occupied hard registers.
29. Caller-save behavior: retrieve donors by live-across-call pattern and
    save/reload placement, not merely by final callee-saved register set.
30. Reload: distinguish allocation swaps from reload inheritance and spill
    ordering; source permutations that address the wrong pass are noise.
31. Scheduler: record dependency edges, region boundaries, memory-reference
    ordinal and delay-slot candidate set around the first mismatch.
32. Combine: record whether a temporary copy was folded, the linked use and
    the natural C construct that kept or destroyed it.
33. Jump passes: classify branch inversion, if-conversion, duplicated exit
    tests and dead-condition deletion separately.
34. Reorg: retain filled delay-slot contents and branch-to-next deletion as a
    post-reload residual class.
35. Assembler macros: emulate only generic, independently demonstrated KMC /
    ASN64 behavior. The Madden HI/LO delay-slot fix is the model.
36. Literal pools: key donors by pool ownership, duplication, alignment,
    section-relative address and assembler expansion.
37. Jump tables: match table width, ownership, case normalization, default arm
    and section base together.
38. Compiler dumps: fingerprint transitions at loop, flow, combine, sched1,
    local/global allocation, reload, sched2 and reorg.
39. First divergent pass: route experiments using that pass rather than the
    final disassembly symptom.
40. Residual windows: index normalized 8-, 16- and 32-instruction windows with
    CFG role, live values, calls, relocations and literal classes.
41. Permuter seeding: mutate only source families compatible with the measured
    wall; the Tenchu documentation likewise limits permuter expectations to
    allocation/scheduling-scale near misses.
42. Negative basins: hash semantically equivalent variants that produce the
    same object so declaration-order and syntax families are not rerun.
43. Campaign freshness: stamp target, source, compiler and build hashes. The
    workbench literature identifies stale comparisons as a costly false proof.
44. Object collateral: after a function match, verify owned data, relocations,
    neighboring layout and full linked bytes where applicable.
45. Shiftability: distinguish a retail-layout byte match from hardcoded source
    assumptions that fail when surrounding layout changes.
46. Public project inventories: mine n64decomp, Decompals, GitLab mirrors and
    independent repositories; organization membership is not a completeness
    boundary.
47. Provenance: assembly credit requires positive evidence of handwritten
    origin; unusual instruction shape alone is not evidence.
48. Pure-C policy: classify inline asm, register bindings, raw instruction
    data and function-specific output rewriting as non-C even when bytes match.
49. Semantic naming: keep exactness independent from names and explanations;
    a byte match does not prove semantic interpretation.
50. Acceptance: the final oracle remains the pinned Madden unit context plus
    byte comparison; web confidence, similarity score and compiler folklore
    can only rank experiments.

### Evidence followed in this sweep

- The [Paper Mario GCC 2.8.1 tips](https://github.com/pmret/papermario/wiki/GCC-2.8.1-Tips-and-Tricks)
  explicitly connect symbol locality to delay-slot behavior and recommend
  condition inversion as a probe for branch-likely selection. These are tagged
  `gcc-2.8.1-adjacent`, not KMC facts.
- The [Tenchu permuter guide](https://github.com/Fuuzetsu/tenchu-decomp/blob/master/docs/permuter.md)
  limits the useful basin to already-correct functions with allocation or
  scheduling differences. Madden's farm should therefore reject structural
  candidates before spending permutation CPU.
- The [N64 decomp workbench](https://github.com/akratch/n64-decomp-workbench)
  documents target/source freshness, bounded campaigns, object collateral and
  shift audits. These support adding immutable build stamps and a post-match
  object/layout gate to Madden's idiom registry.
- The [decomp.me FAQ](https://www.decomp.me/faq) confirms that context,
  compiler and flags participate in compilation and that m2c output is only a
  starting point. A public scratch is therefore a donor bundle, not proof.
- The [n64decomp organization](https://github.com/n64decomp) and
  [Decompals organization](https://github.com/decompals) expose distinct
  corpora: game sources, matching libultra/ultralib, SDK tools, old compiler
  builds and compiler decompilation. The corpus builder should label these
  origins rather than flatten them.
- [OB64-Decomp](https://github.com/rempred/OB64-Decomp) documents a pinned KMC
  GCC 2.7.2 plus GNU binutils 2.6 context and distinguishes pure C from hybrid
  C. This independently supports Madden's compiler+assembler key and source
  policy.

### Madden priorities produced by the sweep

1. Build an upstream-source-order map for the still-assembly resident JPEG
   block at `0x8005D020..0x8005EE48`. Its position, neighboring exact IJG 6a
   routines, call graph and sizes make source-twin retrieval higher-value than
   generic permutation.
2. Extend `gpu_function_retrieval.py` with residual-window records and a
   compiler/pass compatibility filter. Whole-function similarity alone misses
   the small allocator and scheduler decisions that dominate current near
   misses.
3. Add translation-unit context to every corpus entry: internal/external
   declarations, owning section, literal/jump-table base, compile flags,
   assembler identity and upstream revision.
4. Route candidates through structure, instruction-count and first-divergent-
   pass filters before Desktop permutation. This should keep the compute farm
   on plausible allocation/scheduling basins.
5. Promote exact upstream-library matches into reusable ABI packs containing
   typedef widths, structs, callback prototypes and configuration macros—not
   just function bodies.
6. Preserve negative-basin hashes for unresolved tiny swaps such as
   `runtime_mode_supported`, `encoded_byte_lookup` and
   `active_record_values_rotate`.
7. Add a post-match collateral gate for owned `.rodata`, relocations and
   neighboring boundaries before progress credit.

## Locally verified GCC 2.7.2 source-shape idioms

### Redundant guarded refresh retains a copy without emitted branch code

`object_children_create` (`0x8000D5BC`, 0xC8 bytes) supplied a reusable
copy-coalescing and delay-slot pattern.  Plain C let CSE/Combine replace a
mutable count with its still-equal saved argument, deleting the retail
`addu $s1,$s2,$zero`; a later loop test likewise narrowed `$s1` directly
instead of first copying it to `$v0`.

The exact, assembly-free source shape was:

```c
remaining = saved_count;
head = global_head;
/* existing stores */
if (head != 0) {
    remaining = saved_count;
    head->previous = list;
}

current = remaining;
if (list != 0) {
    current = remaining;
}
if ((u16)current != 0) {
    remaining += saved_count;
    goto loop;
}
remaining += saved_count;
```

The repeated assignments do not emit extra retail instructions.  They keep
distinct pseudos through the early passes; jump cleanup removes the redundant
control-flow condition, and reorg can place the duplicated update in the
conditional branch's delay slot.  This took the function from score 10 to an
exact byte match while removing six hard-register bindings and an empty inline
assembly barrier.

Route a near miss to this family when all of the following are true:

1. the target has a register-to-register copy missing from the candidate;
2. the candidate substitutes a provably equal live value at later uses;
3. an already-semantic pointer/null condition is available near the copy; and
4. a loop update belongs on both branch outcomes or in a branch delay slot.

This is a measured KMC GCC 2.7.2 fact, not a general recommendation to add
opaque barriers.  Every application still requires the pinned unit matcher,
and the guard must remain ordinary C—no inline asm, volatile fabrication,
register binding, or output rewriting.

## Second 52-branch sweep

A second independent sweep on 2026-11-13 used 52 searches arranged as 13
four-way branches. It deliberately mixed primary compiler internals, matched
N64 sources, tool documentation, library identification, and adjacent
compiler families. Search results were used only to locate evidence; snippets
from search indexes and third-party summaries are hypotheses until reproduced
with Madden's compiler and matcher.

The branches and their actionable dispositions were:

1. GCC 2.7.2 register allocation: retain priority, copy preference, conflict,
   and hard-register eligibility as separate residual features.
2. KMC-specific idioms: require KMC reproduction; do not import IDO folklore.
3. GCC scheduling: index the first divergent scheduling region, not merely the
   final instruction sequence.
4. Exact-C methodology: compilation plus byte comparison remains the oracle.
5. `do { } while (0)`: catalogue both true macro wrappers and deliberate CFG
   shaping, with loop-note evidence.
6. Register-allocation documentation: capture `-dl` and `-dg` quantities for
   every register-only near miss.
7. `volatile`: distinguish authentic volatile objects from matching-only
   barriers; only the former is acceptable recovered C evidence.
8. Permuter practice: seed mutations from measured pass classification rather
   than applying every transform uniformly.
9. Paper Mario GCC 2.8.1: useful adjacent-family hypotheses, tagged GCC 2.8.1.
10. Mario Party family: mine repeated engine routines and translation-unit
    siblings before general tricks.
11. Dr. Mario 64: mine compiler/version and library twins, not names alone.
12. SSSV: retain source-line grouping and macro spelling as candidate features.
13. libjpeg: semantic identity plus original ABI declarations outranks local
    permutation; Madden's exact `jinit_d_post_controller` validates this.
14. libultra: transfer only revision-, compiler-, and flag-compatible bodies.
15. compression libraries: identify upstream version and configuration before
    attempting control-flow reconstruction.
16. audio/RSP code: separate CPU C, generated command data, and handwritten
    microcode provenance before progress credit.
17. `local-alloc.c`: store quantity birth order, ties, copy relations, and
    death points in the idiom signature.
18. `global.c`: store weighted references, live length, conflicts, call
    crossings, preferences, and permitted hard-register classes.
19. scheduler memory tracking: add memory-reference ordinal within the region;
    the 32-reference flush observed in Madden is a transferable fingerprint.
20. `combine.c`: record whether the divergent copy survives combine and why.
21. exit-test duplication: classify loop-tail mismatches before changing loop
    spelling.
22. invalid loops: record multiple-entry, forced-label, and setjmp evidence.
23. flow weighting: preserve loop-note depth separately from loop optimizer
    acceptance.
24. delay-slot reorg: distinguish branch deletion from condition deletion and
    retain the pre-reorg producer window.
25. KMC `li.d`: model assembler expansion as toolchain context, never as a
    function-specific normalizer.
26. ASN64 alignment: section-relative constant placement belongs in the unit
    signature.
27. SDK macro expansion: generic assembler behavior may be emulated only when
    demonstrated across independent functions.
28. literal pools: record ownership, duplication, alignment, and section base.
29. decomp.me presets: use scratches as candidate evidence, then reproduce
    locally with the exact Madden unit context.
30. decomp-permuter transformations: persist parent/child AST edit and score
    delta so successful transformations become donors.
31. Decompedia/compiler notes: use as routing metadata, not proof.
32. m2c: semantic draft only; decompiler artifacts are never provenance.
33. public score-zero examples: import only source/assembly pairs with compiler
    metadata and immutable revisions.
34. exact matches involving volatile: verify the source object is semantically
    volatile or hardware-facing before transfer.
35. goto-based matches: classify whether goto reconstructs original CFG or
    merely perturbs allocation.
36. `register` and `NON_MATCHING`: negative examples are useful for closing
    mutation basins but never receive credit.
37. cross-project similarity: normalize relocations, symbols, and literal
    addresses while retaining CFG and call-site shape.
38. binary similarity: combine opcode/funct shingles with dominator/loop and
    relocation features; no single embedding is sufficient.
39. idiom mining: learn transformations from verified source/binary pairs,
    partitioned by compiler family to prevent leakage.
40. pass classification: compare successive RTL dumps and label the earliest
    pass where target and candidate behavior must differ.
41. IDO matching tricks: retain as explicitly cross-compiler experiments only.
42. GCC-versus-IDO attribution: perform toolchain attribution before idiom
    retrieval.
43. KMC/IDO/SN provenance: compiler identity is part of each candidate key.
44. compiler flag corpora: store optimization, ABI, ISA, assembler, and
    translation-unit settings alongside every donor.
45. Rugrats: prioritize exact same-engine/library twins and verified shared
    toolchain behavior.
46. Madden public material: names and prior drafts are discovery aids, never
    substitutes for local ROM equality.
47. Hybrid Heaven: per-directory optimization and library identity show that
    project-wide compiler assumptions are too coarse.
48. Snowboard Kids 2: agent notes are useful experiment queues but require
    source and matcher confirmation.
49. Pokémon Snap: mine matched source only after recording compiler and unit
    settings.
50. Pokémon Stadium: use repeated engine and library functions as donors, with
    revision-specific verification.
51. Animal Forest: its strong segment/library organization is useful for
    semantic retrieval but compiler-family differences remain a hard boundary.
52. Excitebike 64: inventory first; do not infer relevance from platform or
    release year alone.

### New pipeline conclusions

- Add a **residual-window donor index**: 8, 16, and 32 instructions around the
  first mismatch, normalized for addresses but annotated with the earliest
  implicated GCC pass.
- Add an **RTL transition fingerprint** from loop, flow, combine, sched1,
  allocation, reload, sched2, and reorg dumps. Candidate idioms should be
  retrieved by the first transition that differs.
- Add a **semantic-source fingerprint** for known libraries: upstream version,
  configuration macros, ABI typedef widths, struct layouts, and callback
  prototypes. This would have routed `object_decode_state_create` directly to
  the successful libjpeg reconstruction. Madden's memory-manager ABI identifies
  the bundled release as IJG libjpeg 6a: `jpeg_memory_mgr` ends at
  `max_memory_to_use` and has no libjpeg 6b `max_alloc_chunk` member.
- Store **negative basins** as first-class results: target, compiler context,
  normalized AST family, object hash, and residual. This prevents repeated
  searches such as the already-closed declaration-order families.
- Rank an edit by conditional success: `P(exact | compiler, pass class,
  window signature, edit)`, not by global frequency.
- Require an immutable source revision and a locally reproduced score delta
  before a web-derived idiom enters the executable mutation library.

## Result

Madden already has strong function retrieval (`gpu_function_retrieval.py`),
candidate ranking (`gpu_permuter_ranker.py`), cross-project catalogues, and
parallel permutation. The missing layer is an **evidence-bearing idiom
registry** between retrieval and mutation. Today the tools can say that two
functions look alike, but do not reliably transfer the fact that a particular
C edit fixed a particular compiler-pass residual.

The registry should store a successful or exhaustively negative experiment as:

- compiler identity, frontend, assembler, flags, and translation-unit context;
- target/candidate instruction counts, CFG hash, opcode/funct shingles, call
  pattern, relocation classes, literal classes, frame and saved-register set;
- residual class before the edit: structure, schedule, local allocation,
  global allocation, reload, delay-slot, literal-pool, or relocation;
- normalized C-AST edit, including scope and line grouping;
- score delta and exact-match status;
- provenance: project, function, source revision, matcher command, and target
  digest;
- applicability and counterexamples. A lever measured on IDO must not silently
  become a KMC rule.

## High-value idiom families

### KMC/GCC 2.7.x

1. Loop spelling: pre/post increment or decrement, `while`, `do/while`,
   infinite loop plus `break`, and pointer cursor versus index. These affect
   rotation, exit-test duplication, loop notes, induction variables, and
   allocation weighting.
2. Copy/coalescing: cached field versus repeated field read, named temporary,
   chained assignment, in-place masking, old-value postincrement, and explicit
   pointer copy. These directly target `local-alloc.c` register tying.
3. CFG boundaries: label/goto, switch arm layout, explicit default/case values,
   nested blocks, and macro-like `do { } while (0)`. These alter basic blocks,
   scheduling regions, and whether loop optimization runs.
4. Types and aliasing: signedness, narrow locals, scalar versus array/global,
   `const` removal, pointer type, address-taken local, and struct-versus-word
   access. These affect load kind, alias freedom, CSE, and allocation.
5. Expression topology: compound assignment, reassociation, operand order,
   cast barriers, multiply versus shift, and division source form.
6. Lifetime and pressure: declaration scope, definition placement, call-crossing
   span, repeated live use, dead initialization that survives early passes,
   and local arrays/structs that establish the historical frame.
7. Link/assembler context: internal versus external symbol, literal ownership,
   section base/alignment, jump table ownership, and authentic generic ASN64
   macro expansion. These must be separated from function-specific rewriting.

### IDO and other compiler families

IDO results are useful as hypotheses, not direct rules. Especially valuable
are source-line grouping, preprocessor choice, register-pool versus temp-FIFO
classification, read-count priority dials, call-forbidden colors, taking a
local's address to remove it from coloring, and assembler-phase replay. The
same registry schema should retain these with `compiler_scope=IDO` so the
Madden KMC mutator can test them only as explicitly marked cross-compiler
experiments.

## Retrieval hierarchy

Use progressively weaker evidence and never auto-credit below byte equality:

1. byte-identical function twin;
2. relocation-normalized full-body twin with identical CFG and extent;
3. opcode/funct + CFG + call/literal signature;
4. local residual-window signature around the first divergence;
5. semantic/library identity (libultra, libjpeg, compiler runtime);
6. general compiler-family idiom.

The important extension to Madden's current whole-function retrieval is level
4. Near misses often share only the 8-32 instruction window around a compiler
decision. Index normalized windows by pre-pass-like traits: copy at last use,
branch/call boundary, loop latch, memory-reference count, live call arguments,
and delay-slot occupant.

## Immediate Madden experiments

### Evidence-first application order

An idiom is not a substitute for reconstructing the program.  Before replaying
an idiom, record the target's callers and callees, neighboring routines,
addressed objects, access widths, apparent structure strides, branch/loop
shape, and values live across calls.  Prefer types already demonstrated by an
exact neighboring producer or consumer.  Only then select idioms whose known
compiler-pass effect matches the target's first divergent pass.

For example, the `gameplay_event_prepare` investigation established from exact
neighboring C that `0x214C` is an 8,524-byte team-record stride, `0x5E` is a
94-byte secondary-record stride, and the final 23-entry loop updates the two
halves of the `MenuTables` object cleared by `func_80025AB8`.  Those facts are
reusable semantic evidence; anonymous pointer arithmetic or random declaration
permutations are not.

1. `object_decode_state_create`: resolved after the research pass. It is IJG
   libjpeg 6a `jinit_d_post_controller()`. Reconstructing the authentic
   `JDIMENSION`, `long`, controller, and memory-manager callback types produced
   the target's natural `$a3` to `$a1` carrier and an exact 240-byte plain-C
   match. Twenty-one CFG/expression variants and 24 incomplete type variants
   had all collapsed to the same score-5 basin. This is the clearest current
   evidence that semantic library identification and complete ABI types must
   precede allocator permutation.
2. `runtime_mode_supported`: classify the coherent `$v0/$v1` result/expected
   swap separately from its already-improved argument carrier. Search return
   carrier, conditional-expression, cached-global, and branch-layout donors.
   Twenty-four additional genuine-C variants preserved its exact 36-byte
   topology but converged on the same score-7 basin: the return pseudo remains
   in `$v1` because local allocation gives the comparison constant and XOR
   temporary `$v0`, making the final return copy uncoalescible.
3. `encoded_byte_lookup`: ABI reconstruction found that the original shape has
   a second formal parameter reused as the preserved input. The source-level
   `original -= original; original += index;` idiom naturally emits the
   previously unexplained `addu $a1,$a0,$zero` and reduces both 68-byte lookup
   twins from score 12 to score 4. The remaining residual is one `$v0/$v1`
   allocation swap around the special-table address calculation.
4. `nested_flag_clear`: declaring the flags field itself `volatile` (rather
   than using an empty-asm memory barrier) reproduces the final `nop`, restores
   exact size, and reduces score 10 to score 4. Only the placement of the
   independent `~1U` materialization remains.
5. `object_global_flag_test`: reusing the byte state variable as the eventual
   result, with the nonzero arm written first, reduces the exact-size residual
   from score 8 to score 2. The entire global-mask/result path is now exact;
   only the initial `lbu` and `bnez` use `$v0` instead of target `$v1`.
   Plain `register`, union, pointer, volatile-input, inline-helper, and
   assignment-in-condition forms all preserve that two-register basin.
6. `active_record_values_rotate`: its exact-size residual is a four-register
   reversal (`$v1,$a0,$a1,$a2` versus `$a2,$a1,$a0,$v1`). Formal-parameter,
   declaration-order, comma-expression, and nested-assignment experiments all
   compile into the same allocator basin, so this is now a negative-basin
   example rather than an open-ended source-order search.
7. `byte_sequence_initialize`: structured, mixed-goto, formal-parameter,
   reversed-declaration, nested-scope, and self-cancellation variants all
   preserve the exact 80-byte instruction topology but converge on one
   `$a0/$v1` swap. The mixed-goto tests disprove the initial hypothesis that
   removing only the inner loop notes changes the allocation. Treat loop-note
   mutations as closed for this target until an RTL donor shows a different
   pre-global-allocation reference profile.
8. Tiny assembly rows containing only an unconditional jump are not automatic
   C quick wins. GCC 2.7.2 emits a normal 0x18-byte call frame for the tested
   `call_80092B48_enabled`, `call_800B3334`, and `func_800B28B4` C wrappers;
   their two-instruction tail jumps therefore need boundary/provenance review
   rather than being mislabeled as matching compiler-generated C.
9. The remaining assembly-assisted C bytes: cluster by escape mechanism and
   residual signature. Function-specific normalizers are not idioms and cannot
   receive genuine-C credit; their names are useful labels for the missing
   source-level effect.
10. Transfer exact sibling implementations before permutation. Parameterized
   routines and same-size overlay siblings should be grouped first, compiled
   in the real Madden context, and accepted only at score zero.
11. Record negative basins. Hundreds of variants collapsing to the same object
   hash should close that idiom family for that target instead of being counted
   as continuing progress.
12. `object_stream_update` and `object_stream_create`: resolved as libjpeg 6a
    `realize_virt_arrays()` and `jinit_memory_mgr()`. Restoring the original
    structures, `long`/`JDIMENSION` types, callback prototypes, and source shape
    removed all register bindings while preserving exact 700-byte and 316-byte
    text respectively. The absent `max_alloc_chunk` member distinguishes the
    bundled ABI from libjpeg 6b and gives the remaining JPEG cluster a precise
    upstream version.
13. `object_stream_initialize` and `object_stream_complete`: resolved as the
    same release's `alloc_small()` and `free_pool()`. Authentic pool-header,
    error-manager, backing-store, and private-memory-manager layouts compile to
    exact 456-byte and 388-byte text. This also removes two function-specific
    normalizers and shows that their scheduling residuals were symptoms of
    incomplete ABI/source reconstruction rather than assembler behavior.
14. `object_stream_pointer_blocks`: both manifest instances resolve to libjpeg
    6a `alloc_sarray()` and `alloc_barray()`. Preserving the typed pointer-row
    arithmetic naturally produces the byte/128-byte strides, matches 304 and
    320 bytes exactly, and removes the shared prologue-order normalizer.
15. `object_stream_chunk_apply`: both manifest instances resolve to libjpeg 6a
    `do_sarray_io()` and `do_barray_io()`. Typed backing-store callbacks and
    virtual-array controls produce exact 304-byte and 308-byte bodies without
    register bindings or disabling the generic branch/nop reorder pass.
16. The contiguous `jquant1.c` block confirms four more exact upstream
    routines: `index_planes_accumulate` = `color_quantize()`,
    `indexed_rgb_accumulate` = `color_quantize3()`,
    `image_planes_accumulate` = `quantize_ord_dither()`, and
    `image_rgb_rows_accumulate` = `quantize3_ord_dither()`. Authentic
    `jpeg_decompress_struct` and `my_cquantizer` offsets compile to 152, 164,
    300, and 320 bytes exactly and remove every register binding plus the
    RGB-accumulate function-specific normalizer.
17. The remainder of the same block identifies `object_table_process` as
    `quantize_fs_dither()`, `object_children_allocate` as
    `alloc_fs_workspace()`, and `image_table_update` as
    `start_pass_1_quant()`, `image_runtime_initialize` as
    `jinit_1pass_quantizer()`, and `object_shared_buffers_assign` as
    `create_odither_tables()`, and `image_scale_table_build` as
    `make_odither_array()`, `image_table_finalize` as `select_ncolors()`,
    `func_800600E0` as `output_value()`, `func_8006012C` as
    `largest_input_value()`, and `image_table_decode` as
    `create_colorindex()`. Exact restoration of
    `FSERROR`, the quantizer
18. The adjacent `jdcolor.c` block follows the same source-order reuse:
    `image_decode_tables_initialize` is IJG libjpeg 6a
    `build_ycc_rgb_table()`. The authentic four-table layout and fixed-point
    constants compile byte-exactly and remove `KMC-IMAGE-TABLE-INIT`.
19. `image_rgb_rows_decode` is the immediately following IJG
    `ycc_rgb_convert()`. Preserving the authentic `register` hints without
    hard-register bindings reproduces all 316 bytes and removes
    `KMC-IMAGE-RGB-DECODE`.
20. `tiled_columns_copy` is IJG `null_convert()`. The authentic nested
    component/column loops match all 140 bytes without the prior unexplained
    volatile dummy local.
21. `image_rgba_rows_decode` is IJG `ycck_cmyk_convert()`. Its authentic
    four-plane loop matches all 352 bytes with ordinary `register` hints and
    removes `KMC-IMAGE-RGBA-DECODE`.
22. Moving backward into `jdsample.c`, `image_rows_expand_repeated` is
    `int_upsample()`. The real `jpeg_upsampler` has three public words
    (including `need_context_rows`); with that ABI fixed, the upstream loop
    matches all 284 bytes and removes `KMC-ROW-GROUP-LOOP-SCHEDULE`.
23. `image_rows_expand_horizontal` is IJG `h2v2_upsample()`. The direct
    upstream loop matches all 220 bytes and eliminates its unexplained
    volatile padding local.
24. `byte_plane_filter` is IJG `h2v1_fancy_upsample()`. The canonical
    interpolation loop matches all 236 bytes and removes every m2c field
    macro and hard-register binding.
25. `image_plane_process` is IJG `h2v2_fancy_upsample()`. Retaining the
    upstream statement boundaries and ordinary register hints matches all
    388 bytes and removes `KMC-IMAGE-PLANE-PROCESS`.
26. `image_plane_decode` is IJG `sep_upsample()`. The proven three-word
    upsampler ABI, 0x54-byte component stride, and callback types reproduce
    all 400 bytes with no register binding or inline asm.
27. `image_plane_transform` is IJG `jinit_upsampler()`. Its authentic source
    matches all 840 bytes after correcting a generic ASN64 emulator bug: an
    automatically inserted branch delay-slot `nop` must consume one HI/LO
    hazard slot. The reusable toolkit patch is recorded at
    `docs/patches/n64-decomp-kit-asn64-hilo-delay.patch`; no function-specific
    output rewrite remains.
    layout, and the unsigned `J_DITHER_MODE` carrier produces 532-, 140-, and
    376-byte matches and removes two more function-specific normalizers.
28. `object_active_children_update` demonstrates that an empty inline-asm
    value barrier can be evidence of a missing `volatile` declaration rather
    than an irreducible compiler quirk. Declaring the external `u16` loop bound
    volatile makes GCC retain the initial `sltu`, keeps the byte-state range
    checks, and reproduces all 120 bytes from ordinary C. This also removes
    `KMC-PRELOAD-BOUND-SAVE-DELAY`; volatility should therefore be tested on
    the accessed object or global before introducing register bindings or a
    scheduling normalizer.
29. `active_record_values_rotate` is a negative allocator basin with a useful
    boundary: forward volatile loads preserve the exact instruction order but
    reverse four registers, while reverse volatile loads produce the target
    register assignment but reverse the four load offsets. Mixed
    nonvolatile/volatile access reorders the loads but extends live ranges and
    introduces additional temporaries. Declaration order, dead initializers,
    formal self-cancellation, structs, unions, and mixed pointer qualifiers do
    not decouple pseudo creation order from volatile memory order in GCC 2.7.2.
30. `nested_flag_clear` isolates two independent source-shape effects. Making
    the flags object genuinely volatile prevents reorg from filling the return
    delay slot with its store, reducing the ordinary-C residual from score 10
    to score 4. Placing only the mask assignment in `do { ... } while (0)`
    moves `addiu mask,-2` to the target's first instruction, but changes the
    mask/object allocation from `$v1`/`$a0` to `$a0`/`$v1` (score 5). Typed
    structs, array fields, block scope, declaration order, ordinary `register`,
    a K&R parameter, dead initialization, and labels did not decouple those
    choices. This is a reusable final-mile test case for shape-guided search:
    volatile memory semantics control delay filling, while the zero-trip
    wrapper controls scheduling regions and pseudo allocation.

## Pipeline changes

- Add `build/research/idiom_registry.jsonl` with immutable experiment rows.
- Teach the matcher to emit a normalized residual fingerprint and compiler-pass
  classification.
- Extract AST edits between parent and child candidates; normalize identifiers,
  addresses, and literal symbols while preserving types, scopes, and line
  grouping.
- Add a donor stage to `build_desktop_jobs.py`: retrieve local residual-window
  donors, replay only applicable edits, then seed bounded permutation.
- Train/rank on score improvement and exact-match probability, but keep compile
  plus byte comparison as the sole acceptance test.
- Add `negative_basin` records and stop rules per target/edit family.
- Keep exact source and target digests in every row so HEAD changes make stale
  evidence ineligible rather than silently reusable.

## Primary evidence consulted

- GCC 2.7.2.3 source: [local allocation](https://sources.debian.org/src/gcc/2.7.2.3-7/local-alloc.c),
  [loop optimization](https://sources.debian.org/src/gcc/2.7.2.3-7/loop.c), and
  [jump optimization](https://sources.debian.org/src/gcc/2.7.2.3-7/jump.c).
- [decomp-permuter](https://github.com/simonlindholm/decomp-permuter) manual and
  random transformation model.
- [Paper Mario GCC 2.8.1 matching notes](https://github.com/pmret/papermario/wiki/GCC-2.8.1-Tips-and-Tricks).
- [Snowboard Kids 2 decompilation project](https://github.com/cdlewis/snowboardkids2-decomp).
- [N64 decomp workbench field guide](https://github.com/akratch/n64-decomp-workbench/blob/main/docs/field-guide.md),
  used only with compiler-family qualifiers.
- [decompdecomp guide](https://github.com/n-delic/decompdecomp/blob/main/docs/GUIDE.md)
  for exact-twin transfer and compiler-verified automation.
- [cross-project matching design](https://github.com/tangOS-decomps/pictochat-decomp/blob/main/notes/cross-project-matching.md).
- [gameDecomp pipeline](https://github.com/GrantGallun/gameDecomp) for immutable
  binary evidence, deterministic repair, and complete attempt logging.
- [Hybrid Heaven libultra transfer notes](https://github.com/ogdanimal/HybridHeaven-Decomp)
  for library identity, per-directory optimization levels, and function order.
