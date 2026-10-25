#include "types.h"

extern u32* D_80084F5C;
extern u32 D_800887C4;

void func_8000A5D4(u32 first, u32 second) {
    register u32 saved_first asm("$6") = first;
    register u32* state asm("$7") = &D_800887C4;

    if (state[0] != saved_first || state[1] != second) {
        u32* command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xEE000000;
        command[1] = (saved_first << 16) | (second & 0xFFFF);
        state[0] = saved_first;
        state[1] = second;
    }
}
