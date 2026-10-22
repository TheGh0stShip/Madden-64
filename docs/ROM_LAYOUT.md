# ROM layout audit

The retail cartridge is 12,582,912 bytes. A complete physical sweep identifies
the following gap-free top-level layout:

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
- no gaps or overlapping payloads

The audit also reproduces the boot loader's type-1 LZ decoder. Decoding the
first file regenerates the surveyed resident program byte-for-byte after its
64-byte archive-boundary prefix.

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
| Other structured records | 221 | 972,134 | 1,390,134 |

The final row is deliberately not assigned to a narrower content type yet.
It includes palettes, lookup tables, roster/statistics data, and several
graphics blocks whose record layouts still need field-level validation.
Likewise, the audio archive count is exact, but music, speech, ambience, and
effects are not split into separate counts until their stream headers and
callers are fully identified.

## Code accounting consequence

The earlier 411,132-byte code scope and 1,383 candidate-function count describe
only the resident program. They exclude both executable overlays and therefore
must not be interpreted as whole-game totals. Exact whole-game code, initialized
data, and function totals require splitting the two decoded overlays into code,
read-only data, writable data, and relocation records. Public progress should
remain explicitly resident-only until that split is verified.

Run `make audit` to regenerate the ignored JSON, TSV, and Markdown reports under
`build/us/audit/` from a verified local ROM.
