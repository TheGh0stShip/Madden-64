#include "types.h"

extern u32* D_80084F5C;
extern u32 D_8008871C;

void func_80009E58(u32 value) {
    u32* state = &D_8008871C;
    if (*state != value) {
        u32* command = D_80084F5C;
        D_80084F5C = command + 2;
        command[0] = 0xB9000002;
        command[1] = value;
        *state = value;
    }
}
