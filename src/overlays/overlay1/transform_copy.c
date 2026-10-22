#include "types.h"

void func_800A7520(u8* destination, const u8* source) {
    s32 value;

    value = *(const s32*)(source + 0);
    *(s32*)(destination + 0x2C) = value;
    *(s32*)(destination + 0x1C) = value;
    value = *(const s32*)(source + 4);
    *(s32*)(destination + 0x30) = value;
    *(s32*)(destination + 0x20) = value;
    value = *(const s32*)(source + 8);
    *(s32*)(destination + 0x34) = value;
    *(s32*)(destination + 0x24) = value;
}

void func_800A7548(u8* destination, const u8* source) {
    u16 value;

    value = *(const u16*)(source + 0);
    *(u16*)(destination + 0x64) = value;
    *(u16*)(destination + 0x5C) = value;
    value = *(const u16*)(source + 2);
    *(u16*)(destination + 0x66) = value;
    *(u16*)(destination + 0x5E) = value;
    value = *(const u16*)(source + 4);
    *(u16*)(destination + 0x68) = value;
    *(u16*)(destination + 0x60) = value;
}

void func_800A7570(u8* object, s32 value) {
    *(s32*)(object + 0x10) = value;
    *(s32*)(object + 0x0C) = value;
}
