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

void display_texture_prepare(void *texture, u32 format, u32 size, u32 width,
                             u32 height, u32 palette, u32 clamp_s, u32 clamp_t,
                             u32 mask_s, u32 mask_t, u32 shift_s, u32 shift_t)
{
    u32 load_size;
    u32 incr;
    u32 shift;
    u32 bytes;
    u32 line_bytes;
    u32 words;
    u32 dxt;
    u32 texels;

    switch (size) {
    case 0:
        load_size = 2;
        incr = 3;
        shift = 2;
        bytes = 0;
        line_bytes = 0;
        break;
    case 1:
        load_size = 2;
        incr = 1;
        shift = 1;
        bytes = 1;
        line_bytes = 1;
        break;
    case 2:
        load_size = 2;
        incr = 0;
        shift = 0;
        bytes = 2;
        line_bytes = 2;
        break;
    case 3:
        load_size = 3;
        incr = 0;
        shift = 0;
        bytes = 4;
        line_bytes = 2;
        break;
    default:
        line_bytes = 0;
        bytes = 0;
        shift = 0;
        incr = 0;
        load_size = 0;
        break;
    }
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xFD000000 | ((format & 7) << 21) | (load_size << 19);
        command->w1 = (u32)texture;
    }
    display_texture_configure(format, load_size, 0, 0, 7, 0, clamp_t, mask_t,
                              shift_t, clamp_s, mask_s, shift_s);
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xE6000000;
        command->w1 = 0;
    }
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xF3000000;
        words = (width * bytes) >> 3;
        dxt = 0x800;
        if (words != 0) {
            dxt = words + 0x7FF;
        }
        texels = ((width * height + incr) >> shift) - 1;
        if (texels > 0x7FF) {
            texels = 0x7FF;
        }
        command->w1 = 0x07000000 | ((texels & 0xFFF) << 12) |
                      ((words != 0 ? dxt / words : dxt) & 0xFFF);
    }
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xE7000000;
        command->w1 = 0;
    }
    display_texture_configure(format, size, (width * line_bytes + 7) >> 3, 0, 0,
                              palette, clamp_t, mask_t, shift_t, clamp_s, mask_s,
                              shift_s);
    display_tile_size_set(0, 0, 0, (width - 1) << 2, (height - 1) << 2);
}
