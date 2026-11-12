#include "types.h"

#define FIELD(object, type, offset) (*(type *)((u8 *)(object) + (offset)))

extern u32 *volatile D_80084F5C;
extern void func_800427C8(void *argument, u32 value);

void display_pipeline_setup(void *object, u32 segment_address, void *argument)
{
    u32 word0 = 0x01060040;
    u32 *command = D_80084F5C;
    u32 word2 = 0xBC000406;
    u32 field_value;
    u32 call_value;

    command[0] = word0;
    command[1] = segment_address - 0x80000000;
    command[2] = word2;
    field_value = FIELD(object, volatile u32, 0xC);
    command[3] = field_value;
    call_value = FIELD(object, volatile u32, 0xC);
    D_80084F5C = command + 2;
    D_80084F5C = command + 4;
    do {
        func_800427C8(argument, call_value);
    } while (0);

    {
        u32 setup0 = 0xB900031D;
        u32 setup1 = 0x00552078;
        u32 setup2 = 0xFC60FEC1;
        u32 setup3 = 0x55FE793C;
        u32 *output = D_80084F5C;

        D_80084F5C = output + 2;
        output[0] = 0xBD000000;
        D_80084F5C = output + 4;
        output[1] = 0;
        output[2] = setup0;
        output[3] = setup1;
        D_80084F5C = output + 6;
        output[4] = setup2;
        output[5] = setup3;
    }
}
