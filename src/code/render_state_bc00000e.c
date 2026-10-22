#include "types.h"

extern u32* D_80084F5C;
extern u32 D_80088AA0;

void func_8000B140(u32 value) {
    u32* state = &D_80088AA0;
    if (*state != value) {
        u32* command = D_80084F5C;
        D_80084F5C = command + 2;
        command[0] = 0xBC00000E;
        command[1] = value;
        *state = value;
    }
}
