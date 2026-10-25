#include "types.h"

typedef struct ResourceState {
    u8 pad0[8];
    void* resource;
    u8 padC[0x24];
    u32 flags;
} ResourceState;

typedef struct ResourceOwner {
    u8 pad0[8];
    ResourceState* state;
} ResourceOwner;

extern void func_80033428(s32 type, void* resource);

void func_80017C24(ResourceOwner* owner) {
    ResourceState* state = owner->state;
    u32 flags = state->flags;

    if (!(flags & 0x800)) {
        func_80033428(0, state->resource);
        state->resource = 0;
        state->flags |= 8;
    } else {
        state->flags = flags & ~0x800;
    }
}
