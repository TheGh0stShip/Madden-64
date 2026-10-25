#include "types.h"

typedef struct RenderState {
    u8 pad0[4];
    void* context;
    u8 pad8[0xA0];
    u16 flags;
} RenderState;

typedef struct RenderOwner {
    u8 pad0[8];
    RenderState* state;
} RenderOwner;

extern void func_8000E490(void* context, u32* input, u32* output);

void func_8000EB8C(RenderOwner* owner) {
    u32 command[4];
    RenderState* state = owner->state;

    command[0] = 0xB900031D;
    command[1] = 0x00442078;
    command[2] = 0;
    command[3] = 0;
    func_8000E490(state->context, command, &command[2]);
    state->flags |= 8;
}
