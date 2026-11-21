#include "types.h"

typedef struct { u8 pad[0x14]; s32 unk14; u8 pad18[4]; s32 unk1C; s32 unk20; u8 pad24[8]; s32 unk2C; s32 unk30; } Sub;
typedef struct Obj { u8 pad[0x15]; u8 unk15; u8 unk16; u8 pad17[7]; u8 unk1E; u8 pad1F[5]; Sub *unk24;
    u8 pad28[0x8C-0x28]; s32 unk8C; s32 unk90; s32 unk94; s32 unk98; } Obj;
typedef struct { s32 x; s32 y; } Pos2;
typedef struct { s32 x; s32 y; s32 z; s32 w; } Vec4i;
typedef struct { s32 x; s32 y; s32 z; s32 w; s32 u; s32 v; } Vec6i;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; s32 unk24; } Camera;
typedef struct { u8 timer; u8 pad01; s16 x; s16 y; u8 pad06[6]; Obj *obj; } Flash;

extern s32 D_80080C10;
extern s32 D_80084F34;
extern Camera *D_80086178;
extern u16 D_80086CB2;
extern Flash D_80087AB0;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 D_800894FC;
extern Obj *D_8008A058;

extern u16 func_80031A1C(u16);
extern void func_8003CF78(s32, s32);
extern void func_8004192C(s32);
extern void func_800B8F9C(u16);
extern s32 func_800B9208(Vec6i *);
extern void func_800B9274(s32, Vec6i *, s32);
extern void func_800BE784(void);
extern s32 func_800C0018(Obj *, s16, s32);
extern s32 func_800C0BBC(Obj *, s32);
extern void func_800C1400(s16);
extern void func_800C5F80(void);
extern void func_800C67CC(s32, s32);
extern void func_800C70C4(Vec4i *, s32);
extern void func_800C6330(s32);
extern void func_800DC24C(s32);
extern void func_800E1A84(Obj *, u8 *);
extern void func_800E1C98(void);
extern int abs(int);

s32 func_800DA8CC(Obj *obj) {
    Vec4i vel;
    u8 cmd[8];
    Vec6i pos;
    s32 y;
    s32 x;
    s32 base;
    s32 angle;
    s32 r;
    s32 n;
    s32 t;
    s32 m;
    Vec6i *p;

    if (D_800894FC != 0) {
        func_800E1C98();
        return 1;
    }
    if (obj != D_8008A058) {
        return 0;
    }
    if (obj->unk90 == 0) {
        if (!(D_80080C10 & 0x10000000)) {
            y = obj->unk8C - obj->unk24->unk20;
        } else {
            y = obj->unk24->unk20 - obj->unk8C;
        }
        if (y >= 0) {
            if (!(D_80080C10 & 0x10000000)) {
                func_800C0018(obj, 0, 0);
            } else {
                func_800C0018(obj, 0x800, 0);
            }
            if (obj->unk98 >= 0) {
                y >>= 16;
                y -= 12;
                if (y < 0) {
                    y = -(y << 2);
                }
                m = -y;
                y = m + 0x30;
                obj->unk98 = y;
            }
        } else {
            obj->unk24->unk2C = 0;
            obj->unk24->unk30 = 0;
            if ((u16)(func_800C0BBC(obj, 0x10400) - 2) < 2) {
                func_800C0BBC(obj, 0x35);
                obj->unk24->unk14 |= 0x40000;
            }
            obj->unk24->unk14 |= 0x10000;
            obj->unk90 = -0xF;
        }
    } else if (obj->unk24->unk14 & 0x20000) {
    if (obj->unk24->unk14 & 0x40000) {
    D_80080C10 = (D_80080C10 & ~0xC0) | 8;
    if (!(D_80080C10 & 0x10000000)) {
        func_800C6330(5);
    } else {
        D_80080C10 &= ~0x01000000;
        func_800C6330(4);
    }
    func_8003CF78(0x16, 0xA);
    func_8004192C(0);
    if (D_80080C10 & 0x2000) {
        y = obj->unk98 & 0x7FFF;
        y += 0x30;
        y = ((obj->unk15 >> 4) + 0x24) * y * 0x460 / 0x1680;
        x = (0x18 - (obj->unk16 >> 4)) << 4;
        x = func_80031A1C(x) - (x >> 1);
        x += obj->unk94 * 2;
        y <<= 16;
        x <<= 16;
        func_800BE784();
    } else {
        base = 0;
        y = (func_80031A1C(obj->unk15) + obj->unk15 + 0x240) << 16;
        x = func_80031A1C(0x17E - obj->unk16) << 16;
        if (func_80031A1C(100) < 50) {
            pos.x = -0x1900000;
        } else {
            pos.x = 0x1900000;
        }
        pos.y = 0x2D00000;
        pos.x -= obj->unk24->unk1C;
        pos.y -= obj->unk24->unk20;
        p = &pos;
        angle = (s16)func_800B9208(p);
        r = func_80031A1C(100);
        if (!(D_80080C10 & 0x10000000)) {
            if (D_80084F34 > 0) {
                if (r < 0x61) {
                    goto pass;
                }
                goto shoot;
            } else if (D_80084F34 > -0x1400000) {
                if (r >= 0x2D) {
                    if (r < 0x34) {
pass:
                        func_800B9274(angle, p, y);
                        base = pos.x;
                        y = pos.y;
                        x /= 2;
                    } else {
shoot:
                        if (func_80031A1C(300) > obj->unk16) {
                            x += y / 5;
                            y -= y / 4;
                        }
                    }
                }
            }
        }
        if (func_80031A1C(100) < 50) {
            x = -x;
        }
        x += base;
    }
    n = (abs(y) >> 16) - 0x320;
    if (n < 0) {
        n = -n;
    }
    t = (u8)(obj->unk15 / 24U) - 0x2D;
    n = (n >> 5) - t;
    n = n / 2 + ((y >> 16) & 7);
    D_80086178->unk24 = 0x180000;
    vel.x = x + D_80086178->unk1C;
    if (!(D_80080C10 & 0x10000000)) {
        vel.y = y;
        D_80086178->unk20 = obj->unk24->unk20 + 0x100000;
        func_800C70C4(&vel, n);
        func_800B8F9C(D_80086CB2);
        func_800C67CC(0xCC, (x >> 15) & 0xFFFF);
        func_800C1400(D_800886E0);
        D_80087AB0.timer = 9;
        D_80087AB0.x = D_80086178->unk1C >> 16;
        D_80087AB0.y = D_80086178->unk20 >> 16;
        D_80087AB0.obj = obj;
        func_800C5F80();
        cmd[0] = 0x26;
        cmd[1] = 1;
        cmd[2] = 0x14;
        func_800E1A84(obj, cmd);
    } else {
        vel.y = -y;
        D_80086178->unk20 = obj->unk24->unk20 - 0x100000;
        func_800C70C4(&vel, n);
        func_800B8F9C(D_80086CB2);
        func_800C67CC(0xCC, (x >> 15) & 0xFFFF);
        func_800C1400(D_80088AE4);
        D_80087AB0.timer = 9;
        D_80087AB0.x = D_80086178->unk1C >> 16;
        D_80087AB0.y = D_80086178->unk20 >> 16;
        D_80087AB0.obj = obj;
        func_800C5F80();
    }
    D_80080C10 |= 0x08000008;
    obj->unk24->unk14 &= ~0x10000;
    func_800DC24C(obj->unk1E ^ 1);
    return 1;
    }
    }
    return 0;
}
