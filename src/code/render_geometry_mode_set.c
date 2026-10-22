#include "types.h"

extern u32* D_80084F5C;
extern u32 D_80088A74;
extern u32 D_80088A78;

void func_8000AFA8(u32 flags) {
    u32* state = &D_80088A74;

    if ((state[0] & flags) != flags) {
        u32* command = D_80084F5C;

        command[0] = 0xB7000000;
        command[1] = flags;
        D_80084F5C = command + 2;
        state[0] |= flags;
        state[1] |= flags;
    }
}
