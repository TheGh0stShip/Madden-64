#include "types.h"

typedef struct { u8 a, b, c, d; } Msg;
typedef struct { s32 x; s32 y; s32 z; s32 w; } Vec4i;
typedef struct { u8 pad[0x1C]; s16 unk1C; u8 pad1E[2]; s16 unk20; } Cam;
typedef struct { u8 pad[8]; u16 unk8; } Info;
typedef struct { u8 pad[0x14]; s32 unk14; u8 pad18[0x1C - 0x18]; s32 unk1C; s32 unk20; u8 pad24[0x48 - 0x24]; Info *unk48; } Sub;
typedef struct Obj { u8 pad[0x1E]; u8 unk1E; u8 pad1F[0x24 - 0x1F]; Sub *unk24; u16 unk28; u8 pad2A[0x2D - 0x2A]; u8 unk2D;
    u8 pad2E[0x30 - 0x2E]; s16 unk30; u8 pad32[0x64 - 0x32]; u8 unk64; } Obj;
typedef struct { Obj *p[22]; } Team;

int abs(int);

void func_800A365C(s32);
void func_8003CF78(s32, s32);
void func_800AD460(void);
void func_800B9438(Sub *, Vec4i *);
void func_8009CCD4(void);
void func_800ABCA0(s32, s32);
void func_80041E54(s32);
void func_80041DD4(s32, s32, s32);
void func_80041BDC(s32, s32);
void func_800418F8(void);
void func_800C5F80(void);
void func_8009E958(void);
void func_8009CA5C(s32, s32);
void func_800C61E8(Obj *);
void func_800E1BAC(Obj *, Msg *);
void func_800E1A84(Obj *, Msg *);
void func_800C1744(void);
extern s16 D_800876F6;
extern s32 D_80080C10;
extern u16 D_8008A5B2;
typedef struct { s8 unk0; u8 unk1; s16 unk2; s16 unk4; u8 pad6[0xC - 0x6]; Obj *unkC; } Kick;
extern Kick D_80087AB0;
extern s16 D_80087AF0;
extern s16 D_80088AE4;
extern s16 D_80089320;
extern Sub *D_80086178;
extern u16 D_8008B672;
extern Obj *D_80085040[][22];
extern Obj *D_8008A058;
extern s32 D_80087A70;

void func_800C872C(Obj *a0) {
    Msg m;
    Vec4i pos;
    s32 h;
    s32 x;
    s32 y;
    s16 i;
    Obj *o;

    a0->unk30 = 0;
    func_800A365C(4);
    if (a0->unk28 & 8) {
        func_8003CF78(0x19, 0xF);
        if (a0->unk2D != 0x1D || a0->unk2D != 0x1E) {
            D_800876F6 = 20;
        } else {
            D_800876F6 = 5;
        }
        D_80080C10 &= ~0x140;
        func_800AD460();
    } else {
        D_800876F6 = 0;
        if (D_8008A5B2 == 3) {
            func_800B9438(a0->unk24, &pos);
            h = (a0->unk24->unk48->unk8 - 3) << 16;
            if (a0->unk24->unk20 + h > 0x3C00000 || pos.y + h > 0x3C00000) {
                func_8009CCD4();
                return;
            }
            x = abs(a0->unk24->unk1C);
            y = pos.x;
            if (y < 0) {
                y = -y;
            }
            if (x < y) {
                x = y;
            }
            x += h;
            if (x > 0x18FFFFF) {
                func_8009CCD4();
                return;
            }
            func_8003CF78(0x19, 0xF);
            func_800ABCA0(0, 0xF0);
            D_80087AB0.unk0 = 0x15;
            if (D_80088AE4 == 0) {
                func_80041E54(0xC);
            } else {
                func_80041DD4(0x3B, 0xF, 0x12C);
            }
            if (D_80089320 != 0) {
                func_80041BDC(2, 0x32);
            }
        } else {
            func_800ABCA0(2, 0xF0);
            if (D_8008A5B2 == 4) {
                D_80087AB0.unk0 = 0xE;
                D_80080C10 &= ~0x100;
            } else {
                D_80087AB0.unk0 = 0x14;
            }
            D_80087AB0.unk1 = a0->unk1E;
        }
        func_800418F8();
        D_80087AB0.unk2 = D_80086178->unk1C >> 16;
        D_80087AB0.unk4 = D_80086178->unk20 >> 16;
        D_80087AB0.unkC = a0;
        func_800C5F80();
        D_80087AF0 = 0x46;
        D_80080C10 &= ~0x8000;
        if (D_80089320 != 0) {
            func_8009E958();
        } else {
            func_8009CA5C(0x2D, 0xD2);
        }
    }
    func_800C61E8(a0);
    for (i = 0; i < D_8008B672 >> 1; i++) {
        o = D_80085040[D_80088AE4][i];
        if (o == D_8008A058) {
            m.a = 9;
        } else {
            m.a = 0x11;
        }
        if ((o->unk28 & 0x10) || (o->unk24->unk14 & 0x10000) || o->unk64 == 0x24) {
            func_800E1BAC(o, &m);
        } else {
            func_800E1A84(o, &m);
        }
    }
    func_800C1744();
    D_80087A70 = 0x7FFFFFFF;
}
