#include "types.h"

typedef void (*RuntimeWindowRebuildCallback)(void* object, u8 value, void* context);

typedef struct RuntimeWindowRebuildState {
    void* allocation;
    RuntimeWindowRebuildCallback first_callback;
    u8 pad8[4];
    u8 multiplier;
    u8 first_value;
    u8 padE[6];
    RuntimeWindowRebuildCallback second_callback;
    u8 pad18[4];
    u8 count;
    u8 second_value;
    u8 pad1E[6];
    u8* sizes;
    u8 pad28[0x20];
    void* object;
    void* context;
} RuntimeWindowRebuildState;

extern void func_80032F3C(s32 value, void* allocation);
extern void* func_80032E00(s32 value, u32 size);
extern void func_800DB00C(RuntimeWindowRebuildState* state);
extern void func_800DB55C(RuntimeWindowRebuildState* state);
extern void func_800DB934(RuntimeWindowRebuildState* state);
extern void func_800DC5BC(RuntimeWindowRebuildState* state);

void func_800DB478(RuntimeWindowRebuildState* state) {
    u32 size = 0;
    u32 index;

    if (state->first_callback != 0) {
        state->first_callback(state->object, state->first_value, state->context);
    }
    if (state->second_callback != 0) {
        state->second_callback(state->object, state->second_value, state->context);
    }
    func_80032F3C(0, state->allocation);
    for (index = 0; index < state->count; index++) {
        size += state->multiplier * state->sizes[index];
    }
    state->allocation = func_80032E00(0, size);
    func_800DB00C(state);
    func_800DB55C(state);
    func_800DB934(state);
    func_800DC5BC(state);
}
