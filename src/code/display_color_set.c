#include "types.h"

#ifndef FUNCTION
#define FUNCTION display_blend_color_set
#endif
#ifndef COMMAND
#define COMMAND 0xF9000000
#endif

extern u32 *D_80084F5C;
extern s32 CACHE_RED;
extern s32 CACHE_GREEN;
extern s32 CACHE_BLUE;
extern s32 CACHE_ALPHA;

void FUNCTION(s32 red, s32 green, s32 blue, s32 alpha)
{
    s32 saved_red = red;

    if (CACHE_RED != saved_red || CACHE_GREEN != green || CACHE_BLUE != blue ||
        CACHE_ALPHA != alpha) {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = COMMAND;
        command[1] = (saved_red << 24) | ((green & 0xFF) << 16) |
                     ((blue & 0xFF) << 8) | (alpha & 0xFF);
        CACHE_RED = saved_red;
        CACHE_GREEN = green;
        CACHE_BLUE = blue;
        CACHE_ALPHA = alpha;
    }
}
