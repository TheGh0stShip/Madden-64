#include "types.h"

u16 func_800BBBFC(u16 index) {
    u8* object = *(u8**)0x800718E8;
    s32 delta = index - *(u16*)(object + 8);

    if (delta < 0) {
        delta += 0x250;
    }
    return delta;
}
