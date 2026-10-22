# Upstream research

Three independent research campaigns were performed against public repository
indexes, source trees, technical forums, and project histories, followed by
binary comparison against locally available N64 titles. The first sweep used
the fifty title- and engine-focused passes below. A second sweep used 52
distinct searches focused on matching automation, compiler behavior, boundary
recovery, overlays, audio, graphics, asset formats, and cross-project reuse. A
third campaign added 250 distinct searches across completed N64 projects,
KMC GCC 2.7.2 internals, EA/Tiburon sibling titles, graphics and audio formats,
signature transfer, function discovery, historical documentation, and tracker
reporting.
The purpose was to find reusable source, symbols, formats, compiler settings,
and tooling rather than assume that games from the same period share an engine.

| Pass | Search focus | Result |
|---:|---|---|
| 1 | Madden Football 64 repositories | No prior decompilation found |
| 2 | Madden 64 N64 repositories | No source project found |
| 3 | Madden64 decompilation | No source project found |
| 4 | EA N64 decompilations | No Madden-family result |
| 5 | Tiburon N64 engine | No public engine source found |
| 6 | EA Sports N64 reversing | No usable source result |
| 7 | Madden N64 tools | No extractor or symbol map found |
| 8 | TNMF format | No independent format implementation found |
| 9 | TMot format | No independent format implementation found |
| 10 | TSpr format | No independent format implementation found |
| 11 | Exact title on GitHub | Only this repository was relevant |
| 12 | Exact short title on GitHub | No upstream decompilation found |
| 13 | Madden64 repository names | No upstream decompilation found |
| 14 | Current repository identity | Confirmed as the only matching project |
| 15 | TNMF source-code signatures | No external parser found |
| 16 | TMot source-code signatures | No external parser found |
| 17 | TSpr source-code signatures | No external parser found |
| 18 | Type-1 LZ naming | No matching implementation found |
| 19 | PI register sequence `A4500010` | Generic N64 boot usage only |
| 20 | PI register sequence `A4500014` | Generic N64 boot usage only |
| 21 | Loader address `802004DC` | No published symbol/source hit |
| 22 | First archive address `B00012D0` | No published format hit |
| 23 | Exact title in indexed code | No independent code hit |
| 24 | Product code `N8ME` | No source or symbol map found |
| 25 | N64 decompilation tools | Found Splat and m3c |
| 26 | N64 decompilation projects | Found mature build-layout references |
| 27 | N64 reverse-engineering tools | Found Ghidra and ROM-splitting references |
| 28 | EA Sports PlayStation decomps | No transferable Madden source found |
| 29 | NASCAR 99 N64 | No decompilation found |
| 30 | NHL 99 N64 | No decompilation found |
| 31 | FIFA 99 N64 | No decompilation found |
| 32 | World Cup 98 N64 | No decompilation found |
| 33 | Knockout Kings 2000 N64 | No decompilation found |
| 34 | Beetle Adventure Racing | Found an active matching decompilation |
| 35 | N64 KMC compiler projects | Existing local KMC toolchain remains best fit |
| 36 | GCC 2.7.2 KMC usage | Confirmed relevant compiler family |
| 37 | KMC toolchain packaging | No better package than the current toolchain found |
| 38 | EA Sports compiler evidence | No published Madden build configuration found |
| 39 | EA N64 source releases | No applicable source release found |
| 40 | Madden reverse engineering | No independent symbol work found |
| 41 | Madden modding tools | No N64-specific tooling found |
| 42 | Madden roster editors | No ROM-format implementation found |
| 43 | Madden file formats | No technical specification found |
| 44 | Madden ROM hacking | No code or data map found |
| 45 | NFL 64 decomps | No applicable project found |
| 46 | EA Tiburon source | No public N64 source found |
| 47 | EA Canada N64 projects | No shared-source project found |
| 48 | NASCAR 2000 N64 | No decompilation found |
| 49 | NHL 2000 N64 | No decompilation found |
| 50 | N64 sports-game decomps | No closer engine relative found |

## Validated upstreams

- [Splat](https://github.com/ethteck/splat) is a useful reference for eventual
  linker and segment reconstruction, but the current byte-ledger already gives
  Madden more exact packed-ROM coverage than a generic split configuration.
- [m3c](https://github.com/ethteck/m3c) is relevant for generating and permuting
  initial C candidates. The current matching pipeline already exposes the same
  core workflow, so adopting another build layer would not itself add matches.
- [libreultra](https://github.com/n64decomp/libreultra),
  [SDK tools](https://github.com/n64decomp/sdk-tools), and the
  [IDO 5.3 package](https://github.com/n64decomp/ido5.3_cc) remain authoritative
  references for the resident SDK portion.
- [Beetle Adventure Racing](https://github.com/synamaxmusic/bar-decomp) provides
  strong examples of relocatable N64 modules and asset loaders. Binary and
  source inspection found a different Paradigm module/file system, not Madden's
  archive formats, so its game code is not being imported.
- [xsig](https://github.com/Druthulu/xsig) demonstrates relocation-masked
  signatures for proving shared MIPS functions across projects. Madden's
  present same-image search can use the stricter raw-byte form immediately;
  cross-project masking remains useful once relocatable object listings are
  available for closer KMC relatives.
- [Turok 2](https://github.com/mgrz18/turok2-decomp) provides two applicable
  workflow patterns: bulk screening of small m2c drafts and explicit rejection
  of candidates that do not contain a complete return path. Its engine and
  compiler are different, so its source is not imported.
- [n64-decomp-workbench](https://github.com/akratch/n64-decomp-workbench)
  documents compiler-difference classification and reproducible search
  campaigns. Its register, frame, and scheduling diagnostics are applicable
  to near matches without changing Madden's existing byte gate.

## Applied findings from the second sweep

The useful results were applied as constraints rather than treated as progress
by themselves:

- Function-family grouping found repeated resident wrappers and return-value
  leaves. One generic C body is now compiled under explicit function/callee
  macros for each address, and every instance is independently byte-checked.
- Candidate selection now rejects catalogue entries marked `invalid` or
  `falls_through` before quick-win work. Direct disassembly confirmed that
  several tempting 8- and 12-byte entries are internal basic blocks, not
  functions.
- Exact raw-byte families are preferred inside this image. Relocation-masked
  comparison is reserved for cross-project objects where relocation records
  distinguish addresses from genuine constants.
- Bulk m2c screening is the next automation target, but generated drafts will
  receive no progress credit unless the existing compiler and ROM comparison
  gate reports an exact match.

## Findings from the 250-search campaign

- The public Madden-specific trail remains sparse. No independent Madden 64
  source tree, symbol map, archive parser, or implementation of the `TNMF`,
  `TMot`, or `TSpr` containers was found. Searches for sibling EA N64 titles
  also produced no source-compatible game engine.
- [lfgfx](https://github.com/ethteck/lfgfx) was validated directly against an
  uncompressed Madden `TNMF` record. With the container's segment base, it
  resolves the record into a 32-byte header, an F3DEX display list, vertices,
  a 512-byte palette, and texture payload at the offsets stored by the file.
  This is useful structural evidence, but is not reconstruction credit.
- [vgmstream](https://github.com/vgmstream/vgmstream/blob/master/src/meta/ea_schl.c)
  documents EA's later `SCHl` block format and both N64 codec identifiers.
  Madden's 237 audio records do not contain the `SCHl`, `SCDl`, or related
  block signatures, so that decoder is not directly applicable to this title.
- [mips-gcc-2.7.2](https://github.com/decompals/mips-gcc-2.7.2) remains the
  best source-level reference for KMC-tailored register allocation, scheduling,
  reload, combine, and delay-slot behavior. Compiler-pass inspection is more
  useful for stubborn near matches than changing the established toolchain.
- [fn64](https://github.com/fn64/fn64) demonstrates a conservative function
  discovery policy that measures recall while accepting no known false splits.
  Madden now applies the same principle operationally: the candidate-ranking
  tool joins each overlay catalogue with its retained boundary findings and
  excludes contradicted starts before proposing small unmatched functions.
- [objdiff](https://github.com/encounter/objdiff) confirms that code, data, and
  per-object progress should remain separate measures. The public report keeps
  catalogued assets outside matching credit and does not turn research coverage
  into completed units.

Run `make candidates` to list the smallest credible unmatched overlay entries.
The list is a work queue only; each item still requires disassembly review and
the normal exact-byte gate.

## Binary comparison

Two locally available 1998 titles were surveyed with the same tooling. Nagano
Winter Olympics '98 is approximately 98.3 percent IDO game code and is a poor
compiler match. WWF War Zone is approximately 94.2 percent KMC game code and
was therefore compared function-by-function against Madden.

The WWF comparison found extensive identical SDK/library routines, all already
covered or named by the existing SDK work. Outside Madden's SDK address range,
the only nontrivial exact whole-function collision was the leaf routine at
`0x8000047C`. It is now represented by `src/code/early_noop.c` and verified by
the normal matching gate. This comparison is useful as a quick-win filter, but
does not support treating WWF as a shared-engine source tree.
