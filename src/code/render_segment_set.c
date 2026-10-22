#include "types.h"

extern u32* D_80084F5C;
extern u32 D_80088A9C;

void func_8000B0EC(u32 value) {
    u32* state = &D_80088A9C;
    if (*state != value) {
        u32* command = D_80084F5C;
        D_80084F5C = command + 2;
        command[0] = 0xBC000002;
        command[1] = ((value + 1) << 5) - 0x80000000;
        *state = value;
    }
}
