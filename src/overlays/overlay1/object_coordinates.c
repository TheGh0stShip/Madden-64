#include "types.h"

void func_8009B6F8(u8* wrapper, u32 value) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x78) = (value + 0x10000) >> 8;
}

void func_8009B710(u8* wrapper, u32 value) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x7A) = (value + 0x10000) >> 8;
}
