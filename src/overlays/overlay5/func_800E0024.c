#include "types.h"

typedef struct InfoE0024 {
    u8 pad0[4];
    void* data;
    u8 pad8;
    u8 base_index;
    u8 padA;
    u8 count;
} InfoE0024;

typedef struct ResourceE0024 {
    u8 pad0[0x20];
    s32 value20;
} ResourceE0024;

typedef struct StateE0024 {
    u8 pad0[4];
    InfoE0024* info;
    u8 pad8[0x6A];
    u8 flags72;
    u8 pad73;
    ResourceE0024** resources;
    s32 field78;
    s16 base7C;
} StateE0024;

typedef struct ResultE0024 {
    u8 pad0[4];
    s32 value;
    u8 pad8[8];
} ResultE0024;

extern StateE0024* func_800301E0(void* object, s32 index);
extern void func_8001F070(void* data, s32 index, ResultE0024* result);
extern void func_8002FF70(void* object);

void func_800E0024(void* object) {
    StateE0024* state;
    ResultE0024 result;
    u8 success;
    s32 index;

    state = func_800301E0(object, 0);
    success = 1;
    index = 0;
    if (state->info->count != 0) {
        do {
            result.value = 0xFFFF;
            func_8001F070(state->info->data,
                          state->info->base_index + (u8)index, &result);
            if (result.value == 0xFFFF) {
                success = 0;
            } else {
                state->resources[(u8)index]->value20 =
                    result.value - state->base7C;
            }
            index++;
        } while ((u8)index < state->info->count);
    }
    if ((u8)success == 1) {
        func_8002FF70(object);
        state->field78 = 0;
        state->flags72 &= 0xFE;
    }
}
