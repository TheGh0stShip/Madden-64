#include "types.h"

typedef void (*CommandCallback)(void* owner);

void func_80060EFC(void* owner) {
    u8* state = *(u8**)owner;

    *(u32*)(state + 0x14) = 0x2D;
    (*(CommandCallback*)*(u8**)owner)(owner);
}
