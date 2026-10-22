#include "types.h"

typedef struct Color4 {
    u8 red;
    u8 green;
    u8 blue;
    u8 alpha;
} Color4;

void func_8000EB68(u8* wrapper, u16 width, u16 height, Color4* color) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x14) = width;
    *(u16*)(object + 0x16) = height;
    *(Color4*)(object + 0x18) = *color;
}
