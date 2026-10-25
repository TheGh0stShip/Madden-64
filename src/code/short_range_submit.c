#include "types.h"

extern u16 D_8007A9A4;
extern void func_80035F88(s32 first, s32 second);

void func_8004486C(s32 unused0, s32 unused1, s32 base) {
    register s32 index __asm__("$16") = 0;
    register s32 base_value __asm__("$17") = base & 0xFFFF;

    do {
        register s32 current __asm__("$5") = index & 0xFFFF;

        index++;
        func_80035F88(D_8007A9A4, base_value + current);
    } while ((u32)(index & 0xFFFF) < 14);
}
