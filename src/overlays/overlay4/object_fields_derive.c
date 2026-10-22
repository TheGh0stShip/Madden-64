#include "types.h"

s32 func_800D00A4(u8* object) {
    *(u32*)(object + 0x8C) = *(u32*)(*(u8**)(object + 0x24) + 0x1C);
    *(u32*)(object + 0x90) = *(u32*)(*(u8**)(object + 0x24) + 0x20);
    *(u32*)(object + 0x98) = ((u32)object[0x65] << 18) + 0x100000;
    *(u32*)(object + 0x9C) = (u32)object[0x66] << 5;
    return 0;
}
