#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

extern Gfx *D_80084F5C;
void display_texture_configure(s32 fmt, s32 siz, s32 line, s32 tmem, s32 tile, s32 palette, s32 cmt, s32 maskt,
                               s32 shiftt, s32 cms, s32 masks, s32 shifts);
void display_tile_size_set(s32 tile, s32 uls, s32 ult, s32 lrs, s32 lrt);

void display_texture_update(u32 timg, s32 fmt, u32 siz, s32 width, s32 height, s32 uls, s32 ult, s32 lrs, s32 lrt,
                            s32 pal, s32 cms, s32 cmt, s32 masks, s32 maskt, s32 shifts, s32 shiftt) {
    Gfx *gfx;
    s32 load_bytes;
    s32 tile_bytes;

    switch (siz) {
        case 0:
            load_bytes = 0;
            tile_bytes = 0;
            break;
        case 1:
            load_bytes = 1;
            tile_bytes = 1;
            break;
        case 2:
            load_bytes = 2;
            tile_bytes = 2;
            break;
        case 3:
            load_bytes = 2;
            tile_bytes = 2;
            break;
        default:
            tile_bytes = 0;
            load_bytes = 0;
            break;
    }
    gfx = D_80084F5C++;
    gfx->w0 = ((fmt & 7) << 21) | 0xFD000000 | ((siz & 3) << 19) | ((width - 1) & 0xFFF);
    gfx->w1 = timg;
    display_texture_configure(fmt, siz, ((u32)((lrs - uls + 1) * load_bytes) + 7) >> 3, 0, 7, 0, cmt, maskt, shiftt, cms,
                              masks, shifts);
    gfx = D_80084F5C++;
    gfx->w0 = 0xE6000000;
    gfx->w1 = 0;
    gfx = D_80084F5C++;
    gfx->w0 = 0xF4000000 | (((uls << 2) & 0xFFF) << 12) | ((ult << 2) & 0xFFF);
    gfx->w1 = 0x07000000 | (((lrs << 2) & 0xFFF) << 12) | ((lrt << 2) & 0xFFF);
    gfx = D_80084F5C++;
    gfx->w0 = 0xE7000000;
    gfx->w1 = 0;
    display_texture_configure(fmt, siz, ((u32)((lrs - uls + 1) * tile_bytes) + 7) >> 3, 0, 0, pal, cmt, maskt, shiftt, cms,
                              masks, shifts);
    display_tile_size_set(0, uls << 2, ult << 2, lrs << 2, lrt << 2);
}
