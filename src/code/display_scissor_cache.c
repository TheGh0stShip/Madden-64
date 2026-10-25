#include "types.h"

extern u32 *D_80084F5C;
extern s32 D_800887A0;
extern s32 D_800887A4;
extern s32 D_800887A8;

void display_scissor_cache(s32 x, s32 y, s32 width)
{
    s32 saved_x = x;

    if (D_800887A0 != saved_x || D_800887A4 != y || D_800887A8 != width) {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xEB000000;
        command[1] = ((width & 0xFFF) << 16) | ((saved_x & 0xFF) << 8) |
                     (y & 0xFF);
        D_800887A0 = saved_x;
        D_800887A4 = y;
        D_800887A8 = width;
    }
}
