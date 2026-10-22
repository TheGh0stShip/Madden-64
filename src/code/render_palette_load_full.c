#include "types.h"

extern u32* D_80084F5C;
extern void func_8000AAD4(u32, u32, u32, u32, u32, u32, u32, u32,
                          u32, u32, u32, u32);

void func_800093F4(const void* texture) {
    register u32* command asm("$3") = D_80084F5C;

    D_80084F5C = command + 2;
    command[0] = 0xFD100000;
    command[1] = (u32)texture;
    D_80084F5C = command + 4;
    command[2] = 0xE8000000;
    command[3] = 0;
    func_8000AAD4(0, 0, 0, 0x100, 7, 0, 0, 0, 0, 0, 0, 0);
    command = D_80084F5C;
    D_80084F5C = command + 2;
    command[0] = 0xE6000000;
    command[1] = 0;
    D_80084F5C = command + 4;
    command[2] = 0xF0000000;
    command[3] = 0x073FC000;
    D_80084F5C = command + 6;
    command[4] = 0xE7000000;
    command[5] = 0;
}
