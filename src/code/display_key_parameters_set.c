#include "types.h"

extern s32 D_800887AC;
extern s32 D_800887B0;
extern s32 D_800887B4;
extern s32 D_800887B8;
extern s32 D_800887BC;
extern s32 D_800887C0;
extern u32 *D_80084F5C;

void display_key_parameters_set(s32 red_center, s32 green_center,
                                s32 scale, s32 blue_center,
                                s32 alpha_center, s32 width)
{
    if (D_800887AC != red_center ||
        D_800887B0 != green_center ||
        D_800887B4 != scale ||
        D_800887B8 != blue_center ||
        D_800887BC != alpha_center ||
        D_800887C0 != width) {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xEA000000 | ((scale & 0xFFF) << 12) |
                     (width & 0xFFF);
        command[1] = (red_center << 24) | ((green_center & 0xFF) << 16) |
                     ((blue_center & 0xFF) << 8) | (alpha_center & 0xFF);
        D_800887AC = red_center;
        D_800887B0 = green_center;
        D_800887B4 = scale;
        D_800887B8 = blue_center;
        D_800887BC = alpha_center;
        D_800887C0 = width;
    }
}
