#include "types.h"

typedef struct Sub {
    u8 pad[0x1C];
    s32 x1C;
    s32 x20;
} Sub;

typedef struct Obj {
    u8 pad0[0x24];
    Sub *sub;
    u16 flags;
    u8 pad2[0x8C - 0x2A];
    s32 x8C;
    s32 x90;
    s32 x94;
    s32 x98;
    s32 x9C;
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

s32 func_800B9208(Vec *);
s32 func_800C0018(Obj *, s16, s32);
s32 func_800D3A80(Obj *, Res *);
extern Obj *D_8008A058;
extern const Res D_80000B8C;

s32 func_800CFF5C(Obj *arg0) {
    Vec v;
    Res r = D_80000B8C;
    s32 ang;
    s32 t;
    s16 d;

    if (!(arg0->flags & 1)) {
        if (arg0 == D_8008A058) {
            func_800D3A80(arg0, &r);
        }
        if (r.a == 0) {
            v.x = arg0->x8C - arg0->sub->x1C;
            v.z = arg0->x90 - arg0->sub->x20;
            ang = func_800B9208(&v);
            t = (ang - arg0->x9C) & 0xFFF;
            d = t;
            if (t >= 0x800) {
                d = (arg0->x9C - ang) & 0xFFF;
            }
            func_800C0018(arg0, ang, 0);
            if (d < 0x401) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}
