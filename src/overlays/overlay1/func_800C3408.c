#include "types.h"

typedef struct {
    u8 pad00[0x8];
    u32 unk_08;
} Unk800BECE4Info;

typedef struct {
    u8 pad00[0x1E];
    u8 unk_1E;
    u8 pad1F[0x21 - 0x1F];
    u8 unk_21;
    u8 pad22[0x94 - 0x22];
    s32 unk_94;
    s32 unk_98;
} Unk800BECE4Arg;

extern s8 D_8008B2A8[];
extern Unk800BECE4Info *D_80072720[];
extern s16 D_800886E0;
u32 func_800BD694(Unk800BECE4Arg *);
s16 func_800BC004(Unk800BECE4Arg *);
u8 func_800A6580(void);

s32 func_800C3408(Unk800BECE4Arg *arg0) {
    Unk800BECE4Info *info;
    u32 mask;
    s16 angle;
    s16 delta;
    s16 sector;

    info = D_80072720[D_8008B2A8[arg0->unk_21 & 0xBF]];
    mask = func_800BD694(arg0);
    angle = func_800BC004(arg0);
    if (func_800A6580() == 7) {
        if (arg0->unk_1E == D_800886E0 && angle >= 0) {
            angle = (angle + 0x800) & 0xFFF;
        }
    }
    if (arg0->unk_98 >= 0) {
        delta = 0;
        sector = angle >> 9;
        if (sector > 0) {
            if (sector < 4) {
                if (arg0->unk_94 < 0xF0) {
                    delta = 0x10;
                }
            }
            if (sector >= 5 && sector < 8) {
                if (arg0->unk_94 > -0xF0) {
                    delta = -0x10;
                }
            }
        }
        arg0->unk_94 += delta;
        if (mask & info->unk_08) {
            arg0->unk_98 |= 0x80000000;
        }
    }
    return 0;
}
