# Initialized-data provenance

Initialized-data progress counts bytes reproduced by explicit typed C
declarations after compilation and relocation. Each manifest unit is compared
byte-for-byte with its ROM or archive image by `tools/verify_data.py`.

The data sources may not use `incbin`, inline assembly, assembler data
directives, linker-injected byte blobs, ROM copying, or post-link patching.
Every credited byte must come from a C scalar, array, structure, string, or
ordinary compiler padding implied by those declarations.

The data ledger records semantic confidence separately from byte-match status:

- `high`: a consumer declaration, known SDK/library object, or complete
  semantic record layout establishes the type.
- `medium`: machine-code access widths and relocation targets establish the
  element width and boundary.
- `low`: section order, alignment, contents, and adjacent symbol boundaries
  establish a compiler-compatible typed representation, but original field
  names or the more specific source-level aggregate type remain unknown.

Low semantic confidence does not mean the bytes are copied opaquely. The C
initializer is still compiled normally and must pass the same exact verifier.
