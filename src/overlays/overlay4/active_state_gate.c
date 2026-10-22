#include "types.h"

extern void func_800C7590(s32 value);

s32 func_800C8334(void) {
    u8* active = *(u8**)0x80086178;

    if ((u32)(*(s32*)(active + 0x24) - 9) < 28) {
        func_800C7590(0);
        return 1;
    }
    return 0;
}
