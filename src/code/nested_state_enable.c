#include "types.h"

typedef struct NestedStateOwner {
    u8 pad[0x1C8];
    u8* state;
} NestedStateOwner;

void func_800627E0(NestedStateOwner* owner) {
    *(s32*)(owner->state + 0x1C) = 1;
}
