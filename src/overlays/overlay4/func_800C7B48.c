#include "types.h"

typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; } SB48c;
typedef struct { u8 pad[0x24]; SB48c *unk24; } SB48a;
typedef struct { u8 pad[0x14]; s32 unk14; u8 pad18[4]; s32 unk1C; s32 unk20; } S6178;
extern void func_800B9820(S6178 *, SB48a *);
extern s32 D_80085284;
extern S6178 *D_80086178;
extern u16 D_80089340;
extern SB48a *D_8008A054;
extern s32 D_8008A058;
extern u16 D_8008A5B2;
extern s32 D_8008B330;

void func_800C7B48(SB48a *arg0) {
    D_80086178->unk14 &= ~1;
    D_80086178->unk1C = arg0->unk24->unk1C;
    D_8008B330 = 0;
    D_8008A058 = 0;
    D_8008A054 = arg0;
    D_80085284 = 0;
    D_80089340 = D_8008A5B2;
    D_8008A5B2 = 0;
    D_80086178->unk20 = arg0->unk24->unk20;
    func_800B9820(D_80086178, arg0);
}
