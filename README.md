# Madden Football 64 decompilation

[![Whole-program code](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=Whole-program%20code&measure=matched_code_percent)](https://bytematch.dev/TheGh0stShip/Madden-64)
[![Whole-program initialized data](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=Whole-program%20initialized%20data&category=program_data&measure=matched_data_percent)](https://bytematch.dev/TheGh0stShip/Madden-64)
[![Matching functions](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=Matching%20functions&measure=matched_functions)](https://bytematch.dev/TheGh0stShip/Madden-64)

Matching decompilation of **Madden Football 64** for Nintendo 64, USA Rev 0.
The project is in its initial recovery phase. It verifies the retail ROM,
emulates the game's packed-program loader, catalogues provisional function and
data boundaries, and byte-verifies reconstructed translation units.

No ROM or extracted game data should be distributed with this project.

## Supported ROM

- Internal title: `MADDEN 64`
- Game code/revision: `N8ME`, Rev 0
- Format/size: big-endian `.z64`, 12 MiB
- CRC1/CRC2: `13836389` / `265B3C76`
- SHA-1: `b0de34b759f18ad86d39a4c68c9840d35ce25809`
- SHA-256: `39f25dad3af4782a909bf58d7127acae700ea7c6f17c48d39ab76fe331735d6f`

## Current evidence

Madden's IPL loads a packed block at ROM `0x1318..0x46C00`. Emulating the
game's decompressor recovers the initialized program at
`0x80000400..0x800776C0` (488,128 bytes), followed by BSS through
`0x8008B8E0`. The corrected resident-program catalogue has 1,370 provisional
function boundaries and identifies 147 libultra routines. Its compiler fingerprint is
predominantly KMC GCC, while detected library code is IDO-built.

A complete physical ROM sweep identifies 1,353 file records in fourteen
non-empty archives. It splits the loader, resident image, both executable
overlays, separate overlay data, every archive table, each payload's logical
length, and alignment padding. See [the ROM layout audit](docs/ROM_LAYOUT.md)
for the gap-free map and per-archive counts and sizes.

Eight hundred twenty-eight reviewed C compilation units fully cover 950 catalogued function
candidates and currently match 87,640 whole-program code bytes and 496 data bytes exactly, including the
contiguous `memcpy`, `strlen`, and `strchr` implementation. Automated
boundaries are research leads, not decompilation credit, until a source unit is
compiled and compared byte-for-byte.

## Commands

The local `n64-decomp-kit` checkout and the matching toolchains reused from the
BattleTanx project are the current development dependencies. Their locations
can be overridden through `N64DK_ROOT` and `N64DK_PYTHON`; toolchain paths are
configured in `n64dk.toml`.

```sh
make verify
make survey
make audit
make match-c
make match-asm
make match
make check
make report
```

`make survey` writes ROM-derived artifacts under `build/us/survey`. Because the
retail program is packed, `make match` first creates
`build/us/main_unpacked.z64`, an analysis-only linear wrapper around the
recovered executable. It must never be mistaken for or distributed as a game
ROM.

`make match-c` is the decompilation gate and verifies only compiled `.c`
sources. `make match-asm` separately verifies assembly reference units.
`make match` runs both without combining their progress totals.

## Architecture

The target is the Nintendo 64's big-endian MIPS R4300 (o32 ABI), not the x86-64
development host. On-disk structures use explicit-width integers and explicit
big-endian decoding. Host tests do not by themselves prove target correctness;
matching status requires target compiler output to equal the recovered retail
program bytes.

## Progress tracking

Every push to `main` publishes an objdiff v2 artifact named `N8ME_report` and
uploads the same report to decmp.dev. The report is generated from the reviewed
matching manifests and audited ROM survey totals without requiring a copy of
the retail ROM. Public history and progress are available on
[ByteMatch](https://bytematch.dev/TheGh0stShip/Madden-64) and
[decmp.dev](https://decmp.dev/TheGh0stShip/Madden-64). The root
`.recomp.json` supplies the project metadata consumed by
[recomp.fyi](https://recomp.fyi/), and the project is indexed by
[unbaked.games](https://unbaked.games/games/madden-football-64/). DecompHub consumes the repository-owned
[scoped progress data](decomphub.progress.json); its tracks remain separate and
are never averaged into an overall percentage.

Progress is reported by evidence class; the code percentage is not an overall
project percentage. Current audited measures are:

| Measure | Verified or identified | Scope | Progress |
|---|---:|---:|---:|
| Matching decompiled C code | 108,200 bytes | 753,428 bytes | 14.36% |
| Assembly-assisted C reference coverage | 296 bytes | 753,428 bytes | 0.04% |
| Matching assembly reference coverage | 456,044 bytes | 753,428 bytes | 60.53% |
| Whole-program initialized data | 496 bytes | 484,540 bytes | 0.10% |
| C-decompiled function candidates | 1,094 | 2,820 | 38.79% |
| Physical ROM mapping | 12,582,912 bytes | 12,582,912 bytes | 100% |
| Archive record inventory | 1,353 records | 1,353 records | 100% |
| Physical content classification | 1,353 records | 1,353 records | 100% |

The program denominator covers the loader, resident executable, both overlays,
and their initialized data records. Matching `.s` units are retained as useful
reference coverage but never count as C decompilation. C units containing
instruction-emitting inline assembly are likewise tracked separately and receive
no C-decompilation credit. Function boundaries remain
candidates until compiled C reconstruction proves them. ROM mapping and content classification are
research coverage, not decompilation credit: the 516 texture containers, 43
JPEGs, 262 models, 67 motions, 2 sprites, 237 audio streams, and 214 auxiliary
graphics records are inventoried but not counted as reconstructed assets.
There is deliberately no single “overall completion” percentage: combining
compiled code, linked data, and merely catalogued assets would overstate actual
reconstruction progress.
