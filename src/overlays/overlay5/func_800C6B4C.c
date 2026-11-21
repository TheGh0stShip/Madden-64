#include "types.h"

typedef struct C6B4CState {
    u8 pad00[0x34];
    s32 total[2];
    u8 pad3C[8];
    u16 unk_44;
    u8 pad46[0xA];
    u16 side;
    u16 team;
    s16 unk_54;
    u16 mode;
} C6B4CState;

u16 func_80022538(u16, s32, s32, s16);
u16 func_80022B3C(u16, u16, s32);
void func_80025A4C(u16, u16, s32, s32);
u16 func_80031A1C(u16);
u16 func_800C6454(C6B4CState *, s16);
void overlay5_runtime_sequence_prepare(C6B4CState *);

void func_800C6B4C(C6B4CState *state) {
    u16 index;
    s16 amount;

    switch (state->mode) {
    case 0:
        index = func_80022538(state->team, 9, 0x17, func_80031A1C(2));
        func_80025A4C(state->team, index, 0x21, 1);
        if (func_80031A1C(0x100) >= 3) {
            amount = func_80031A1C(7) + 14 + ((func_80022B3C(state->team, index, 2) + func_80022B3C(state->team, index, 2) + func_80022B3C(state->team, index, 3)) / 768) * 10;
            state->total[state->side] += amount;
            func_80025A4C(state->team, index, 0x22, amount);
            func_80025A4C(state->side, func_800C6454(state, amount), 0x10, 1);
            state->unk_54 = 5;
            state->mode = 1;
            state->unk_44 += amount;
        } else {
            amount = 50 - state->unk_44;
            state->total[state->side] += amount;
            func_80025A4C(state->team, index, 0x22, amount);
            func_80025A4C(state->team, index, 0x23, 1);
            overlay5_runtime_sequence_prepare(state);
        }
        break;
    case 3:
        index = func_80022538(state->team, 5, 0x18, 0);
        func_80025A4C(state->team, index, 0x24, 1);
        if (func_80031A1C(100) >= 2) {
            amount = func_80031A1C(10) + 7 + ((func_80022B3C(state->team, index, 2) + func_80022B3C(state->team, index, 2) + func_80022B3C(state->team, index, 3)) / 768) * 10;
            func_80025A4C(state->team, index, 0x25, amount);
            state->total[state->side] += amount;
            func_80025A4C(state->side, func_800C6454(state, amount), 0x10, 1);
            state->unk_54 = 5;
            state->mode = 1;
            state->unk_44 += amount;
        } else {
            amount = 50 - state->unk_44;
            state->total[state->side] += amount;
            func_80025A4C(state->team, index, 0x25, amount);
            func_80025A4C(state->team, index, 0x26, 1);
            overlay5_runtime_sequence_prepare(state);
        }
        break;
    }
}
