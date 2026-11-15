#include "types.h"

extern s32 func_80031A1C(s32);
extern s16 func_800E0944(u32);

s16 func_800E0A60(s32 mask) {
    s32 direction;
    s32 shift;
    u32 bit = 0x80000000U;

    if (mask != 0) {
        goto search;
    }
    return 0x19;

found:
    return func_800E0944(bit);

search:
    shift = func_80031A1C(0x20);
    direction = func_80031A1C(2);
    bit >>= shift;
    if (!(direction & 0xFF)) {
left:
        if (bit & mask) {
            goto found;
        }
        if (bit != 0) {
            bit <<= 1;
            goto left;
        }
        bit = 1;
        goto left;
    }

    if (bit != 0) {
right:
        if (bit & mask) {
            goto found;
        }
        if (bit != 0) {
            bit >>= 1;
        } else {
            bit = 0x80000000U;
        }
        if (bit != 0) {
            goto right;
        }
    }
    return 0x19;
}
