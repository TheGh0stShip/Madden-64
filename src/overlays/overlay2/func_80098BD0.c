#include "types.h"

extern u8 D_800C4B44[4];

/* Step the selection down past every entry already taken in D_800C4B44 (wrapping 1 -> 8). */
s32 func_80098BD0(s32 n) {
    s32 i;

restart:
    for (i = 0; i < 4; i++) {
        if (D_800C4B44[i] - 0x7D == n) {
            if (n > 0) {
                n = D_800C4B44[i] - 0x7E;
            } else {
                n = 8;
            }
            goto restart;
        }
    }
    return n;
}
