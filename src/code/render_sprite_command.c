#include "types.h"

extern u32* D_80084F5C;
extern void func_80008FA0(void);

void func_8000AD2C(u32 value, u32 scale) {
    u32* command = D_80084F5C;

    D_80084F5C = command + 2;
    command[0] = 0xB4000000;
    command[1] = scale;
    D_80084F5C = command + 4;
    command[2] = 0xAF0007FF;
    command[3] = value;
    func_80008FA0();
}
