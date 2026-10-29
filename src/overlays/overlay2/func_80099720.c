#include "types.h"

extern u8 D_800C4B44[8];

/* Step the selection up past every entry already taken in D_800C4B44 (wrapping 8 -> 0). */
s32 func_80099720(s32 n) {
    s32 i;

restart:
    for (i = 0; i < 8; i++) {
        if (D_800C4B44[i] - 0x7D == n) {
            if (n < 8) {
                n = D_800C4B44[i] - 0x7C;
            } else {
                n = 0;
            }
            goto restart;
        }
    }
    return n;
}
