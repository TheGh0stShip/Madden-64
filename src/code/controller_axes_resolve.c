#include "types.h"

extern u8 D_800880E8[];
extern s8 D_80086DE4[];
extern u8 D_8008B3B2[];
extern void func_80030B9C(s16 index, s32 *flags);

void controller_axes_resolve(s32 index, s8 *horizontal, s8 *vertical)
{
    register s8 *saved_horizontal __asm__("$16") = horizontal;
    register s8 *saved_vertical __asm__("$17") = vertical;
    s32 flags;
    u32 bits;
    s32 x;
    s32 y;
    s32 mapped;

    if (D_800880E8[(s16)index] == 1) {
        goto direct;
    }
    func_80030B9C((s16)index, &flags);
    bits = flags;
    x = (bits & 0x800) ? 0xB0 : 0;
    y = 0;
    if (bits & 0x400) {
        x = 0x50;
    }
    if (bits & 0x200) {
        y = -0x50;
    }
    if (bits & 0x100) {
        x = 0x50;
    }
    *saved_horizontal = y;
    *saved_vertical = x;
    goto done;

direct:
    mapped = D_80086DE4[(s16)index];
    *saved_horizontal = D_8008B3B2[mapped * 6];
    mapped = D_80086DE4[(s16)index];
    *saved_vertical = D_8008B3B2[mapped * 6 + 1];

done:
    return;
}
