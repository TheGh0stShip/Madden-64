#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} GfxPair;

extern GfxPair *D_80084F5C;
extern void display_texture_configure(u32, u32, u32, u32, u32, u32, u32, u32,
                                      u32, u32, u32, u32);
extern void display_tile_size_set(s32 tile, s32 upper_s, s32 upper_t,
                                  s32 lower_s, s32 lower_t);

void display_texture_tile_load(void *texture, u32 format, u32 width, u32 height,
                               s32 upper_s, s32 upper_t, s32 lower_s, s32 lower_t,
                               u32 palette, u32 clamp_s, u32 clamp_t,
                               u32 mask_s, u32 mask_t, u32 shift_s, u32 shift_t)
{
    u32 line;

    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xFD080000 | ((format & 7) << 21) | (((width >> 1) - 1) & 0xFFF);
        command->w1 = (u32)texture;
    }
    line = ((((u32)(lower_s - upper_s + 1) >> 1) + 7) >> 3);
    display_texture_configure(format, 1, line, 0, 7, 0, clamp_t, mask_t,
                              shift_t, clamp_s, mask_s, shift_s);
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xE6000000;
        command->w1 = 0;
    }
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xF4000000 | (((upper_s << 1) & 0xFFF) << 12) | ((upper_t << 2) & 0xFFF);
        command->w1 = 0x07000000 | (((lower_s << 1) & 0xFFF) << 12) | ((lower_t << 2) & 0xFFF);
    }
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xE7000000;
        command->w1 = 0;
    }
    display_texture_configure(format, 0, line, 0, 0, palette, clamp_t, mask_t,
                              shift_t, clamp_s, mask_s, shift_s);
    display_tile_size_set(0, upper_s << 2, upper_t << 2, lower_s << 2, lower_t << 2);
}
