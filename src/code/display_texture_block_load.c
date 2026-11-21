#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} Gwords;

typedef union {
    Gwords words;
    s64 force_structure_alignment;
} Gfx;

#define _SHIFTL(v, s, w) ((u32)(((u32)(v) & ((0x01 << (w)) - 1)) << (s)))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define TXL2WORDS_4b(txls) (MAX(1, ((txls) / 16)))
#define CALC_DXT_4b(width) (((1 << 11) + TXL2WORDS_4b(width) - 1) / TXL2WORDS_4b(width))

extern Gfx *D_80084F5C;

void display_texture_configure(s32 fmt, s32 siz, s32 line, s32 tmem, s32 tile,
                               s32 palette, s32 cmt, s32 maskt, s32 shiftt,
                               s32 cms, s32 masks, s32 shifts);
void display_tile_size_set(s32 tile, s32 upper_s, s32 upper_t, s32 lower_s, s32 lower_t);

void display_texture_block_load(u32 timg, s32 fmt, u32 width, u32 height, s32 palette,
                                s32 cms, s32 cmt, s32 masks, s32 maskt, s32 shifts,
                                s32 shiftt)
{
    {
        Gfx *_g = (Gfx *)(D_80084F5C++);
        _g->words.w0 = _SHIFTL(0xFD, 24, 8) | _SHIFTL(fmt, 21, 3) | _SHIFTL(2, 19, 2) | _SHIFTL(1 - 1, 0, 12);
        _g->words.w1 = (u32)(timg);
    }
    display_texture_configure(fmt, 2, 0, 0, 7, 0, cmt, maskt, shiftt, cms, masks, shifts);
    {
        Gfx *_g = (Gfx *)(D_80084F5C++);
        _g->words.w0 = _SHIFTL(0xE6, 24, 8);
        _g->words.w1 = 0;
    }
    {
        Gfx *_g = (Gfx *)(D_80084F5C++);
        _g->words.w0 = _SHIFTL(0xF3, 24, 8) | _SHIFTL(0, 12, 12) | _SHIFTL(0, 0, 12);
        _g->words.w1 = _SHIFTL(7, 24, 3) | _SHIFTL(MIN((((width) * (height) + 3) >> 2) - 1, 0x7FF), 12, 12) |
                       _SHIFTL(CALC_DXT_4b(width), 0, 12);
    }
    {
        Gfx *_g = (Gfx *)(D_80084F5C++);
        _g->words.w0 = _SHIFTL(0xE7, 24, 8);
        _g->words.w1 = 0;
    }
    display_texture_configure(fmt, 0, ((((width) >> 1) + 7) >> 3), 0, 0, palette, cmt, maskt,
                              shiftt, cms, masks, shifts);
    display_tile_size_set(0, 0, 0, ((width) - 1) << 2, ((height) - 1) << 2);
}
