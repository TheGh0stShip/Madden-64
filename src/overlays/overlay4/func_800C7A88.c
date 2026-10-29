#include "types.h"

typedef struct { u8 pad0[0x1C]; s32 unk1C; s32 unk20; } SPos;
typedef struct { u8 pad0[0x24]; SPos *unk24; } SPl;
typedef struct { u8 pad0[0x14]; s32 unk14; u8 pad18[4]; s32 unk1C; s32 unk20; } S6178;
extern void func_800B9820(S6178 *);
extern void func_800C0DD4(SPl *);
extern u32 D_80080C10;
extern s16 D_800857F0;
extern S6178 *D_80086178;
extern s32 D_800892B8;
extern u16 D_80089340;
extern u16 D_8008935C;
extern SPl *D_8008A058;
extern u16 D_8008A5B2;
extern s32 D_8008B330;

void func_800C7A88(SPl *arg0) {
    D_80089340 = D_8008A5B2;
    D_8008935C = D_8008A5B2;
    D_8008B330 = 0;
    D_8008A5B2 = 0;
    D_8008A058 = arg0;
    D_800892B8 = 0;
    D_80086178->unk14 &= ~1;
    if (!(D_80080C10 & 0x100) && D_800857F0 == 0) {
        func_800C0DD4(arg0);
    }
    D_80086178->unk1C = D_8008A058->unk24->unk1C;
    D_80086178->unk20 = D_8008A058->unk24->unk20;
    func_800B9820(D_80086178);
}
