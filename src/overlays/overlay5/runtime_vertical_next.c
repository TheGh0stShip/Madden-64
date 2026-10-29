#include "types.h"

typedef void (*RuntimeVerticalNextCallback)(void* object, u8 value, void* context);

typedef struct RuntimeVerticalNextState {
    u8 pad0[0x14];
    RuntimeVerticalNextCallback callback;
    u16 total;
    u16 overflow;
    u8 count;
    u8 current;
    u8 limit;
    u8 pad1F[0xF];
    u8 flags;
    u8 pad2F[0x19];
    void* object;
    void* context;
} RuntimeVerticalNextState;

extern void func_800DB934(RuntimeVerticalNextState* state);
extern void func_800DC1C8(RuntimeVerticalNextState* state, s32 direction);
extern void func_800DC5BC(RuntimeVerticalNextState* state);
extern void func_800DF6EC(void);

s32 func_800DBD88(RuntimeVerticalNextState* state) {
    u8 value;
    s32 next;

    if (state->count > state->limit) {
        value = state->current;
        if (value < state->count - 1 && !(state->flags & 0x20)) {
            next = value + 1;
            state->current = next;
            if (state->callback != 0) {
                state->callback(state->object, next, state->context);
            }
            func_800DB934(state);
        } else if (state->overflow + state->count < state->total) {
            state->overflow++;
            if (state->callback != 0) {
                state->callback(state->object, state->current, state->context);
            }
            func_800DC1C8(state, 1);
            func_800DC5BC(state);
        } else {
            return 25;
        }
        if (state->flags & 0x80) {
            func_800DF6EC();
        }
        return 22;
    }
    return 25;
}
