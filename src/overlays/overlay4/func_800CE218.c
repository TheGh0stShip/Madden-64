#include "types.h"

typedef struct { u8 pad0[0x1C]; s32 unk1C; s32 unk20; } SPos;
typedef struct { u8 pad0[0x24]; SPos *unk24; u8 pad28[0x4C - 0x28]; s16 unk4C; } SPl;
typedef struct { SPl *unk0; u8 pad4[0x1C]; s16 unk20; } SArg;
extern u32 D_80080C10;
extern s32 D_80084F30;
extern s32 D_80084F34;
extern SPos *D_80086178;
extern s16 D_80089320;

s32 func_800CE218(SArg *arg0) {
    SPl *p = arg0->unk0;
    s32 d;
    if (p->unk4C != 0) {
        return 0;
    }
    if ((D_80080C10 & 0x48) == 0x40) {
        if (arg0->unk20 == 1) {
            return 0;
        }
        if (D_80084F34 + 0x100000 < p->unk24->unk20) {
            return 0;
        }
        d = D_80084F30 - p->unk24->unk1C;
        if (d < 0) {
            d = -d;
        }
        if (d > 0xC00000) {
            return 0;
        }
    }
    if ((D_80080C10 & 0x100) && D_80089320 != -1 && D_80084F34 + 0x200000 < arg0->unk0->unk24->unk20) {
        return 0;
    }
    return arg0->unk0->unk24->unk20 - D_80086178->unk20 >= -0xF00000;
}
