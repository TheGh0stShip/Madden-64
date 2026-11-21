#include "types.h"

extern s32 D_80087FA4;
extern u8 *D_80087FA0;

void func_800A2800(void) {
    u8 *object;

    if (D_80087FA4 != 8) {
        object = *(u8 **)(D_80087FA0 + 0x24);
        *(u32 *)(object + 0x14) |= 1;
    }
}
