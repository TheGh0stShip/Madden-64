#include "types.h"

extern u32* D_80084F5C;
extern u32 D_80088A6C;
extern u32 D_80088A70;

void func_8000AE60(u32 upper, u32 lower) {
    u32* state = &D_80088A6C;

    if (state[0] != upper || state[1] != lower) {
        u32* command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xBC000008;
        command[1] = (upper << 16) | (lower & 0xFFFF);
        state[0] = upper;
        state[1] = lower;
    }
}
