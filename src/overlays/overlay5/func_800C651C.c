#include "types.h"

typedef struct C651CState {
    u8 pad00[0x44];
    s16 position;
    s16 secondary;
    u8 pad48[8];
    u16 first_id;
    u16 second_id;
    s16 mode;
    u8 pad56[4];
    s16 triggered;
} C651CState;

void func_800259E4(u16, s32, s32);
void func_80025A4C(u16, u16, s32, s32);
void func_800C6170(C651CState *);
u16 func_800C6454(C651CState *, s16);
u16 func_80031A1C(s32);
u16 func_80022188(u16, s32, u16);

s32 func_800C651C(C651CState *state, s16 amount, s32 kind) {
    u16 value;
    u16 random;
    u16 selected_kind;
    s16 delta;

    delta = amount;
    state->position -= amount;
    selected_kind = kind;
    if (state->position < -30 && state->triggered == 0) {
        func_800259E4(state->first_id, 15, 1);
        func_800259E4(state->second_id, 18, 1);
        state->triggered = 1;
    }

    state->secondary -= delta;
    if (state->position < -60) {
        func_800C6170(state);
        if (state->triggered != 0) {
            func_800259E4(state->first_id, 16, 1);
            func_800259E4(state->second_id, 19, 1);
        }
        return 1;
    }

    value = func_800C6454(state, delta);
    random = func_80031A1C(100);
    if (random < 85) {
        func_80025A4C(state->second_id, value, 16, 1);
        if (func_80031A1C(256) < 3) {
            func_80025A4C(state->first_id, selected_kind, 12, 1);
            func_80025A4C(state->second_id, value, 21, 1);
            if (func_80031A1C(100) < 50) {
                value = func_800C6454(state, delta);
                func_80025A4C(state->second_id, value, 22, 1);
                state->mode = 6;
                func_800259E4(state->first_id, 3, 1);
                return 2;
            } else {
                random = func_80031A1C(11);
                value = func_80022188(state->first_id, 0, random);
                func_80025A4C(state->first_id, value, 22, 1);
            }
        }
    }
    return 0;
}
