#include "types.h"

extern s32 D_80088724;
extern s32 D_80088728;
extern s32 D_8008872C;
extern s32 D_80088730;
extern s32 D_80088734;
extern s32 D_80088738;
extern u32 *D_80084F5C;

void display_prim_color_set(s32 minimum_level, s32 lod_fraction,
                            s32 red, s32 green, s32 blue, s32 alpha)
{
    if (D_80088724 != minimum_level ||
        D_80088728 != lod_fraction ||
        D_8008872C != red ||
        D_80088730 != green ||
        D_80088734 != blue ||
        D_80088738 != alpha) {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xFA000000 | ((minimum_level & 0xFF) << 8) |
                     (lod_fraction & 0xFF);
        command[1] = (red << 24) | ((green & 0xFF) << 16) |
                     ((blue & 0xFF) << 8) | (alpha & 0xFF);
        D_80088724 = minimum_level;
        D_80088728 = lod_fraction;
        D_8008872C = red;
        D_80088730 = green;
        D_80088734 = blue;
        D_80088738 = alpha;
    }
}
