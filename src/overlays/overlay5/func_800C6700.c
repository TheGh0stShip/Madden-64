#include "types.h"

typedef struct C6700State {
    u8 pad00[0xC];
    u16 first_range[2];
    u16 second_range[2];
    u8 pad14[4];
    u16 scale[2];
    u8 pad1C[0x10];
    s32 total[2];
    u8 pad34[0x1C];
    u16 scale_side;
    u16 range_side;
} C6700State;

u16 func_80022B3C(s32, s32, s32);
u16 func_80031A1C(s32);
void func_80025A4C(s32, s32, s32, s32);
s16 func_800C651C(C6700State *, s16, s16);

s32 func_800C6700(C6700State *state, s32 first_arg, s16 second_arg, s16 adjust) {
    s32 initial_first;
    s32 initial_second;
    s32 final_first;
    s32 final_second;
    u16 query3;
    u16 query4;
    u16 query11;
    u16 random_range;
    u16 random10;
    s16 amount;
    s32 value;
    s32 result;

    initial_first = (u16)first_arg;
    initial_second = (u16)second_arg;
    query3 = func_80022B3C(initial_first, initial_second, 3);
    query4 = func_80022B3C(initial_first, initial_second, 4);
    query11 = func_80022B3C(initial_first, initial_second, 11);
    random_range = func_80031A1C(state->first_range[state->range_side]);
    random10 = func_80031A1C(10);

    value = ((query3 + query4 + (query11 >> 1)) * 2) - random_range;
    amount = random10 + ((value - 256) / 128);
    if (amount > 0) {
        amount = (amount * state->scale[state->scale_side]) >> 8;
    }
    amount -= (amount * func_80031A1C(state->second_range[state->scale_side ^ 1])) >> 10;

    if (adjust != 0) {
        if (amount >= 2) {
            if (func_80022B3C(initial_first, initial_second, 11) < 78) {
                amount -= func_80031A1C((u16)(amount - 1));
            }
        }
    }

    final_first = (u16)first_arg;
    final_second = (u16)second_arg;
    func_80025A4C(final_first, final_second, 9, 1);
    func_80025A4C(final_first, final_second, 10, amount);
    state->total[state->scale_side] += amount;
    result = func_800C651C(state, amount, second_arg);
    switch (result) {
        case 1:
            func_80025A4C(final_first, final_second, 11, 1);
            break;
        case 2:
            amount |= 0x8000;
            break;
    }
    return amount;
}
