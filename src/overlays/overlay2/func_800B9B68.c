#include "types.h"

void func_8001EC20(s32, s32);

/* Calls func_8001EC20(cb, n) for n = first+1 .. last (16-bit indices), if cb is set. */
void func_800B9B68(s32 cb, s32 first, u16 last) {
    s32 i;

    if (cb != 0) {
        for (i = first; (u16)i < last; i++) {
            func_8001EC20(cb, (u16)i + 1);
        }
    }
}
