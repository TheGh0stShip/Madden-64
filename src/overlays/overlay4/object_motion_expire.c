#include "types.h"

extern u16 D_8008A5B4;

s32 func_800D4C14(u8* object_arg) {
    register u8* object asm("$6") = object_arg;
    register u8* child asm("$4") = *(u8**)(object + 0x24);
    register s32 timer asm("$2");
    register s32 previous asm("$3");

    *(u32*)(child + 0x14) &= ~0x20;
    __asm__ volatile("" ::: "memory");
    timer = D_8008A5B4;
    previous = *(s32*)(object + 0x8C);
    timer += previous;
    *(s32*)(object + 0x8C) = timer;
    if (timer < 61) {
        register u8* check_child asm("$2") = *(u8**)(object + 0x24);
        if (*(s32*)(check_child + 0x20) <= 0x03700000) {
            return 0;
        }
    }
    *(u16*)(object + 0x28) &= ~0x10;
    child = *(u8**)(object + 0x24);
    *(u32*)(child + 0x14) &= ~0x10000;
    return 1;
}
