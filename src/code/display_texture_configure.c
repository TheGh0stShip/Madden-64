#include "types.h"

typedef struct {
    s32 fmt;
    s32 siz;
    s32 line;
    s32 tmem;
    s32 palette;
    s32 cmt;
    s32 maskt;
    s32 shiftt;
    s32 cms;
    s32 masks;
    s32 shifts;
    u8 unk_2C[0x20];
} TileState;

extern u32 *D_80084F5C;
extern TileState D_80088800[];

void display_texture_configure(s32 fmt, s32 siz, s32 line, s32 tmem, s32 tile, s32 palette, s32 cmt,
                               s32 maskt, s32 shiftt, s32 cms, s32 masks, s32 shifts)
{
    u32 *command;

    if (D_80088800[tile].fmt != fmt || D_80088800[tile].siz != siz || D_80088800[tile].line != line ||
        D_80088800[tile].tmem != tmem || D_80088800[tile].palette != palette || D_80088800[tile].cmt != cmt ||
        D_80088800[tile].maskt != maskt || D_80088800[tile].shiftt != shiftt || D_80088800[tile].cms != cms ||
        D_80088800[tile].masks != masks || D_80088800[tile].shifts != shifts) {
        command = D_80084F5C;
        D_80084F5C = command + 2;
        command[0] = 0xF5000000 | ((fmt & 7) << 21) | ((siz & 3) << 19) | ((line & 0x1FF) << 9) | (tmem & 0x1FF);
        command[1] = ((tile & 7) << 24) | ((palette & 0xF) << 20) | ((cmt & 3) << 18) | ((maskt & 0xF) << 14) |
                     ((shiftt & 0xF) << 10) | ((cms & 3) << 8) | ((masks & 0xF) << 4) | (shifts & 0xF);
        D_80088800[tile].fmt = fmt;
        D_80088800[tile].siz = siz;
        D_80088800[tile].line = line;
        D_80088800[tile].tmem = tmem;
        D_80088800[tile].palette = palette;
        D_80088800[tile].cmt = cmt;
        D_80088800[tile].maskt = maskt;
        D_80088800[tile].shiftt = shiftt;
        D_80088800[tile].cms = cms;
        D_80088800[tile].masks = masks;
        D_80088800[tile].shifts = shifts;
    }
}
