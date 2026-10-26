#include "types.h"

extern u32 *D_80084F5C;
extern s32 D_8008883C[];
extern s32 D_80088840[];
extern s32 D_80088844[];
extern s32 D_80088848[];

void display_texture_parameters_set(s32 scale_s, s32 scale_t, s32 level,
                                    s32 tile, s32 enabled)
{
    register s32 saved_scale_s __asm__("$8") = scale_s;
    register s32 saved_scale_t __asm__("$9") = scale_t;
    register s32 saved_enabled __asm__("$10") = enabled;
    if (D_8008883C[tile * 0x13] != saved_scale_s ||
        D_80088840[tile * 0x13] != saved_scale_t ||
        D_80088844[tile * 0x13] != level ||
        D_80088848[tile * 0x13] != saved_enabled) {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xBB000000 | ((level & 7) << 11) |
                     ((tile & 7) << 8) | (saved_enabled & 0xFF);
        command[1] = (saved_scale_s << 16) | (saved_scale_t & 0xFFFF);
        D_8008883C[tile * 0x13] = saved_scale_s;
        D_80088840[tile * 0x13] = saved_scale_t;
        D_80088844[tile * 0x13] = level;
        D_80088848[tile * 0x13] = saved_enabled;
    }
}
