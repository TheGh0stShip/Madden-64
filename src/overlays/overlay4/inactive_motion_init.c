#include "types.h"

typedef struct InactiveMotionSource {
    u8 pad[0x1C];
    s32 value;
} InactiveMotionSource;

typedef struct InactiveMotionState {
    u8 pad0[0x24];
    InactiveMotionSource* source;
    u16 flags;
    u8 pad1[0x62];
    s32 value0;
    s32 value1;
    s32 value2;
    s32 value3;
    s32 value4;
    s32 value5;
    s32 value6;
} InactiveMotionState;

s32 func_800DBEC4(InactiveMotionState* state) {
    if (!(state->flags & 1)) {
        state->value1 = 1;
        state->value2 = 0;
        state->value3 = -1;
        state->value4 = 0;
        state->value5 = 0;
        state->value0 = 0;
        state->value6 = state->source->value;
    }
    return 0;
}
