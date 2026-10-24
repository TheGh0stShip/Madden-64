# Madden Football 64 attack surface

This report is generated from the verified US Rev 0 ROM. It is a
prioritization aid, not decompilation credit.

## Whole-ROM coverage

- Physical bytes mapped: 12,582,912 / 12,582,912
- Unmapped bytes: 0

| Region | Start | End | Bytes | Entropy |
|---|---:|---:|---:|---:|
| rom_header_and_ipl3 | `0x000000` | `0x001000` | 4,096 | 5.3122 |
| boot_loader | `0x001000` | `0x0012D0` | 720 | 5.3431 |
| archive_region | `0x0012D0` | `0xBFE9D6` | 12,572,422 | 7.5936 |
| unused_padding | `0xBFE9D6` | `0xC00000` | 5,674 | 1.3775 |

### Archive-by-archive profile

| Archive | Start | End | Records | Table bytes | Entropy |
|---:|---:|---:|---:|---:|---:|
| 0 | `0x0012D0` | `0x0A8AA8` | 6 | 72 | 6.8090 |
| 1 | `0x0A8AA8` | `0x14BE18` | 152 | 1,824 | 7.4960 |
| 2 | `0x14BE18` | `0x14BEA6` | 1 | 12 | 4.5931 |
| 3 | `0x14BEA6` | `0x2B0536` | 255 | 3,060 | 7.1712 |
| 4 | `0x2B0536` | `0x2DFA40` | 58 | 696 | 6.9477 |
| 5 | `0x2DFA40` | `0x2E2E16` | 2 | 24 | 6.8665 |
| 6 | `0x2E2E16` | `0x2E7D66` | 11 | 132 | 7.6705 |
| 7 | `0x2E7D66` | `0x9BEF02` | 237 | 2,844 | 7.5722 |
| 8 | `0x9BEF02` | `0xA8AF94` | 134 | 1,608 | 7.1276 |
| 9 | `0xA8AF94` | `0xAB1B96` | 50 | 600 | 6.9338 |
| 10 | `0xAB1B96` | `0xB36B52` | 330 | 3,960 | 7.2288 |
| 11 | `0xB36B52` | `0xB514DA` | 45 | 540 | 7.7754 |
| 12 | `0xB514DA` | `0xB514DA` | 0 | 0 | 0.0000 |
| 13 | `0xB514DA` | `0xB7427E` | 2 | 24 | 7.1677 |
| 14 | `0xB7427E` | `0xBFE9D6` | 70 | 840 | 7.2349 |

## Function attack surface

The function count and function map are provisional. Code-byte totals
come from program-region classification; candidate bodies come from
heuristic boundary catalogues and are not equivalent measures.

| Module | Functions | Matched | Candidate bytes | Matched bytes |
|---|---:|---:|---:|---:|
| boot_loader | 5 | 3 | 632 | 172 |
| overlay_1 | 1,025 | 149 | 183,528 | 6,636 |
| overlay_4 | 420 | 70 | 115,116 | 3,520 |
| resident | 1,373 | 443 | 378,576 | 45,812 |

### Size distribution

| Function bytes | Candidates | Unmatched | Candidate bytes | Unmatched bytes |
|---|---:|---:|---:|---:|
| 000-0016 | 327 | 133 | 3,956 | 1,688 |
| 000-0032 | 224 | 120 | 5,832 | 3,028 |
| 000-0064 | 385 | 191 | 19,116 | 9,880 |
| 000-0128 | 554 | 461 | 51,956 | 43,684 |
| 000-0256 | 554 | 517 | 102,712 | 95,760 |
| 000-0512 | 477 | 452 | 171,436 | 161,748 |
| 000-1024 | 202 | 191 | 140,620 | 132,880 |
| 1025+ | 100 | 93 | 182,224 | 173,044 |

- Exact duplicate body families: 17
- Functions participating in those families: 113
- Matched-to-unmatched transferable families retained: 0
- Conservative unmatched queue entries retained: 3
- Program-region code bytes: 753,428
- Bytes assigned to provisional candidate bodies: 677,852
- Code bytes outside provisional candidate bodies: 75,576

Exact duplicate families with both matched and unmatched members are
the first source-reuse targets. The conservative queue additionally
requires a closed predecessor, a complete exit, no saved-context
register dependency, and no contradictory boundary finding.

### Boundary-audit evidence

| Module | Sweep candidates | Published candidates | Gap ranges | Gap bytes | Contradictory findings |
|---|---:|---:|---:|---:|---:|
| overlay_1 | 1,071 | 1,025 | 231 | 43,696 | 987 |
| overlay_4 | 420 | 420 | 87 | 17,500 | 348 |

These findings are an audit queue, not additional progress. They include
late starts, branches across candidate boundaries, shared epilogues,
fall-through entries, interior aliases, and executable-looking gap bytes.

## Asset attack surface

| Kind | Records | Compressed | Stored bytes | Expanded bytes | Ratio |
|---|---:|---:|---:|---:|---:|
| audio_stream | 237 | 0 | 7,169,529 | 7,169,529 | 1.0000 |
| empty_record | 2 | 0 | 0 | 0 | 1.0000 |
| gameplay_table | 2 | 2 | 13,246 | 31,768 | 2.3983 |
| graphics_auxiliary | 214 | 164 | 816,040 | 1,087,489 | 1.3326 |
| jpeg_image | 43 | 1 | 233,576 | 233,696 | 1.0005 |
| overlay_data | 2 | 2 | 194,248 | 377,152 | 1.9416 |
| program_metadata | 1 | 0 | 32 | 32 | 1.0000 |
| program_overlay | 2 | 2 | 207,033 | 371,936 | 1.7965 |
| resident_program | 1 | 1 | 284,652 | 488,128 | 1.7148 |
| roster_database | 2 | 2 | 142,732 | 270,845 | 1.8976 |
| texture | 516 | 496 | 1,104,681 | 1,680,504 | 1.5213 |
| tmot_animation | 67 | 38 | 547,849 | 556,096 | 1.0151 |
| tnmf_model | 262 | 251 | 1,823,524 | 2,612,424 | 1.4326 |
| tspr_sprite | 2 | 2 | 18,418 | 39,324 | 2.1351 |

## Format evidence

- All 237 audio records begin with a four-byte little-endian header. Its second 16-bit word equals
  the payload size modulo 65,536; stream type 0 occurs 233 times
  and stream type 9 occurs four times.
- The audio archive does not use the EA `SCHl` block container.
- `TNMF`, `TMot`, and `TSpr` version/flag populations are retained
  in the machine-readable report for parser development.

The machine-readable report preserves per-archive entropy, leading
decoded signatures, the fifty largest records, transferable function
families, and the ranked work queue. Exact physical extents remain in
`config/us/rom_map.tsv`; all archive records remain in
`config/us/rom_files.tsv`; function boundaries remain in the three
`config/us/functions_*.toml` catalogues.
