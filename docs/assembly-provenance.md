# Assembly provenance

Assembly is retained only when external source evidence identifies the original
unit as handwritten assembly, or when the range is an alternate entry/shared
tail that cannot be owned by a standalone C function. A byte match by itself is
not provenance.

## Boot cache routines

The two cache routines in the boot loader are standard libultra assembly, not
KMC-generated game C. Their identities are fixed by their complete instruction
sequences, constants, cache operations, and control flow:

| Madden range | Identity | Upstream assembly evidence |
| --- | --- | --- |
| `0x802005E0..0x80200654` | `osInvalICache` | [`src/os/invalicache.s`](https://github.com/n64decomp/libreultra/blob/1aca5c13ca041cef86f8dc194b727361dad9c09b/src/os/invalicache.s) |
| `0x80200660..0x80200688` | `osWritebackDCacheAll` | [`src/os/writebackdcacheall.s`](https://github.com/n64decomp/libreultra/blob/1aca5c13ca041cef86f8dc194b727361dad9c09b/src/os/writebackdcacheall.s) |

Both referenced upstream units are explicitly `.s` sources. The first has the
same `0x4000` I-cache-size threshold, 32-byte line mask/step, hit-invalidate
loop, and full-cache index-invalidate loop. The second has the same KSEG0 base,
`0x2000` D-cache size, 16-byte line step, and index-writeback-invalidate loop.
Madden's reconstructed sources compile to the stored ROM SHA-256 values in
`config/us/matching_loader_asm_units.tsv`.

The 16-byte boot entry is not covered by this libultra evidence. It remains a
separate provenance obligation rather than being inferred handwritten merely
because it initializes the stack before calling C.

## Resident libultra assembly

The resident image also contains standard libultra units whose identities are
established by their complete instruction sequences and by pinned upstream
sources that are themselves `.s` files.  These are not credited as decompiled
C.  They are credited separately as proven handwritten assembly:

| Madden source | Identity | Upstream assembly evidence |
| --- | --- | --- |
| `src/libultra/exceptasm.s` | `__osException` | [`src/os/exceptasm.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/exceptasm.s) |
| `src/libultra/bcopy.s` | `bcopy` | [`src/libc/bcopy.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/libc/bcopy.s) |
| `src/libultra/bzero.s` | `bzero` | [`src/libc/bzero.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/libc/bzero.s) |
| `src/libultra/os_interrupt.s` | `__osDisableInt`, `__osRestoreInt` | [`src/os/interrupt.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/interrupt.s) |
| `src/libultra/os_get_int_mask.s`, `os_set_int_mask.s` | `osGetIntMask`, `osSetIntMask` | [`getintmask.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/getintmask.s), [`setintmask.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/setintmask.s) |
| `src/libultra/os_inval_dcache.s`, `os_inval_icache.s` | `osInvalDCache`, `osInvalICache` | [`invaldcache.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/invaldcache.s), [`invalicache.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/invalicache.s) |
| `src/libultra/os_writeback_dcache.s`, `os_writeback_dcache_all.s` | `osWritebackDCache`, `osWritebackDCacheAll` | [`writebackdcache.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/writebackdcache.s), [`writebackdcacheall.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/writebackdcacheall.s) |
| `src/libultra/os_map_tlb_rdb.s`, `os_probe_tlb.s` | `osMapTLBRdb`, `__osProbeTLB` | [`maptlbrdb.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/maptlbrdb.s), [`probetlb.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/probetlb.s) |
| `src/libultra/os_set_fpc_csr.s`, `os_set_sr.s` | `__osSetFpcCsr`, `__osSetSR` | [`setfpccsr.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/setfpccsr.s), [`setsr.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/setsr.s) |
| `src/libultra/os_get_count.s`, `os_set_compare.s` | `osGetCount`, `__osSetCompare` | [`getcount.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/getcount.s), [`setcompare.s`](https://github.com/decompals/ultralib/blob/e24c836796df4bf520ff8b11a5c9d2cea3a66cbd/src/os/setcompare.s) |

The row-level evidence, exact Madden ranges, and pinned links are maintained in
`config/us/handwritten_asm_provenance.tsv`.  It currently covers 4,588 bytes.
The assembly-reference track remains broader: an `.s` file is not promoted to
this proven-handwritten set merely because its bytes match the ROM.

## Assembler compatibility is not handwritten code

The genuine-C report permits only generic emulation of the original assembler's
macro and literal behavior. `KMC-ABS-SYM-PAIR` is one such rule: for a bare
absolute load such as GCC's `lw $2,D_80087B64`, ASN64 used the load destination
as the `%hi` base (`lui $2`; `lw $2,%lo(...)($2)`). That dependency also fixes
the architecturally required load-delay scheduling. This rule depends only on
the instruction form, not on a function name, address, register allocation, or
desired target sequence.

Function-specific scheduling or instruction-rewrite normalizers remain excluded
from genuine-C progress. Their rows are retained only as assembly-assisted
reference coverage until their source produces the ROM instructions directly.
