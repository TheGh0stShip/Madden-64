#include "types.h"

typedef void (*CommandCallback)(void* owner);

void func_800649B8(void* owner) {
    u8* state = *(u8**)owner;

    *(u32*)(state + 0x14) = 0x30;
    (*(CommandCallback*)*(u8**)owner)(owner);
}
