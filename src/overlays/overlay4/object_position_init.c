#include "types.h"

s32 func_800D7BCC(u8* object) {
    u8* active;

    if ((*(u16*)(object + 0x28) & 1) == 0) {
        active = *(u8**)0x80086178;
        *(s32*)(object + 0xA0) = 0;
        *(s32*)(object + 0x98) = 0;
        *(s32*)(object + 0x8C) = -1;
        *(s32*)(object + 0x90) = *(s32*)(active + 0x1C);
        *(s32*)(object + 0x94) = *(s32*)(active + 0x20);
    }
    return 0;
}
