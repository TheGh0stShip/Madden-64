#include "types.h"

typedef struct { u8 a, b, c, d; } Msg;
typedef struct { u8 pad[0x1C]; s32 unk1C; u8 pad20[0x2C - 0x20]; s32 unk2C; } Sub;
typedef struct Obj { u8 pad[0xE]; u8 unkE; u8 padF[0x24 - 0xF]; Sub *unk24; u16 unk28; u8 pad2A[0x65 - 0x2A];
    u8 unk65; u8 pad66[0x8C - 0x66]; s32 unk8C; u8 pad90[0xA0 - 0x90]; s32 unkA0; } Obj;
extern u16 func_80031A1C(s32);
extern void func_800C058C(Obj *, s16, s16, s32);
extern s16 func_800D5EDC(Obj *);
extern void func_800E1A84(Obj *, Msg *);
extern void func_800E1C98(void);
extern s32 D_80080C10;
extern Sub *D_80086178;
extern s16 D_800894FC;
extern Obj *D_8008A058;
extern volatile u16 D_8008A5B4;

s32 func_800DAC70(Obj *arg0) {
    Msg m;
    s16 r;
    Sub *p;

    if (arg0->unk28 & 1) {
        return 0;
    }
    if (D_800894FC != 0) {
        func_800E1C98();
        return 1;
    }
    arg0->unk8C += D_8008A5B4;
    if (arg0->unk65 * 4 < arg0->unk8C) {
        return 1;
    }
    arg0->unkA0 -= D_8008A5B4;
    if (arg0->unkA0 < 0) {
        r = 0;
        arg0->unkA0 = (0xFF - arg0->unkE) >> 4;
        if (func_80031A1C(0x24) < 9 || (D_80080C10 & 8)) {
            r = func_800D5EDC(arg0);
        }
        if (r >= 3) {
            if (r != 3) {
                m.a = 0x12;
                func_800E1A84(arg0, &m);
                return 1;
            }
        }
    }
    if (D_8008A058 != 0) {
        p = D_8008A058->unk24;
        if (p->unk2C >= 0) {
            if (p->unk2C != 0) {
                if (arg0->unk24->unk1C < p->unk1C) {
                    func_800C058C(arg0, 0x400, 0x800, 0x9999);
                }
            }
        } else {
            if (p->unk1C < arg0->unk24->unk1C) {
                func_800C058C(arg0, 0xC00, 0x800, 0x9999);
            }
        }
    } else {
        p = D_80086178;
        if (p->unk2C >= 0) {
            if (p->unk2C != 0) {
                if (arg0->unk24->unk1C < p->unk1C) {
                    func_800C058C(arg0, 0x400, 0x800, 0x9999);
                }
            }
        } else {
            if (p->unk1C < arg0->unk24->unk1C) {
                func_800C058C(arg0, 0xC00, 0x800, 0x9999);
            }
        }
    }
    return 0;
}
