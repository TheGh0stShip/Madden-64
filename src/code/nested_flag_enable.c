#include "types.h"

typedef struct NestedFlagOwner {
    u8 pad[0x14];
    u8* state;
} NestedFlagOwner;

void func_80055558(NestedFlagOwner* owner) {
    *(s32*)(owner->state + 0x20) = 1;
}
