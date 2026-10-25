#include "types.h"

typedef struct DisplayResult {
    u8 pad0[0x14];
    s32 first;
    s32 second;
    s32 value;
} DisplayResult;

typedef struct DisplaySource {
    u8 pad0[0xC];
    s32 low_value;
    u8 pad10[0x38];
    s32 high_value;
} DisplaySource;

typedef struct DisplayState {
    u8 pad0[0x94];
    u32 index;
    u8 pad98[0xA4];
    u32 count;
    u8 pad140[4];
    s32 mode;
    DisplaySource* source;
    u8 pad14C[0x5C];
    DisplayResult* result;
} DisplayState;

void func_8005B618(DisplayState* state) {
    DisplayResult* result = state->result;

    if (state->mode >= 2) {
        result->value = 1;
    } else if (state->index < state->count - 1) {
        result->value = state->source->low_value;
    } else {
        result->value = state->source->high_value;
    }
    result->first = 0;
    result->second = 0;
}
