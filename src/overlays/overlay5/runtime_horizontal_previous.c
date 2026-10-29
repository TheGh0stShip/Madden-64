#include "types.h"

typedef void (*RuntimeHorizontalCallback)(void* object, u8 value, void* context);

typedef struct RuntimeHorizontalState {
    u8 pad0[4];
    RuntimeHorizontalCallback callback;
    u8 pad8[2];
    u16 position;
    u8 padC;
    u8 offset;
    u8 padE[0x20];
    u8 flags;
    u8 pad2F[0x19];
    void* object;
    void* context;
} RuntimeHorizontalState;

extern void func_800DB934(RuntimeHorizontalState* state);
extern void func_800DBF10(RuntimeHorizontalState* state, s32 direction);
extern void func_800DC5BC(RuntimeHorizontalState* state);
extern void func_800DF6EC(void);

s32 func_800DBA70(RuntimeHorizontalState* state) {
    u32 flag = state->flags & 8;
    u32 has_leading = 0 < flag;
    u8 offset = state->offset;

    if ((has_leading < offset ||
         (has_leading != 0 && state->position + offset == 1)) &&
        !(state->flags & 0x10)) {
        offset--;
        state->offset = offset;
        if (state->callback != 0) {
            state->callback(state->object, offset, state->context);
        }
        func_800DB934(state);
    } else {
        if (state->position == 0) {
            goto no_change;
        }
        state->position--;
        if (state->callback != 0) {
            state->callback(state->object, state->offset, state->context);
        }
        func_800DBF10(state, 0);
        func_800DB934(state);
        func_800DC5BC(state);
    }
    if (state->flags & 0x80) {
        func_800DF6EC();
    }
    return 19;
no_change:
    return 25;
}
