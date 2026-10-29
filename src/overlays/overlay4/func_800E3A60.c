#include "types.h"

extern s16 D_80089342;
extern u8 D_8008AFD8[];

void func_800E3A60(u16 count, u8 *src) {
    s16 i;

    for (i = D_80089342; i < D_80089342 + count; i++) {
        D_8008AFD8[i] = src[i];
    }
    D_80089342 += count;
}
