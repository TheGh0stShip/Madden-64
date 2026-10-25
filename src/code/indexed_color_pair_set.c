#include "types.h"

extern u8 D_80078300[];
extern u8 D_80078310[];

void func_8000E05C(u8 index, u8* color) {
    register u32 offset __asm__("$2") = index * 40;
    register u8* entry __asm__("$3");

    __asm__ volatile("" : "=r"(offset) : "0"(offset));

    index = color[0];
    entry = &D_80078300[offset];
    entry[0x14] = index;
    D_80078310[offset] = index;
    index = color[1];
    entry[0x15] = index;
    D_80078310[offset + 1] = index;
    index = color[2];
    entry[0x16] = index;
    D_80078310[offset + 2] = index;
}
