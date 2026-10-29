#include "types.h"

typedef struct { u8 pad0[0x20]; s32 unk20; } SPos;
typedef struct { u8 pad0[0x24]; SPos *unk24; } SPl;
typedef struct { u8 pad0[0x14]; s32 unk14; } S6178;
extern s16 func_8002098C(void);
extern void func_800B9820(S6178 *);
extern SPl *D_80085284;
extern S6178 *D_80086178;
extern u16 D_80089340;
extern s32 D_8008A054;
extern SPl *D_8008A058;
extern u16 D_8008A5B2;
extern s32 D_8008A720;
extern s32 D_8008B330;

void func_800C7BD0(u16 arg0) {
    D_8008B330 = 0;
    D_80089340 = D_8008A5B2;
    if (D_8008A058 != 0) {
        if (func_8002098C() == 0) {
            D_8008A720 = D_8008A058->unk24->unk20;
        }
        D_80085284 = D_8008A058;
    }
    D_8008A058 = 0;
    D_8008A054 = 0;
    D_8008A5B2 = arg0;
    D_80086178->unk14 |= 1;
    func_800B9820(D_80086178);
}
