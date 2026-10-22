#include "types.h"

typedef struct MotionModeState {
    u8 pad[0x8C];
    s32 velocity0;
    s32 velocity1;
    s32 mode;
    s32 unused;
    s32 phase;
} MotionModeState;

extern s32 D_80080C10;

s32 func_800D0054(MotionModeState* state) {
    s32 mode = D_80080C10 & 1;

    if (mode != state->mode) {
        state->mode = mode;
        state->phase = (state->phase + 0x800) & 0xFFF;
        state->velocity0 = -state->velocity0;
        state->velocity1 = -state->velocity1;
    }
    return 0;
}
