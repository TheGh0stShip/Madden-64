#include "types.h"

typedef struct { u8 a, b, c, d; } Msg;
typedef struct { u8 pad[0x20]; s32 unk20; } Sub;
typedef struct Obj { u8 pad[0xE]; u8 unkE; u8 padF[0x24-0xF]; Sub *unk24; u16 unk28; u8 pad2A[0x8C-0x2A];
    s32 unk8C; s32 unk90; s32 unk94; s32 unk98; s32 unk9C; s32 unkA0; } Obj;
extern u16 func_80031A1C(s32);
extern void func_800C058C(Obj *, s16, s16, s32);
extern s16 func_800D5EDC(Obj *);
extern void func_800DC72C(Obj *);
extern void func_800E1A84(Obj *, Msg *);
extern void func_800E1C98(void);
extern s32 D_80080C10;
extern s32 D_80087A74;
extern s16 D_800894FC;
extern u16 D_8008A5B2;
extern volatile u16 D_8008A5B4;
extern s16 (*D_80069E40[])(Obj *, u16);

s32 func_800DBA58(Obj *arg0) {
    Msg m;
    s16 r;
    s32 k;

    if (arg0->unk28 & 1) {
        return 0;
    }
    if (D_800894FC != 0) {
        func_800E1C98();
        return 1;
    }
    arg0->unk8C += D_8008A5B4;
    arg0->unkA0 -= D_8008A5B4;
    if (arg0->unkA0 < 0) {
        arg0->unkA0 = (0xFF - arg0->unkE) >> 4;
        r = func_800D5EDC(arg0);
        if (D_8008A5B2 == 3 && arg0->unk24->unk20 < D_80087A74) {
            r = 5;
        }
        if (r >= 3) {
            if (r != 5) {
                if ((func_80031A1C(0x40) < 0xF || (D_80080C10 & 8)) && r != 3) {
                    m.a = 0x12;
                    goto send;
                }
            } else {
                k = (arg0->unkE >> 5) + 8;
                if (k >= func_80031A1C(0xC) || arg0->unk24->unk20 < D_80087A74) {
                    m.a = 0xC;
                send:
                    func_800E1A84(arg0, &m);
                    return 1;
                }
            }
        }
        if (arg0->unk90 == 1) {
            arg0->unk90 = D_80069E40[arg0->unk94](arg0, arg0->unk8C);
            if (arg0->unk90 == 0) {
                arg0->unkA0 = 0;
            }
        } else {
            func_800DC72C(arg0);
        }
    }
    if (arg0->unk98 >= 0) {
        if (arg0->unk9C == 0x10000) {
            func_800C058C(arg0, arg0->unk98, arg0->unk98, 0x10000);
        } else {
            func_800C058C(arg0, arg0->unk98, 0x7FF, arg0->unk9C);
        }
    }
    return 0;
}
