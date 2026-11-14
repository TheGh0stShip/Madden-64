#include "types.h"

extern u8* D_80087FA0;

void func_800A6F00(void) {
    u32 mask;
    u8* object;

    do {
        do {
            mask = ~1;
        } while (0);
    } while (0);

    object = *(u8**)(D_80087FA0 + 0x24);
    *(volatile u32*)(object + 0x14) &= mask;
}
