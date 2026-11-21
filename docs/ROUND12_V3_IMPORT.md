# Round 12 v3 Madden import

The v3 handoff was replayed against repository commit
`e4a2102cca271ee2d4b73061c7ad5990990fe812` using Madden's project matcher,
current toolchain, and authoritative images.

## Accepted result

- 404 portable ordinary-C sources were integrated.
- 403 functions are newly credited as matching C; one source replaces an
  already credited ordinary-C unit.
- Matching C increases by 294,420 bytes, from 474,236 to 768,656 bytes.
- Matching functions increase from 2,487 to 2,890.
- Verified boundary corrections reduce the function denominator from 3,663
  to 3,397. The code-byte denominator remains 1,082,496.
- Initialized data remains 155,472 / 155,472 bytes.

The byte gain is computed from the final authoritative manifests rather than
the sum of candidate sizes, so overlapping previously owned coverage is
counted only once.

## Verification and exclusions

The complete handoff checksum set validated successfully. Its isolated replay
reproduced 472 of 496 candidates exactly; all 408 portable ordinary-C rows in
the handoff passed strict proof. Four byte-exact ordinary-C rows were then
withheld because their ownership boundaries remain unresolved: one has an
incoming edge to its interior, and three still span multiple catalogue
entries absent from the verified boundary patch.

Assisted fixed-point sources, normalizer-dependent sources, extra-flag
sources, assembly sources, open boundary proposals, and non-portable rows were
not integrated or credited. The cumulative catalogue patch contains only
verified corrections and one evidenced non-code row.

## Provenance

Candidate sources and boundary evidence came from the Round 12 v3 N64 Decomp
Kit handoff. Every accepted source was checked against its bundled digest and
recompiled locally. Matching manifests retain the complete compiler,
assembler, section-placement, and symbol recipes required for independent
reproduction.
