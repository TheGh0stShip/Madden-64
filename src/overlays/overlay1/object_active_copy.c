#include "types.h"

extern u8* D_8008794C;
extern u8* D_8008A5EC;
extern s16 D_800718EC;

void func_800BAA9C(u8* object) {
    register u8* active asm("$5") = D_8008794C;
    register u32 position asm("$4");
    register u32 flags asm("$3");

    D_8008A5EC = object;
    *(u32*)(active + 0x1C) = *(u32*)(object + 0x1C);
    __asm__ volatile("" ::: "memory");
    position = *(u32*)(object + 0x20);
    __asm__ volatile("" ::: "memory");
    flags = *(u32*)(active + 0x14);
    D_800718EC = 20;
    flags &= ~1;
    *(u32*)(active + 0x20) = position;
    *(u32*)(active + 0x14) = flags;
}
