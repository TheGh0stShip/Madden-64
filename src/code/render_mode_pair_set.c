#include "types.h"

extern u32* D_80084F5C;
extern u32 D_800887CC;

void func_8000A63C(u32 first, u32 second) {
    u32 saved_first = first;
    u32* state = &D_800887CC;

    if (state[0] != saved_first || state[1] != second) {
        u32* command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xB900031D;
        command[1] = saved_first | second;
        state[0] = saved_first;
        state[1] = second;
    }
}
