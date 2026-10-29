#include "types.h"

u8 func_80092CFC(u8, s32, s32);
s8 func_800B8C74(u8);

/* Steps x through func_80092CFC (step 0x7D, other direction) until func_800B8C74 rejects the result; returns it. */
u8 func_800B8C18(s32 x) {
    u8 y;

    do {
        x = func_80092CFC(x, 0x7D, 0);
        y = x;
    } while (func_800B8C74(y));
    return y;
}
