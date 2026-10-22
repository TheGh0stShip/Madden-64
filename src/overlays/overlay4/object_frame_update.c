#include "types.h"

s32 func_800E3D24(u8* object) {
    u8* active = *(u8**)0x80080C2C;

    *(s32*)(object + 0x8C) = *(u8*)(object + 0x65) * 4;
    if (object == active && (*(u32*)0x80080C10 & 0x2000) != 0) {
        *(u16*)(object + 0x28) |= 0x10;
    }
    return 0;
}
