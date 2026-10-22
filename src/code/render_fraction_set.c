#include "types.h"

extern u32* volatile D_80084F5C;
extern u32 D_80088A60;

void func_8000ADC0(u32 value) {
    u32* state = &D_80088A60;
    u32 complement = 0x10000 - value;

    if (*state != value) {
        u32* command = D_80084F5C;
        register u32 opcode_0 asm("$4") = 0xBC000404;
        register u32 opcode_1 asm("$5") = 0xBC000C04;
        register u32 opcode_2 asm("$6") = 0xBC001404;
        register u32 opcode_3 asm("$7") = 0xBC001C04;

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
