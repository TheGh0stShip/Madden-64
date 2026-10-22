#include "types.h"

s32 func_800DBC70(u8* object) {
    if ((*(u16*)(object + 0x28) & 1) == 0) {
        *(s32*)(object + 0x90) = 1;
        *(s32*)(object + 0x94) = 0;
        *(s32*)(object + 0x98) = -1;
        *(s32*)(object + 0x9C) = 0;
        *(s32*)(object + 0xA0) = 0;
        *(s32*)(object + 0x8C) = 0;
    }
    return 0;
}
