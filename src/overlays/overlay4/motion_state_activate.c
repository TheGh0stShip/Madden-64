#include "types.h"

typedef struct MotionActivationSource {
    u8 pad[0x20];
    s32 position;
} MotionActivationSource;

typedef struct MotionActivationState {
    u8 pad0[0x24];
    MotionActivationSource* source;
    u16 flags;
    u8 pad1[0x62];
    s32 position;
    s32 value0;
    s32 value1;
    s32 value2;
} MotionActivationState;

extern s32 D_80080C10;
extern MotionActivationState* D_80080C2C;

s32 func_800DAF34(MotionActivationState* state) {
    D_80080C2C = state;
    state->position = state->source->position + 0x300000;
    state->value0 = 0;
    state->value1 = 0;
    state->value2 = 0;
    if (D_80080C10 & 0x2000) {
        state->flags |= 1;
    }
    return 0;
}
