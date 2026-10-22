#include "types.h"

void func_800AA1A8(u8* object) {
    register u32 first asm("$3");
    register u32 second asm("$2");

    first = 0xFD700000;
    *(u32*)(object + 0xB0) = first;
    first = 0x02900000;
    *(u32*)(object + 0xB4) = first;
    __asm__ volatile("" ::: "memory");
    second = 0xFB100000;
    *(u32*)(object + 0xB8) = second;
    second = 0x04F00000;
    *(u32*)(object + 0xBC) = second;
}
