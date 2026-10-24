#include "types.h"

extern u8* D_80087FA0;

void func_800A6F00(void) {
    register u32 mask __asm__("$3") = ~1;
    u8* object;

    __asm__ volatile ("" : : "r"(mask));
    object = *(u8**)(D_80087FA0 + 0x24);

    *(u32*)(object + 0x14) &= mask;
    __asm__ volatile ("" ::: "memory");
}
