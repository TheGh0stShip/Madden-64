#include "types.h"

s32 func_800D9DD8(u8* object) {
    if ((*(u16*)(object + 0x28) & 1) == 0) {
        *(s32*)(object + 0x94) = 0;
        *(s32*)(object + 0xA0) = -1;
    }
    *(s32*)(object + 0x98) = *(u32*)0x80080C10 & 1;
    return 0;
}
