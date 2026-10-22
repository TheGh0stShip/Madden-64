# Madden Football 64 decompilation

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

Sixty-four reviewed C units currently match 13,228 retail code bytes exactly, including
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
