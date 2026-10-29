#include "types.h"

typedef void (*RuntimeWindowCallback)(void* object, u8 value, void* context);

typedef struct RuntimeWindowState {
    u8 pad0[4];
    RuntimeWindowCallback first_callback;
    u16 base;
    u16 position;
    u8 visible;
    u8 offset;
    u8 padE[6];
    RuntimeWindowCallback second_callback;
    u8 pad18[2];
    u16 overflow;
    u8 pad1C;
    u8 current;
    u8 limit;
    u8 pad1F[0x29];
    void* object;
    void* context;
} RuntimeWindowState;

void func_800DB0AC(RuntimeWindowState* state, u32 position, u32 current) {
    s32 amount;
    u16 old_position;

    if (position != state->position + state->offset) {
        state->position = position;
        state->offset = 0;
    }
    old_position = state->position;
    amount = state->visible + old_position - state->base;
    if (state->base < state->visible) {
        amount = old_position;
    }
    if (amount > 0) {
        state->position = old_position - amount;
        state->offset += amount;
    }
    if (current < state->limit) {
        state->current = current;
    } else {
        state->current = state->limit;
        state->overflow = current - state->limit;
    }
    if (state->first_callback != 0) {
        state->first_callback(state->object, state->offset, state->context);
    }
    if (state->second_callback != 0) {
        state->second_callback(state->object, state->current, state->context);
    }
}
