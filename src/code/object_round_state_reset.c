#include "types.h"

typedef struct ObjectCallbacks ObjectCallbacks;

struct ObjectCallbacks {
    void (*reset)(void *object);
    void (*set_enabled)(void *object, s32 enabled);
    u8 pad08[0x0C];
    s32 mode;
};

typedef struct ObjectRoundState {
    u8 pad00[0x50];
    s32 active;
} ObjectRoundState;

void object_round_state_reset(void *object)
{
    register u8 *state __asm__("$16") = object;
    register void *first_object __asm__("$4") = object;
    ObjectRoundState *round;
    s32 i;

    __asm__("" : "=r"(state) : "0"(state));
    __asm__("" : "=r"(first_object) : "0"(first_object));
    (*(ObjectCallbacks **)state)->mode = 101;
    (*(ObjectCallbacks **)state)->set_enabled(first_object, 1);

    if ((*(ObjectRoundState **)(state + 0x1B4))->active != 0) {
        (*(ObjectCallbacks **)state)->mode = 60;
        (*(ObjectCallbacks **)state)->reset(state);
    }

    for (i = 0; i < 16; i++) {
        register u8 *entry __asm__("$2") = state + i;

        entry[0xE4] = 0;
        entry[0xF4] = 1;
        entry[0x104] = 5;
    }

    round = *(ObjectRoundState **)(state + 0x1B4);
    *(u16 *)(state + 0x11E) = 1;
    *(u16 *)(state + 0x120) = 1;
    *(u32 *)(state + 0x114) = 0;
    *(u32 *)(state + 0x24) = 0;
    *(u32 *)(state + 0x12C) = 0;
    *(u32 *)(state + 0x118) = 0;
    state[0x11C] = 0;
    *(u32 *)(state + 0x124) = 0;
    state[0x128] = 0;
    round->active = 1;
}
