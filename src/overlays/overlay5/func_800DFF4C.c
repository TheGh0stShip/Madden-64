#include "types.h"

typedef struct InfoDFF4C {
    u8 pad0[0xB];
    u8 count;
    u8 valueC;
} InfoDFF4C;

typedef struct StateDFF4C {
    void* allocator;
    InfoDFF4C* info;
    void* field8;
    u8 padC[8];
    u8 counter14;
    u8 counter15;
    u8 pad16[0xE];
    s16 field24;
    u8 pad26[2];
    u8 field28;
    u8 pad29[0x4B];
    void** resources;
} StateDFF4C;

typedef struct ObjectDFF4C {
    u8 pad0[0xC];
    StateDFF4C* state;
} ObjectDFF4C;

extern void func_800DF19C(ObjectDFF4C* object, InfoDFF4C* info, u8 next,
                          u8 current, void* field8);
extern void func_80033258(void* allocator);
extern void func_8000DC08(void* resource);

void func_800DFF4C(ObjectDFF4C* object) {
    StateDFF4C* state;
    void* allocator;
    s32 index;

    state = object->state;
    if (state->counter15 == state->counter14) {
        allocator = state->allocator;
        func_800DF19C(object, state->info, state->counter14 + 1,
                      state->counter15, state->field8);
        func_80033258(allocator);
    } else {
        state->field24 = state->info->valueC;
        state->field28 = state->info->count;
    }
    if (state->resources != 0) {
        index = 0;
        if (state->info->count != 0) {
            do {
                func_8000DC08(state->resources[(u8)index]);
                index++;
            } while ((u8)index < state->info->count);
        }
    }
    state->counter15++;
}
