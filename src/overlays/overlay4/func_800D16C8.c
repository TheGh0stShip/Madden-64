#include "types.h"

typedef struct Sub {
    u8 pad[0x1C];
    s32 x1C;
    s32 x20;
} Sub;

typedef struct Obj {
    u8 pad0[0x1F];
    u8 x1F;
    u8 pad20[4];
    Sub *sub;
    u16 flags;
    u8 pad2[0x8C - 0x2A];
    s32 x8C;
} Obj;

typedef struct Vec {
    s32 x;
    s32 z;
    s32 pad[2];
} Vec;

typedef struct Res {
    u8 a;
    u8 b;
    u8 c;
    u8 d;
} Res;

typedef struct Msg {
    Res res;
    s32 pad4;
    s16 scores[8];
} Msg;

extern const Res D_80000B94;
extern s32 D_80080C10;
extern s32 D_80084F34;
extern Sub *D_80086178;
extern s32 D_8008793C;
extern u16 D_80089320;
extern s16 D_800894FC;
extern u16 D_8008A5B4;

u16 func_80031A1C(s32);
void func_800B9274(s16, Vec *, s32);
s16 func_800B92FC(Vec *);
s16 func_800CFC44(Vec *, u8);
void func_800E1A84(Obj *, Msg *);
void func_800E1BCC(Obj *, Msg *);
void func_800E1C98(Obj *);

s32 func_800D16C8(Obj *arg0) {
    Msg msg;
    Vec pos;
    s32 power;
    u16 ang;
    s16 i;
    s16 dir;
    s16 best;
    s16 bestIndex;

    msg.res = D_80000B94;
    if (!(arg0->flags & 1)) {
        if (D_800894FC != 0) {
            func_800E1C98(arg0);
            return 1;
        }
        if (D_80080C10 & 8) {
            func_800E1A84(arg0, &msg);
            return 1;
        }
        arg0->x8C -= D_8008A5B4;
        if (arg0->x8C < 0) {
            power = (func_80031A1C(0x80) + 0x80) << 16;
            ang = 0;
            for (i = 0; i < 8; i++) {
                msg.scores[i] = 0;
                func_800B9274(ang, &pos, power);
                pos.x += arg0->sub->x1C;
                pos.z += arg0->sub->x20;
                if (pos.x < -0x1900000 || pos.x > 0x1900000) {
                    msg.scores[i] = -1000;
                } else if (pos.z > 0x3C00000) {
                    msg.scores[i] = -1000;
                } else if (pos.z < D_80084F34) {
                    msg.scores[i] = -1000;
                }
                if (msg.scores[i] >= 0) {
                    msg.scores[i] = func_800CFC44(&pos, arg0->x1F);
                    if (pos.z < D_8008793C && (D_80089320 == 3 || D_80089320 == 4)) {
                        msg.scores[i] -= 40;
                    }
                }
                ang += 0x1FF;
            }
            pos.x = D_80086178->x1C - arg0->sub->x1C;
            pos.z = D_80086178->x20 - arg0->sub->x20;
            dir = func_800B92FC(&pos);
            msg.scores[dir] += 25;
            msg.scores[(dir - 1) & 7] += 15;
            msg.scores[(dir + 1) & 7] += 15;
            bestIndex = 4;
            best = -999;
            for (i = 0; i < 8; i++) {
                if (msg.scores[i] > best) {
                    best = msg.scores[i];
                    bestIndex = i;
                }
            }
            ang = bestIndex * 0xFFF / 8;
            msg.res.a = 10;
            msg.res.b = power >> 18;
            msg.res.d = 0;
            msg.res.c = ang >> 5;
            func_800E1BCC(arg0, &msg);
            return 1;
        }
    }
    return 0;
}
