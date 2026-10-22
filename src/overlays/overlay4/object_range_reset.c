#include "types.h"

s32 func_800D1A80(u8* object) {
    if ((*(u16*)(object + 0x28) & 1) == 0) {
        *(s32*)(object + 0xA0) = -1;
        *(s32*)(object + 0x9C) = -1;
        *(s32*)(object + 0x98) = 0;
    }
    *(u32*)0x80087B60 = 0x002E0003;
    return 0;
}
