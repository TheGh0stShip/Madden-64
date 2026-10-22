#include "types.h"

extern u32* D_80084F5C;
extern u32 D_80088774;

void func_8000A270(u32 value) {
    u32* state = &D_80088774;
    if (*state != value) {
        u32* command = D_80084F5C;
        D_80084F5C = command + 2;
        command[0] = 0xBA000801;
        command[1] = value;
        *state = value;
    }
}
