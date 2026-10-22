#include "types.h"

typedef void (*CommandCallback)(void* owner);

void func_800635A0(void* owner, u32 value) {
    u8* state = *(u8**)owner;

    *(u32*)(state + 0x14) = 0x35;
    *(u32*)(*(u8**)owner + 0x18) = value;
    (*(CommandCallback*)*(u8**)owner)(owner);
}
