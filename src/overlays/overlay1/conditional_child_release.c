#include "types.h"

void func_80032F3C(s32 pool, void* object);

void func_80099D88(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 8);

    if (*(u16*)(wrapper + 0x54) == 0xB) {
        func_80032F3C(0, *(void**)(object + 0x7C));
        *(s32*)(object + 0x7C) = 0;
    }
}
