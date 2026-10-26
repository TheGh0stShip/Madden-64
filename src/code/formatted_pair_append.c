#include "types.h"

extern u8 D_80002D18[];
extern u8 D_80002D1C[];
extern void func_800167FC(s16 value, u8 *destination);
extern u8 *func_8002E688(u8 *destination, const u8 *source);

void formatted_pair_append(u32 value, u8 *destination)
{
    u8 temporary[8];
    u32 quotient = value / 12;

    func_800167FC((s16)quotient, destination);
    func_8002E688(destination, D_80002D18);
    value -= quotient * 12;
    func_800167FC((s16)value, temporary);
    func_8002E688(destination, temporary);
    func_8002E688(destination, D_80002D1C);
}
