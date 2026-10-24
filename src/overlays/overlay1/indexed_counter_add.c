#include "types.h"

extern u8 D_80069E70[];

s32 func_800A3A74(u8* object) {
    s32 index = object[0x1F];

    *(u32*)(object + 0x98) = 0;
    D_80069E70[index] += 100;
    return 0;
}
