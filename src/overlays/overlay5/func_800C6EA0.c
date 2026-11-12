#include "types.h"

typedef struct C6EA0State {
    u8 pad00[0x44];
    s16 position;
    u8 pad46[0xA];
    u16 id;
} C6EA0State;

s32 func_80022538(s32, s32, s32, s32);
void func_80025A4C(s32, s32, s32, s32);
s32 func_80031A1C(s32);
s32 func_80022B3C(s32, s32, s32);

static inline s32 combine_movement(s32 base, s32 random) {
    base += 37;
    return random + base;
}

s32 func_800C6EA0(C6EA0State *state) {
    s32 selection;
    s32 first_random;
    s32 movement;
    s16 result;
    s32 value;

    selection = (u16)func_80022538(state->id, 2, 22, 0);
    func_80025A4C(state->id, selection, 29, 1);
    if ((u16)func_80031A1C(100) < 5) {
        func_80025A4C(state->id, selection, 32, 1);
        return -0x8000;
    }

    value = (u16)func_80022B3C(state->id, selection, 9);
    movement = combine_movement(func_80031A1C((u16)value >> 4),
                                func_80031A1C(10));
    state->position -= movement;
    result = movement;

    if (state->position < -50) {
        if ((u16)func_80031A1C(1) != 0) {
            value = (u16)state->position + movement;
            state->position = value;
            func_80025A4C(state->id, selection, 30, (s16)(value + 30));
            result = (value + 30) | 0x8000;
            state->position = -30;
        } else {
            value = (u16)state->position + movement;
            state->position = value;
            result = value + 49;
            func_80025A4C(state->id, selection, 30, (s16)(value + 49));
            state->position = -49;
        }
        goto done;
    } else {
        func_80025A4C(state->id, selection, 30, (s16)movement);
    }

    if (state->position < -30) {
        first_random = func_80031A1C(256);
        value = func_80022B3C(state->id, selection, 10);
        if ((u16)first_random < ((u16)value >> 2)) {
            func_80025A4C(state->id, selection, 31, 1);
            return (s16)(movement | -0x8000);
        }
    }
done:
    return (s16)result;
}
