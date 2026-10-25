#include "types.h"

typedef struct BufferState {
    u8 pad00[8];
    void *buffer;
    u32 flags;
} BufferState;

typedef struct BufferOwner {
    u8 pad00[8];
    BufferState *state;
} BufferOwner;

extern void *func_80032E00(s32 type, s32 size);
extern void func_8002E17C(void *destination, const void *source, s32 size);

void object_buffer_initialize(BufferOwner *owner, const void *source)
{
    BufferState *state = owner->state;

    state->buffer = func_80032E00(0, 0x20);
    state->flags |= 1;
    func_8002E17C(state->buffer, source, 0x20);
}
