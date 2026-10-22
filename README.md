# Madden Football 64 decompilation

[![Overall verified](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=Overall%20verified&category=overall_verified&measure=matched_data_percent)](https://bytematch.dev/TheGh0stShip/Madden-64)
[![Code](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=Code&measure=matched_code_percent)](https://bytematch.dev/TheGh0stShip/Madden-64)
[![Initialized data](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=Initialized%20data&category=initialized_data&measure=matched_data_percent)](https://bytematch.dev/TheGh0stShip/Madden-64)
[![Assets](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=Assets&category=assets&measure=matched_data_percent)](https://bytematch.dev/TheGh0stShip/Madden-64)
[![ROM mapped](https://bytematch.dev/TheGh0stShip/Madden-64.svg?label=ROM%20mapped&category=rom_mapping&measure=matched_data_percent)](https://bytematch.dev/TheGh0stShip/Madden-64)

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
`0x8008B8E0`. The current automated catalogue has 1,383 provisional function
boundaries and identifies 147 libultra routines. Its compiler fingerprint is
predominantly KMC GCC, while detected library code is IDO-built.

Ninety-five reviewed C units currently match 32,888 retail code bytes and 304 data bytes exactly, including
the contiguous `memcpy`, `strlen`, and `strchr` implementation. Automated
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
make match
make check
make report
```

`make survey` writes ROM-derived artifacts under `build/us/survey`. Because the
retail program is packed, `make match` first creates
`build/us/main_unpacked.z64`, an analysis-only linear wrapper around the
recovered executable. It must never be mistaken for or distributed as a game
ROM.

## Architecture

The target is the Nintendo 64's big-endian MIPS R4300 (o32 ABI), not the x86-64
development host. On-disk structures use explicit-width integers and explicit
big-endian decoding. Host tests do not by themselves prove target correctness;
matching status requires target compiler output to equal the recovered retail
program bytes.

## Progress tracking

Every push to `main` publishes an objdiff v2 artifact named `N8ME_report`.
The report is generated from the reviewed matching manifests and audited ROM
survey totals without requiring a copy of the retail ROM. Public history and
progress are available on [ByteMatch](https://bytematch.dev/TheGh0stShip/Madden-64).

Progress is reported by evidence class; the code percentage is not an overall
project percentage. Current audited measures are:

| Measure | Verified or identified | Scope | Progress |
|---|---:|---:|---:|
| Matching code | 32,888 bytes | 411,132 bytes | 8.00% |
| Initialized program data | 304 bytes | 76,996 bytes | 0.39% |
| Asset identification | 896 bytes | 12,293,120 bytes | 0.007% |
| ROM mapping and classification | 2,632,354 bytes | 12,582,912 bytes | 20.92% |

The ROM-mapping measure includes loader-referenced ranges whose purpose or
encoding is not yet understood, so it is research coverage rather than
decompilation completion. Images, textures, music, and sound currently receive
no progress credit because their formats have not yet been verified. If code,
initialized data, and identified assets are combined strictly by verified byte
coverage, the result is 34,088 of 12,781,248 bytes (0.267%).
