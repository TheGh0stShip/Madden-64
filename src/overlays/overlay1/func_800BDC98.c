#include "types.h"

extern void* volatile D_800726D0;
extern void* func_80033174(s32 arena, u16 count, s32 size);

/* The catalogue range begins with one non-code word (0x0000082E, disassembles as
 * `dsub $at,$zero,$zero`) ahead of the prologue; it is data placed in .text. */
const s32 D_800B9574 __attribute__((section(".text"))) = 0x82E;

void func_800BDC9C(u16 count) {
    D_800726D0 = func_80033174(0, count, 0x18);
}
