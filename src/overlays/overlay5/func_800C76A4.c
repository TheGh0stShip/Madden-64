#include "types.h"

typedef struct StateC76A4 {
    u8 pad[0x50];
    u16 id;
    u16 pad52;
    u16 counter;
} StateC76A4;

u16 func_80031A1C(s32 limit);
s32 func_80022538(u32 team, u32 roster, s32 first, s32 second);
void func_80025A4C(u16 id, u16 value, s32 kind, s32 enabled);
void func_800C6700(StateC76A4 *state, s16 id, s16 value, s32 zero);

s32 func_800C76A4(StateC76A4 *state) {
    s32 result = 0;
    u16 choice;

    state->counter++;
    choice = func_80031A1C(20);
    switch (choice) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
            result = func_80022538(state->id, 0, 1, 0);
            break;
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
            result = func_80022538(state->id, 0, 2, 0);
            break;
        case 19:
            if (func_80031A1C(1) != 0) {
                result = func_80022538(state->id, 0, 3, 0);
            } else {
                result = func_80022538(state->id, 0, 2, 0);
            }
            break;
    }
    func_80025A4C(state->id, (u16)result, 9, 1);
    func_800C6700(state, state->id, (s16)result, 0);
    return 45;
}
