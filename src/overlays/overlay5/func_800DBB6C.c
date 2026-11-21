#include "types.h"

typedef void (*RuntimeHorizontalCallback)(void *object, u8 value, void *context);

typedef struct RuntimeHorizontalState {
    u8 pad0[4];
    RuntimeHorizontalCallback callback;
    u16 total;
    u16 overflow;
    u8 count;
    u8 current;
    u8 padE[0x20];
    u8 flags;
    u8 pad2F[0x19];
    void *object;
    void *context;
} RuntimeHorizontalState;

extern void func_800DB934(RuntimeHorizontalState *state);
extern void func_800DBF10(RuntimeHorizontalState *state, s32 index);
extern void func_800DC5BC(RuntimeHorizontalState *state);
extern void overlay5_resource_mode_notify(void);

s32 func_800DBB6C(RuntimeHorizontalState *state) {
    u8 count;
    u8 flags;
    u16 total;
    s32 visible;
    s32 wrap;
    u8 value;
    u32 index;
    s32 limit;
    u8 next;

    count = state->count;
    flags = state->flags;
    total = state->total;
    visible = count;
    wrap = 0;
    if (flags & 8) {
        wrap = 1;
    }
    if (total < count) {
        visible = total;
    }
    value = state->current;
    index = value;
    limit = wrap + 1;
    if (index < (u32)(visible - limit) || (wrap != 0 && state->overflow + index == total - 2)) {
        next = value + 1;
        if (!(flags & 0x10)) {
            state->current = next;
            if (state->callback != 0) {
                state->callback(state->object, next, state->context);
            }
            func_800DB934(state);
            goto done;
        }
    }
    if (state->overflow + state->count < state->total) {
        state->overflow++;
        if (state->callback != 0) {
            state->callback(state->object, state->current, state->context);
        }
        func_800DBF10(state, state->count - 1);
        func_800DB934(state);
        func_800DC5BC(state);
    done:
        if (state->flags & 0x80) {
            overlay5_resource_mode_notify();
        }
        return 20;
    }
    return 25;
}
