#include "types.h"

typedef struct StateDE998 {
    void* allocator;
    u8 pad4[0x68];
    void* resource;
    u8 pad70[3];
    u8 count;
    void** items;
    void* object;
} StateDE998;

typedef struct OwnerDE998 {
    u8 pad0[0xC];
    StateDE998* state;
} OwnerDE998;

extern void* D_80087A64;
extern void* D_8008931C;
extern void func_800E078C(void*);
extern void func_8000D874(void*, void*);
extern void func_8000D834(void*, void*);
extern void func_80032F3C(s32, void*);
extern void func_8002FF70(void*);
extern void func_80033258(void*);

void func_800DE998(OwnerDE998* owner) {
    StateDE998* state;
    u8 i;

    state = owner->state;
    func_800E078C(state->resource);
    if (state->items != 0) {
        i = 0;
        if (state->count != 0) {
            do {
                func_8000D874(D_80087A64, state->items[i]);
                func_8000D834(D_8008931C, state->items[i]);
                i++;
            } while (i < state->count);
        }
        func_80032F3C(0, state->items);
    }
    if (state->object != 0) {
        func_8002FF70(state->object);
    }
    func_80033258(state->allocator);
    func_80032F3C(0, state);
    owner->state = 0;
}
