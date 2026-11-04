#include "types.h"

typedef struct C6974State {
    u8 pad00[0x10];
    u16 range[2];
    u8 pad14[4];
    u16 scale[2];
    u8 pad1C[8];
    s32 total[2];
    u8 pad2C[0x24];
    u16 side;
} C6974State;

u16 func_80022B3C(u16, u16, s32);
u16 func_80031A1C(u16);
void func_80025A4C(u16, u16, s32, s32);
s16 func_800C651C(C6974State *, s16, s16);

s32 func_800C6974(C6974State *state, s32 first_arg, s32 second_arg, s32 kind_arg) {
    s16 amount;
    s32 reduction;
    u16 base;
    u16 limit;
    u16 first;
    u16 second;
    u16 kind;
    s16 signed_amount;
    s32 result;

    first = first_arg;
    second = second_arg;
    kind = kind_arg;
    base = func_80022B3C(first, second, 2);
    limit = func_80022B3C(first, second, 3);
    amount = ((base >> 1) + func_80031A1C(limit)) / 16;
    if (amount > 0) {
        amount = (amount * state->scale[state->side]) >> 8;
    }

    reduction = (amount * func_80031A1C(state->range[state->side ^ 1])) >> 10;
    amount -= reduction;
    func_80025A4C(first, second, 13, 1);
    signed_amount = amount;
    func_80025A4C(first, second, 14, signed_amount);
    state->total[state->side] += signed_amount;

    result = func_800C651C(state, signed_amount, second_arg);
    switch (result) {
        case 1:
            func_80025A4C(first, second, 15, 1);
            func_80025A4C(first, kind, 6, 1);
            break;
        case 2:
            amount |= 0x8000;
            break;
    }
    return (s16)amount;
}
