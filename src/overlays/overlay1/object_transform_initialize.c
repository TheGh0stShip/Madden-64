#include "types.h"

void func_800B701C(u8* object) {
    u32 value;

    if (!(*(u16*)(object + 0x84) & 0x400) || *(u8**)(object + 0x0C) == 0) {
        return;
    }
    *(u32*)(object + 0x2C) = *(u32*)(*(u8**)(object + 0x0C) + 0x1C);
    value = *(u32*)(*(u8**)(object + 0x0C) + 0x20);
    *(u32*)(object + 0x34) = 0x180000;
    *(u16*)(object + 0x50) = 3;
    *(u16*)(object + 0x58) = 3;
    *(u16*)(object + 0x74) = 4;
    *(u16*)(object + 0x76) = 4;
    *(u16*)(object + 0x78) = 4;
    *(u16*)(object + 0x7C) = 3;
    *(u16*)(object + 0x7E) = 3;
    *(u16*)(object + 0x80) = 3;
    *(u32*)(object + 0x9C) = 0;
    *(u32*)(object + 0x30) = value;
}
