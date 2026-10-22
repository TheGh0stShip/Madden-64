#include "types.h"

typedef struct NestedObjectState {
    s32 value;
    s32 flags;
    u8 pad[0x14];
    s32 initial_value;
    s32 enabled;
} NestedObjectState;

typedef struct NestedObjectOwner {
    u8 pad[0x14];
    NestedObjectState* state;
} NestedObjectOwner;

s32 func_80055568(NestedObjectOwner* owner) {
    NestedObjectState* state = owner->state;
    s32 initial_value = state->initial_value;

    state->flags = 0x20000;
    state->enabled = 0;
    state->value = initial_value;
    return 1;
}
