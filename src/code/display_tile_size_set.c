#include "types.h"

extern s32 D_8008882C[];
extern s32 D_80088830[];
extern s32 D_80088834[];
extern s32 D_80088838[];
extern u32 *D_80084F5C;

void display_tile_size_set(s32 tile, s32 upper_s, s32 upper_t,
                           s32 lower_s, s32 lower_t)
{
    s32 saved_tile = tile;
    s32 saved_upper_s = upper_s;
    s32 saved_lower_t = lower_t;

    if (D_8008882C[saved_tile * 19] != saved_upper_s ||
        D_80088830[saved_tile * 19] != upper_t ||
        D_80088834[saved_tile * 19] != lower_s ||
        D_80088838[saved_tile * 19] != saved_lower_t) {
        u32 *command = D_80084F5C;
        u32 word0;
        u32 word1;

        word0 = 0xF2000000 | ((saved_upper_s & 0xFFF) << 12) |
                (upper_t & 0xFFF);
        D_80084F5C = command + 2;
        command[0] = word0;
        word1 = ((saved_tile & 7) << 24) |
                ((lower_s & 0xFFF) << 12) | (saved_lower_t & 0xFFF);
        command[1] = word1;
        D_8008882C[saved_tile * 19] = saved_upper_s;
        D_80088830[saved_tile * 19] = upper_t;
        D_80088834[saved_tile * 19] = lower_s;
        D_80088838[saved_tile * 19] = saved_lower_t;
    }
}
