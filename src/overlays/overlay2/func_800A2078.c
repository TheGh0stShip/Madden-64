#include "types.h"

typedef struct { s8 count; } Unk800C4EEB;
extern Unk800C4EEB D_800C4EEB;
u8 func_80092BD0(u8, s32, s32);

void func_800A2078(s16 index, u16 *values, s16 *flags)
{
    u16 value = values[index];
    u16 i;
    s16 found;

    do {
        value = func_80092BD0(value, 0x7D, 0);
        found = 0;
        for (i = 0; i < D_800C4EEB.count; i++) {
            if (i != (u16)index && flags[i] == 1 && value == values[i]) {
                found = 1;
                break;
            }
        }
    } while (found == 1);
    values[index] = value;
}
