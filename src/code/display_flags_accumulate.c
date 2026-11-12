#include "types.h"

extern s16 D_80086DA8;
extern u32 func_80030B54(s16 index);

u32 display_flags_accumulate(void)
{
    s16 index = 0;
    u32 flags = 0;
    volatile u64 unused;

    if (D_80086DA8 > 0) {
        do {
            flags |= func_80030B54(index);
            index++;
        } while (index < D_80086DA8);
    }
    if (flags & 0x800) {
        flags &= -0x401;
    }
    if (flags & 0x200) {
        flags &= -0x101;
    }
    return flags;
}
