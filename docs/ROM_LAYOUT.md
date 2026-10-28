# ROM layout audit

The retail cartridge is 12,582,912 bytes. A complete physical sweep identifies
the following gap-free top-level layout:

The unsigned 32-bit offset namespace is also accounted for explicitly. The
cartridge occupies `0x00000000..0x00C00000` (exclusive end). The interval
`0x00C00000..0x100000000` is outside the cartridge, so offsets
`0x00C00000..0xFFFFFFFF` contain no Madden Football 64 ROM bytes. These two
intervals total exactly 4,294,967,296 offsets. This offset-space audit is kept
separate from N64 virtual addresses, where the loader, resident program, and
mutually exclusive overlays are mapped at runtime.

| ROM range | Size | Purpose |
|---|---:|---|
| `0x000000..0x001000` | 4,096 | Header and IPL3 |
| `0x001000..0x0012D0` | 720 | Boot loader |
| `0x0012D0..0xBFE9D6` | 12,572,422 | Fifteen archive slots |
| `0xBFE9D6..0xC00000` | 5,674 | Unused tail padding |

The sixteen archive boundary addresses are embedded at the start of the
resident program. One adjacent pair is equal, leaving fourteen non-empty
archives. Every non-empty archive has a table of 12-byte file records followed
by two-byte-aligned payloads. The tables and payload extents account for every
byte in the archive region:

- 1,353 file records
- 16,236 table bytes
- 12,556,186 stored payload bytes
- 12,555,560 logical payload bytes
- 626 alignment bytes
- no gaps or overlapping payloads

The complete physical-byte equation is therefore:

| Physical allocation | Bytes |
|---|---:|
| Header and IPL3 | 4,096 |
| Boot loader | 720 |
| Archive record tables | 16,236 |
| Archive payload extents | 12,556,186 |
| Unused tail padding | 5,674 |
| **Complete ROM** | **12,582,912** |

Every byte has an exact ROM start and exclusive end in the gap-free
[`config/us/rom_map.tsv`](../config/us/rom_map.tsv). It includes the header,
loader, all fourteen archive tables, the logical contents and alignment of
every record, and the final unused padding. The companion
[`config/us/rom_files.tsv`](../config/us/rom_files.tsv) retains the packed and
expanded sizes for each file record. The flat map contains 1,992 contiguous
intervals and covers addresses `0x000000..0xC00000` exactly once. Automated
tests regenerate both ledgers from the verified cartridge and reject any
difference.

The audit also reproduces the boot loader's type-1 LZ decoder. Decoding the
first file regenerates the surveyed resident program byte-for-byte after its
64-byte archive-boundary prefix.

Each record's third table word supplies the logical stored length for compressed
records; uncompressed records use the expanded-length word. This separates 626
bytes of two-byte alignment from actual file content instead of charging the
padding to assets.

## Archive map

| ID | ROM range | Records | Table | Stored extent | Logical stored | Expanded | Contents |
|---:|---|---:|---:|---:|---:|---:|---|
| 0 | `0x0012D0..0x0A8AA8` | 6 | 72 | 685,968 | 685,965 | 1,237,248 | resident program, two overlays, overlay data |
| 1 | `0x0A8AA8..0x14BE18` | 152 | 1,824 | 666,704 | 666,643 | 839,218 | 124 textures, 3 JPEGs, 25 graphics auxiliaries |
| 2 | `0x14BE18..0x14BEA6` | 1 | 12 | 130 | 130 | 598 | texture |
| 3 | `0x14BEA6..0x2B0536` | 255 | 3,060 | 1,456,796 | 1,456,677 | 2,009,205 | 153 models, 102 graphics auxiliaries |
| 4 | `0x2B0536..0x2DFA40` | 58 | 696 | 193,106 | 193,087 | 268,256 | 18 textures, 40 graphics auxiliaries |
| 5 | `0x2DFA40..0x2E2E16` | 2 | 24 | 13,246 | 13,246 | 31,768 | gameplay tables |
| 6 | `0x2E2E16..0x2E7D66` | 11 | 132 | 20,172 | 20,171 | 23,020 | 9 textures, 2 JPEGs |
| 7 | `0x2E7D66..0x9BEF02` | 237 | 2,844 | 7,169,664 | 7,169,529 | 7,169,529 | audio streams |
| 8 | `0x9BEF02..0xA8AF94` | 134 | 1,608 | 834,122 | 834,060 | 1,202,652 | 109 models, 24 graphics auxiliaries, one empty record |
| 9 | `0xA8AF94..0xAB1B96` | 50 | 600 | 158,122 | 158,102 | 250,716 | 27 textures, 23 graphics auxiliaries |
| 10 | `0xAB1B96..0xB36B52` | 330 | 3,960 | 540,740 | 540,577 | 888,232 | 328 textures, 2 JPEGs |
| 11 | `0xB36B52..0xB514DA` | 45 | 540 | 108,396 | 108,374 | 132,216 | 9 textures, 36 JPEGs |
| 12 | `0xB514DA..0xB514DA` | 0 | 0 | 0 | 0 | 0 | deliberately empty slot |
| 13 | `0xB514DA..0xB7427E` | 2 | 24 | 142,732 | 142,732 | 270,845 | team and player databases |
| 14 | `0xB7427E..0xBFE9D6` | 70 | 840 | 566,288 | 566,267 | 595,420 | 67 motions, 2 sprites, one empty record |

## Content inventory

The following counts come from file signatures or the archive loader path.
Stored sizes include each file's alignment byte when present. Expanded sizes
come from the archive records and are independently checked for every type-1
LZ stream.

| Content | Files | Stored bytes | Expanded bytes |
|---|---:|---:|---:|
| Resident program image | 1 | 284,652 | 488,128 |
| Executable overlays | 2 | 207,034 | 371,936 |
| Overlay data blocks | 2 | 194,250 | 377,152 |
| Audio streams | 237 | 7,169,664 | 7,169,529 |
| JPEG image files | 43 | 233,596 | 233,696 |
| Texture files with canonical headers | 516 | 1,104,924 | 1,680,504 |
| `TNMF` model files | 262 | 1,823,646 | 2,612,424 |
| `TMot` animation files | 67 | 547,866 | 556,096 |
| `TSpr` sprite files | 2 | 18,420 | 39,324 |
| Auxiliary graphics records | 214 | 816,120 | 1,087,489 |
| Gameplay tables | 2 | 13,246 | 31,768 |
| Team/player databases | 2 | 142,732 | 270,845 |
| Program metadata | 1 | 32 | 32 |
| Empty records | 2 | 4 | 0 |

“Auxiliary graphics” is intentionally a physical classification: these records
are palettes, texel planes, lookup blocks, and other graphics-side companions,
but several are components of a larger logical asset. They are not inflated
into a speculative asset count. The audio archive count and byte extents are
exact; music, speech, ambience, and effects remain one stream class until the
sound-number tables are named from code.

Counts in this table are physical file-record counts, not claims about the
number of player-visible songs, sound effects, models, or texture surfaces.
One logical asset may use several records, and one container may hold several
internal elements. Semantic counts will only be promoted after their owning
tables and loader relationships are reconstructed.

## Whole-program accounting

The old 411,132-byte code scope was a contiguous resident text envelope, not an
executable-byte count. It included the archive pointer table and embedded data,
and it excluded the loader and both overlays. Walking each executable region
and subtracting identified in-text data gives:

| Module | Code bytes | Initialized data/metadata | Function candidates |
|---|---:|---:|---:|
| Boot loader | 644 | 76 | 5 |
| Resident image | 393,288 | 94,840 | 1,366 |
| Overlay record 1 | 226,792 | 12,416 | 960 |
| Overlay record 2 | 204,776 | 33,930 | not yet catalogued |
| Overlay record 4 | 132,728 | 0 | 420 |
| Overlay record 5 | 124,268 | 14,178 | not yet catalogued |
| Program metadata record | 0 | 32 | 0 |
| **Total** | **1,082,496** | **155,472** | **2,751 catalogued** |

Records 2 and 5 were formerly classified wholesale as overlay data. Instruction
decoding and control-flow evidence show that 329,044 of their bytes are MIPS
code; the final 24 bytes formerly assigned to Overlay 4 data are also an
executable epilogue. The initialized-data ledger preserves the complete old
484,540-byte scope and marks all 329,068 reclassified bytes explicitly.

The boot-loader total is partitioned byte-for-byte in
[`config/us/loader_map.tsv`](../config/us/loader_map.tsv). Its five instruction
ranges occupy 644 bytes; a 12-byte alignment block and the 64-byte archive
boundary table occupy the remaining 76 bytes. The audit verifies contiguous
coverage, the ROM-to-VRAM mapping, and all sixteen table values against the
resident copy before accepting these totals. The code accounting includes the
unreachable store word at `0x802005DC` and two trailing no-op words after the
instruction-cache routine, but neither is counted as a function candidate.

The resident BSS is a further 82,464 zero-initialized bytes. Function totals
are explicitly candidates until source/linker reconstruction proves every
boundary. The corrected resident count excludes nine archive-pointer words and
the first rodata word that the broad executable-envelope scan had mistaken for
functions. It also excludes two interior words in the 14,536-byte resident RSP
microcode/data region that had been misidentified as CPU entry points. The
region begins with eight alignment bytes, the standard 204-byte RSP task
bootstrap at `0x80050EA8..0x80050F74`, four more alignment bytes, and a
5,168-byte F3DEX FIFO graphics program at `0x80050F78..0x800523A8`. The
bootstrap is reconstructed and assembled byte-for-byte; the graphics boundary
is confirmed by an exact cross-image comparison but remains unmatched until a
source reconstruction is in-tree. Byte totals and ROM locations are exact.
The expanded program rows
sum to 1,237,968 bytes including the loader, and the code/data split above sums
to the same value.

The overlay boundary reviews are retained in
[`config/us/overlay1_boundary_findings.tsv`](../config/us/overlay1_boundary_findings.tsv)
and
[`config/us/overlay4_boundary_findings.tsv`](../config/us/overlay4_boundary_findings.tsv).
Their 1,297 observations record the evidence behind non-obvious splits, including
embedded data, fall-through entries, shared epilogues, interior aliases, and
cross-boundary branches. These findings are diagnostic constraints rather than
additional functions; they prevent ambiguous sweep seeds from silently
inflating the public function count.

Run `make audit` to regenerate the ignored JSON, TSV, and Markdown reports under
`build/us/audit/` from a verified local ROM. The complete location ledger is
committed as [`config/us/rom_files.tsv`](../config/us/rom_files.tsv); the test
suite requires it to match a fresh audit exactly.
