#include "types.h"

extern s16 D_80086DA8;
extern u32 func_80030B54(s16 index);

u32 display_flags_accumulate(void)
{
    register s32 index __asm__("$17") = 0;
    register u32 flags __asm__("$16") = 0;
    register s32 next __asm__("$2");
    volatile u64 unused;

    if (D_80086DA8 > 0) {
        do {
            flags |= func_80030B54((s16)index);
            next = index + 1;
            index = next;
            __asm__ volatile ("" : "=r" (next) : "0" (next));
        } while ((s16)next < D_80086DA8);
    }
    if (flags & 0x800) {
        flags &= -0x401;
    }
    if (flags & 0x200) {
        flags &= -0x101;
    }
    return flags;
}
