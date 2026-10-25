#include "types.h"

typedef struct BufferState {
    u8 pad00[4];
    void *primary;
    void *secondary;
    u32 flags;
} BufferState;

typedef struct BufferOwner {
    u8 pad00[8];
    BufferState *state;
} BufferOwner;

extern void func_80032F3C(s32 type, void *buffer);

void object_buffers_release(BufferOwner *owner)
{
    BufferState *state = owner->state;

    if (state->primary != 0) {
        func_80032F3C(0, state->primary);
        state->primary = 0;
    }
    if ((state->flags & 1) && state->secondary != 0) {
        func_80032F3C(0, state->secondary);
        state->secondary = 0;
    }
}
