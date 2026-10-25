#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_8001EBB8
#endif

#ifndef BYTE_OFFSET
#define BYTE_OFFSET 0x24
#endif

#ifndef OBJECT_OFFSET
#define OBJECT_OFFSET 0x28
#endif

typedef struct UiIndexState {
    u8 pad0[BYTE_OFFSET];
    u8* states;
    u8 pad1[OBJECT_OFFSET - BYTE_OFFSET - 4];
    void** objects;
} UiIndexState;

typedef struct UiIndexOwner {
    u8 pad[8];
    UiIndexState* state;
} UiIndexOwner;

extern void func_80017CA4(void* object, s16 value);

void FUNCTION(UiIndexOwner* owner, s32 index, s16 value) {
    UiIndexState* state;

    state = owner->state;
    state->states[index] = state->states[index] & 0xF0;
    state->states[index] = state->states[index] | 0x20 | value;
    if (state->objects[index]) {
        func_80017CA4(state->objects[index], (s16)value);
    }
}
