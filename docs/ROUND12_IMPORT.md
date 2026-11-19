# Round 12 Madden import

Round 12 added 25 ordinary-C functions that independently reproduce the
addressed ROM text with the project toolchain. The accepted set contributes
9,564 matching C-code bytes:

- Overlay 2: 19 functions, 7,412 bytes.
- Overlay 4: 1 function, 208 bytes.
- Overlay 5: 5 functions, 1,944 bytes.

Focused strict verification passed all 25 functions with exact text, zero
assumed results, and zero inferred relocations. The project-wide C gate still
reports older manifest entries whose section ownership does not satisfy the
current strict verifier; those pre-existing results are not part of this
import.

The progress snapshot moves from 2,462 / 3,663 functions and
464,672 / 1,082,496 C-code bytes to 2,487 / 3,663 functions and
474,236 / 1,082,496 C-code bytes. Initialized data remains
155,472 / 155,472 bytes. No denominator changed in this import.

## Deferred evidence

Four reported candidates were not credited because current-project replay did
not establish an exact, boundary-valid result. Three more candidates had only
text or relocation-masked evidence. Shifted-overlay candidates that overlap
existing catalogue intervals remain deferred until their boundaries and
ownership can be corrected without circular assumptions.

The accompanying library reconciliation proposed 111 translation units. Of
those, 84 were already covered by existing C manifests and 9 partially
overlapped existing aggregate ownership. The remaining units did not provide
new qualifying ordinary C, so no library bytes were added.

## Provenance

The source candidates came from the Round 12 N64 Decomp Kit Madden handoff.
Every accepted entry was rebuilt and compared locally against the current
authoritative image mapping before integration. The imported sources use the
same historical KMC pipeline and ASN64 assembler recipe recorded in their
matching manifests.
