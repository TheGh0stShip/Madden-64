#include "types.h"

typedef struct { u8 a, b, c, d; } Msg;
typedef struct Obj { u8 pad[0xE]; u8 unkE; u8 padF[0x28-0xF]; u16 unk28; u8 pad2A[0x8C-0x2A];
    s32 unk8C; s32 unk90; s32 unk94; s32 unk98; s32 unk9C; s32 unkA0; } Obj;
extern u16 func_80031A1C(s32);
extern void func_800C058C(Obj *, s16, s16, s32);
extern s16 func_800D5EDC(Obj *);
extern s32 func_800DC6BC(s32);
extern void func_800DC9F4(Obj *);
extern void func_800E1A84(Obj *, Msg *);
extern void func_800E1C98(void);
extern s32 D_80080C10;
extern s16 D_800894FC;
extern volatile u16 D_8008A5B4;
extern s16 (*D_80069E40[])(Obj *, u16);

s32 func_800DBCA8(Obj *arg0) {
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
        arg0->unkA0 = (0xFF - arg0->unkE) >> 5;
        r = func_800D5EDC(arg0);
        if (r >= 3) {
            if (r != 5) {
                if ((func_80031A1C(0x14) < 0xF || (D_80080C10 & 8)) && r != 3) {
                    m.a = 0x12;
                    func_800E1A84(arg0, &m);
                    return 1;
                }
            } else {
                k = (arg0->unkE >> 5) + 8;
                if (k >= func_80031A1C(0x12)) {
                    m.a = 0xC;
                    func_800E1A84(arg0, &m);
                    return 1;
                }
            }
        }
        if (arg0->unk90 != 1) {
            func_800DC9F4(arg0);
            if (arg0->unk94 != 0 && arg0->unk8C >= 0x5B && func_800DC6BC(arg0->unk94) == 0) {
                m.a = 0x19;
                m.b = arg0->unk94;
                m.c = 0;
                m.d = 0;
                func_800E1A84(arg0, &m);
                return 1;
            }
        } else {
            arg0->unk90 = D_80069E40[arg0->unk94](arg0, arg0->unk8C);
            if (arg0->unk90 == 0) {
                arg0->unkA0 = 0;
            }
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
