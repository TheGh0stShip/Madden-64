# Upstream research audit

The reproducible upstream campaign evaluates 500 independently ranked
repositories selected from 1,262 unique search results. Run it with
`make research`; the detailed ledger is written under `build/research` and is
not a release artifact.

The campaign searches matching-decompilation, Nintendo 64, MIPS, compiler,
binary-splitting, comparison, and static-recompilation sources. Each round
records one unique repository, its update time, topics, implementation
language, and relevance signals. Duplicate results from separate queries do
not count as additional rounds.

This campaign extends three earlier audits: 50 title/engine searches, 52
matching and format searches, and 250 searches across completed N64 projects,
compiler internals, EA/Tiburon siblings, assets, signatures, function
discovery, and reporting. The combined research history therefore includes
852 explicit passes or rounds, with the newest 500-round ledger independently
reproducible.

## Findings applied to Madden Football 64

- RSP research isolated the first two components inside the formerly opaque
  resident microcode interval. The 204-byte task bootstrap matches the standard
  SDK control flow and now has an exact in-tree assembly reconstruction. The
  following 5,168 bytes are byte-identical to the F3DEX FIFO program in the
  contemporary BattleTanx image. SDK documentation confirms that boot,
  graphics, and audio programs are separately linked text/data objects; the
  remaining bytes are therefore retained as unresolved microcode/data rather
  than credited speculatively.
- A whole-backlog byte sweep compared all 1,799 unmatched candidates of at
  least 16 bytes against the reconstructed BattleTanx, Rugrats, and Global
  Assault images and the verified Nagano image. Four independent corpus rounds
  isolated thirteen callable shared-entry, frame-restore, and argument-spill
  units totaling 304 bytes. Each was then decoded, classified against its
  incoming calls or branches, reconstructed as assembly, and verified against
  its correct overlay image. Repeated sequences with no unique ownership were
  not used as source-provenance claims.
- Follow-up compiler and process research confirmed that orphan epilogues and
  alternate mid-function entries must be represented explicitly instead of
  forced through C. The project now supports separate exact-assembly manifests
  for both overlays, allowing future shared-tail batches to be verified without
  weakening the C-manifest rules.
- KMC GCC 2.7.2 remains the correct dominant game-code compiler. Upstream KMC
  examples corroborate `-G0 -mgp32 -mfp32 -mips3`; this project additionally
  preserves its verified `-O2` and R4300 multiply assembler behavior.
- IDO remains limited to identified SDK/library objects. Sweeping IDO over the
  resident game functions would waste compile cycles and blur compiler
  provenance.
- Random source permutation is useful after a candidate already differs only
  in register allocation or scheduling. It is not a substitute for recovering
  correct structure sizes, signedness, control flow, or relocation targets.
- Relocation-aware instruction classification should remain the first triage
  step. Register-only and scheduling-only candidates are the best bounded
  search inputs; size and control-flow mismatches require manual correction
  first.
- Whole-object reports are valuable for publication, but ROM-linked byte
  verification remains the authority for matching credit.
- Data matching needs a first-mismatch scanner ordered by ROM address. This is
  the most promising upstream process improvement not yet present in the
  repository.
- Batch campaigns should preserve compiler flags and symbol inputs with every
  candidate so interrupted searches can be reproduced exactly.

## Direct-transfer result

No public upstream containing Madden Football 64 game-function source, a
matching sibling N64 Madden project, or verified game-specific function bodies
was found in the 500 rounds. Madden Football 64 was developed by EA Tiburon,
but public projects from unrelated engines are useful for tools and SDK
identification only; their game code is not treated as transferable evidence.

Earlier exact-title, `N8ME`, loader-address, archive-address, container-name,
and sibling-title searches reached the same result. No independent parser for
the `TNMF`, `TMot`, or `TSpr` containers was found. Searches covering NASCAR,
NHL, FIFA, World Cup, and Knockout Kings N64 releases likewise produced no
source-compatible engine.

## Highest-value primary sources

- [Splat](https://github.com/ethteck/splat) for KMC-aware binary splitting and
  compiler metadata.
- [decomp-permuter](https://github.com/simonlindholm/decomp-permuter) for
  bounded source-variation searches on structurally correct near matches.
- [objdiff](https://github.com/encounter/objdiff) for object and progress
  comparison formats.
- [m2c](https://github.com/matt-kempster/m2c) for producing initial MIPS C
  structure that must still be corrected and byte-verified.
- [Mario Golf 64](https://github.com/monde-lointain/mariogolf64) and
  [Snowboard Kids 2](https://github.com/cdlewis/snowboardkids2-decomp) for
  current KMC project layouts and verification workflows.
- [n64-decomp-workbench](https://github.com/akratch/n64-decomp-workbench) for
  reproducible mismatch campaigns and relocation-aware triage.
- [gameDecomp](https://github.com/GrantGallun/gameDecomp) for unattended,
  checkpointed function-campaign design.
- [libreultra](https://github.com/n64decomp/libreultra),
  [SDK tools](https://github.com/n64decomp/sdk-tools), and the
  [IDO 5.3 package](https://github.com/n64decomp/ido5.3_cc) for identified
  runtime-library code.
- [xsig](https://github.com/Druthulu/xsig) for relocation-masked signatures
  when raw cross-project comparisons are inappropriate.
- [fn64](https://github.com/fn64/fn64) for conservative function-boundary
  discovery and explicit false-start control.
- [lfgfx](https://github.com/ethteck/lfgfx) for F3DEX display-list inspection
  within Madden model containers.
- [vgmstream](https://github.com/vgmstream/vgmstream) for comparison against
  documented EA audio containers and codecs.

## Format and binary-transfer evidence retained from earlier campaigns

- `lfgfx` was tested against an uncompressed Madden `TNMF` record. With the
  container segment base it resolves the 32-byte header, F3DEX commands,
  vertices, palette, and texture payload at offsets held by the file. This is
  structural evidence, not asset-reconstruction credit.
- Madden's 237 audio records lack the `SCHl`, `SCDl`, and related signatures
  used by the later EA formats documented in `vgmstream`; that decoder is not
  directly applicable.
- A local KMC-built WWF War Zone image was compared function-by-function with
  Madden. Its nontrivial exact collisions were SDK/library code already
  covered by the current runtime work; the only game-region leaf transfer was
  the verified early no-op already present in this repository.
- A local Nagano Winter Olympics '98 image is predominantly IDO-built and is
  not a useful compiler or engine match for Madden's KMC game code.
- Same-image raw-body comparison found an exact resident channel-call family
  and produced a verified match. Raw identity remains the strongest source
  reuse evidence available for this title.

## Next process improvements

1. Add a ROM-ordered initialized-data mismatch command.
2. Feed register-only and scheduling-only candidates to bounded permutation
   campaigns in groups.
3. Store candidate compiler/symbol fingerprints so stale results are rejected.
4. Add normalized instruction-family fingerprints for cross-project SDK and
   runtime matching without mistaking shared libraries for game code.
5. Keep the physical ROM map, runtime virtual maps, and 32-bit offset envelope
   as separate address spaces in every report.

## Relocation-normalized SDK sweep

A cross-project fingerprint pass compared 1,786 remaining Madden candidates
against 2,561 verified functions from three public N64 projects. Exact
relocation-normalized signatures produced no transfers, while a second pass
using opcode three-gram similarity isolated three high-confidence runtime
library candidates. Source and compiler experiments then established exact
ROM matches for `osLeoDiskInit` (256 bytes), `osPfsRepairId` (608 bytes), and
`osCartRomInit` (240 bytes).

The cart initialization result also captured a version-specific distinction:
Madden's routine does not initialize the handle's `speed` field. Retaining the
store used by another SDK revision caused instruction, scheduling, hazard, and
branch displacement differences. Removing only that store yielded the exact
240-byte body. This confirms structural fingerprints are valuable as a batch
triage tool, but final credit must continue to require byte equality against
the Madden ROM.

## Startup-entry structural transfer

The next relocation-masked pass compared 634 remaining resident bodies with
2,476 verified functions from BattleTanx, Rugrats, and Nagano. The only exact
instruction-shape result was Madden's 60-byte startup entry. Independent
BattleTanx and Rugrats implementations confirmed the same stack setup, BSS
clear loop, entry call, and terminal break sequence. Broader public searches
also confirmed that N64 projects conventionally isolate this startup assembly
as an entry object, including [Mario Kart 64's linker layout](https://github.com/n64decomp/mk64/blob/master/mk64.ld)
and the [N64 decompilation project collection](https://github.com/n64decomp).

The integrated Madden version preserves its actual stack top, BSS interval,
and call target and matches `0x80000440..0x8000047B` byte for byte. The absolute
call instruction is encoded explicitly because this GNU assembler path treats
the numeric jump operand as a relocation against address zero; mnemonic form
therefore did not reproduce the linked ROM word.

## Blocking ROM DMA transfer

The same structural batch ranked `0x800329B8` against BattleTanx's synchronous
ROM reader. Follow-up comparisons with the public Mario Kart 64 and Super
Mario 64 DMA implementations confirmed the standard `osPiStartDma` followed
by blocking `osRecvMesg` pattern, while Madden's disassembly showed a distinct
per-call message queue and no cache invalidation inside this routine.

Compiler experiments recovered the exact local ordering and the actual
destination-first interface. Madden rounds the requested byte count to an even
value, creates a one-entry queue, starts the transfer, and waits for completion.
The resulting KMC GCC source matches all 148 bytes at `0x800329B8`.
