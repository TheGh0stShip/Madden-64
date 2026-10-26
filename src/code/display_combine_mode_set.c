#include "types.h"

extern s32 D_800887D4;
extern s32 D_800887D8;
extern s32 D_800887DC;
extern s32 D_800887E0;
extern s32 D_800887E4;
extern u32 *D_80084F5C;

void display_combine_mode_set(s32 mode, u32 upper_s, u32 upper_t,
                              u32 lower_s, u32 lower_t)
{
    if (D_800887D4 != mode || D_800887D8 != upper_s ||
        D_800887DC != upper_t || D_800887E0 != lower_s ||
        D_800887E4 != lower_t) {
        u32 *command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xED000000 |
                     ((((s32)((f32)upper_s * 4.0f)) & 0xFFF) << 12) |
                     (((s32)((f32)upper_t * 4.0f)) & 0xFFF);
        command[1] = ((mode & 3) << 24) |
                     ((((s32)((f32)lower_s * 4.0f)) & 0xFFF) << 12) |
                     (((s32)((f32)lower_t * 4.0f)) & 0xFFF);
        D_800887D4 = mode;
        D_800887D8 = upper_s;
        D_800887DC = upper_t;
        D_800887E0 = lower_s;
        D_800887E4 = lower_t;
    }
}
