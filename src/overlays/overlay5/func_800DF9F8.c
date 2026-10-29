#include "types.h"

typedef struct ItemDF9F8 {
    u8 pad0[0x20];
    s32 field20;
} ItemDF9F8;

typedef struct InfoDF9F8 {
    u8 pad0[4];
    void* data;
    u8 pad8;
    u8 first;
} InfoDF9F8;

typedef struct StateDF9F8 {
    u8 pad0[4];
    InfoDF9F8* info;
    u8 pad8[0x6A];
    u8 flags;
    u8 count;
    ItemDF9F8** items;
    void* object;
    s16 base;
} StateDF9F8;

typedef struct OwnerDF9F8 {
    u8 pad0[0xC];
    StateDF9F8* state;
} OwnerDF9F8;

extern u8 D_800E0024[];
extern void func_8001F070(void* data, s32 index, u32* result);
extern void* func_8002FEA4(void*, s32, s32);

void func_800DF9F8(OwnerDF9F8* owner, s16 base) {
    StateDF9F8* state;
    u32 result[4];
    u8 found;
    u8 i;

    state = owner->state;
    state->base = base;
    found = 0;
    i = 0;
    if (state->count != 0) {
        do {
            result[1] = 0xFFFF;
            func_8001F070(state->info->data, state->info->first + i, result);
            if (result[1] == 0xFFFF) {
                found = 1;
            } else {
                state->items[i]->field20 = result[1] - state->base;
            }
            i++;
        } while (i < state->count);
    }
    if (found == 1 && state->object == 0) {
        state->object = func_8002FEA4(D_800E0024, 2, 0);
        *(StateDF9F8**)((u8*)state->object + 8) = state;
        state->flags |= 1;
    }
}
