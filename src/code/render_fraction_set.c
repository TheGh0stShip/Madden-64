#include "types.h"

extern u32* volatile D_80084F5C;
extern u32 D_80088A60;

void func_8000ADC0(u32 value) {
    u32* state = &D_80088A60;
    u32 complement = 0x10000 - value;

    if (*state != value) {
        u32* command = D_80084F5C;
        u32 opcode_0 = 0xBC000404;
        u32 opcode_1 = 0xBC000C04;
        u32 opcode_2 = 0xBC001404;
        u32 opcode_3 = 0xBC001C04;

        D_80084F5C = command + 2;
        D_80084F5C = command + 4;
        D_80084F5C = command + 6;
        command[0] = opcode_0;
        command[1] = value;
        command[2] = opcode_1;
        command[3] = value;
        command[4] = opcode_2;
        command[5] = complement;
        D_80084F5C = command + 8;
        command[6] = opcode_3;
        command[7] = complement;
        *state = value;
    }
}
