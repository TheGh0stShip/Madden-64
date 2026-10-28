#include "types.h"

extern u16 D_8007A9A4;
extern void func_80035F88(s32 first, s32 second);

void func_8004486C(s32 unused0, s32 unused1, s32 base) {
    s32 index = 0;
    s32 base_value = base & 0xFFFF;

    do {
        s32 current = index & 0xFFFF;

        index++;
        func_80035F88(D_8007A9A4, base_value + current);
    } while ((u32)(index & 0xFFFF) < 14);
}
