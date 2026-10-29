#include "types.h"

extern s16 D_800885A8[];

s16 func_800DF4C0(u8 **pp) {
    u8 *p = (*pp)++;
    u16 b = p[0];
    if (b & 0x80) {
        return D_800885A8[b & 0x7F];
    }
    *pp = p + 2;
    b = p[1] + (b << 8);
    if (b & 0x4000) {
        b |= 0x8000;
    }
    return b;
}
