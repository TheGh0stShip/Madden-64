#include "types.h"

extern s16 D_80088AE4;
extern u8 D_80085044[];
extern s32 D_80084F30;

s32 func_800DCFD8(void)
{
    u8 **entry = (u8 **)(D_80085044 + D_80088AE4 * 88);
    s32 best = -0x01900000;
    s32 index;

    for (index = 1; index < 6; index++, entry++) {
        u8 *object = *entry;
        u8 *child = *(u8 **)(object + 0x24);
        s32 value = *(s32 *)(child + 0x1C);

        if (value > best) {
            best = value;
        }
    }
    best -= D_80084F30;
    return best;
}
