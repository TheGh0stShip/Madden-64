#include "types.h"

void func_8000C898(u8* object, void* value) {
    *(void**)(object + 0x238) = value;
}

void* func_8000C8A0(u8* object) {
    return *(void**)(object + 0x238);
}

void func_8000C8AC(u8* object) {
    *(u16*)(object + 0x206) |= 8;
}

void func_8000C8BC(u8* object) {
    *(u16*)(object + 0x206) &= ~8;
}

void func_8000C8CC(u8* object) {
    *(u16*)(object + 0x206) |= 0x100;
}

void func_8000C8DC(u8* object) {
    *(u16*)(object + 0x206) &= ~0x100;
}

u16 func_8000C8EC(u8* object) {
    return *(u16*)(object + 0x206) & 0x100;
}

void func_8000C8F8(u8* object) {
    u16 flags = *(u16*)(object + 0x206);

    if (!(flags & 0x10)) {
        *(u16*)(object + 0x206) = flags | 0x10;
    }
}

void func_8000C914(u8* object) {
    u16 flags = *(u16*)(object + 0x206);

    if (flags & 0x10) {
        *(u16*)(object + 0x206) = flags & ~0x10;
    }
}

void func_8000C930(u8* object, u8 red, u8 green, u8 blue) {
    object[6] = red;
    object[7] = green;
    object[8] = blue;
}
