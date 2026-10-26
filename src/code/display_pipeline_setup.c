#include "types.h"

#define FIELD(object, type, offset) (*(type *)((u8 *)(object) + (offset)))

extern u32 *volatile D_80084F5C;
extern void func_800427C8(void *argument, u32 value);

void display_pipeline_setup(void *object, u32 segment_address, void *argument)
{
    register u32 word0 __asm__("$2") = 0x01060040;
    register u32 *command __asm__("$3") = D_80084F5C;
    register u32 word2 __asm__("$7") = 0xBC000406;
    register u32 field_value __asm__("$2");
    register u32 call_value __asm__("$5");

    command[0] = word0;
    command[1] = segment_address - 0x80000000;
    command[2] = word2;
    field_value = FIELD(object, volatile u32, 0xC);
    command[3] = field_value;
    call_value = FIELD(object, volatile u32, 0xC);
    D_80084F5C = command + 2;
    D_80084F5C = command + 4;
    func_800427C8(argument, call_value);

    {
        register u32 setup0 __asm__("$6") = 0xB900031D;
        register u32 setup1 __asm__("$5") = 0x00552078;
        register u32 setup2 __asm__("$7") = 0xFC60FEC1;
        register u32 setup3 __asm__("$4") = 0x55FE793C;
        register u32 *output __asm__("$2") = D_80084F5C;

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
