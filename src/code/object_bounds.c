#include "types.h"

void func_8000CB38(u8* object, u16 width, u16 height) {
    if (*(u16*)(object + 0x1FC) == width &&
        *(u16*)(object + 0x1FE) == height) {
        *(u16*)(object + 0x206) &= ~0x80;
    } else {
        *(u16*)(object + 0x206) |= 0x80;
    }
    *(u16*)(object + 0x200) = width;
    *(u16*)(object + 0x202) = height;
}

void func_8000CB78(u8* object, u32 first, u32 second) {
    *(u32*)(object + 0x1F0) = first;
    *(u32*)(object + 0x1F4) = second;
    *(u16*)(object + 0x206) |= 0x200;
}

void func_8000CB90(u8* object) {
    *(u32*)(object + 0x1F0) = 0;
    *(u32*)(object + 0x1F4) = 0;
    *(u16*)(object + 0x206) &= ~0x200;
}
