#include "types.h"

typedef void (*RuntimeVerticalCallback)(void* object, u8 value, void* context);

typedef struct RuntimeVerticalState {
    u8 pad0[0x14];
    RuntimeVerticalCallback callback;
    u8 pad18[2];
    u16 overflow;
    u8 count;
    u8 current;
    u8 limit;
    u8 pad1F[0xF];
    u8 flags;
    u8 pad2F[0x19];
    void* object;
    void* context;
} RuntimeVerticalState;

extern void func_800DB934(RuntimeVerticalState* state);
extern void func_800DC1C8(RuntimeVerticalState* state, s32 direction);
extern void func_800DC5BC(RuntimeVerticalState* state);
extern void func_800DF6EC(void);

s32 func_800DBCA0(RuntimeVerticalState* state) {
    u8 value;

    if (state->count > state->limit) {
        value = state->current;
        if (state->limit < value && !(state->flags & 0x20)) {
            value--;
            state->current = value;
            if (state->callback != 0) {
                state->callback(state->object, value, state->context);
            }
            func_800DB934(state);
        } else if (state->overflow != 0) {
            state->overflow--;
            if (state->callback != 0) {
                state->callback(state->object, state->current, state->context);
            }
            func_800DC1C8(state, -1);
            func_800DC5BC(state);
        } else {
            return 25;
        }
        if (state->flags & 0x80) {
            func_800DF6EC();
        }
        return 21;
    }
    return 25;
}
