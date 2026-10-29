#include "types.h"

s16 func_800AD9B0(u16);

s32 func_800AD9B8(u16 count) {
    s32 found;
    s32 i;

    found = 0;
    if (count <= 0x40 && count != 0) {
        i = 0;
        if (count != 0) {
            do {
                if (func_800AD9B0(i) != 0) {
                    found = 1;
                    break;
                }
                i++;
            } while ((u16)i < count);
        }
    }
    return found;
}
