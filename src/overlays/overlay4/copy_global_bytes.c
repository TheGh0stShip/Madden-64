#include "types.h"

extern u16 D_80089342;
extern u8 D_8008AFD8[];

void func_800E3A18(u16 count, u8* source) {
    u16 index;

    D_80089342 = count;
    for (index = 0; index < count; index++) {
        D_8008AFD8[index] = source[index];
    }
}
