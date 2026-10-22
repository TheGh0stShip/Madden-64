#include "types.h"

typedef struct MotionInitializeSource {
    u8 pad[0x20];
    s32 position;
} MotionInitializeSource;

typedef struct MotionInitializeState {
    u8 pad0[0xA];
    u8 timer;
    u8 pad1;
    u16 distance;
    u8 pad2[0x16];
    MotionInitializeSource* source;
    u16 flags;
    u8 pad3[0x62];
    s32 position;
    s32 value0;
    s32 value1;
    s32 value2;
} MotionInitializeState;

extern s32 D_80080C10;
extern MotionInitializeState* D_80080C2C;

s32 func_800DB5F8(MotionInitializeState* state) {
    D_80080C2C = state;
    state->position = state->source->position - 0x470000;
    state->value0 = 0;
    state->value1 = 0;
    state->value2 = 0;
    if (D_80080C10 & 0x2000) {
        state->flags |= 1;
    }
    state->timer = 0xB4;
    state->distance = 0xFF;
    D_80080C10 |= 0x1000000;
    return 0;
}
