#include "types.h"

s32 func_800DC4F0(u8* object) {
    if ((*(u16*)(object + 0x28) & 1) == 0) {
        *(s32*)(object + 0xA0) = 0;
        *(s32*)(object + 0x8C) = 0;
    }
    return 0;
}
