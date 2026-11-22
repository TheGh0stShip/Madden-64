#include "types.h"
typedef struct Sub { u8 pad[0x20]; s32 x20; } Sub;
typedef struct Obj { u8 pad0[0x21]; u8 x21; u8 pad1[2]; Sub *sub; u16 flags; u8 pad5[0x62]; s32 x8C; u8 pad6[8]; s32 x98; s32 x9C; s32 xA0; } Obj;
typedef struct Team { Obj *players[22]; } Team;
typedef struct Msg { s8 a; s8 b; s8 c; } Msg;
s32 func_80031A1C();
s32 func_800A365C();
s32 func_800E1A84();
extern s32 D_80080C10, D_80084F34;
extern Team D_80085040[];
extern s16 D_800886E0;
extern Obj *D_8008A058;
extern s8 D_8008B320[];

s32 func_800D25C8(arg0)
Obj *arg0;
{
    Msg m;
    s32 k;
    if (!(arg0->flags & 1)) {
        if (arg0 == D_8008A058 && (D_80080C10 & 8)) {
            m.a = 9; m.b = 0; m.c = 0;
            func_800E1A84(arg0, &m);
            return 1;
        }
        arg0->xA0 = 0; arg0->x98 = 2; arg0->x8C = 0;
        k = (-((u16)func_80031A1C(100) >= 30) & 5) | 4;
        if (!(arg0->x21 & 0xC0) && (D_80085040 + D_800886E0)->players[D_8008B320[10-k]]->sub->x20 < D_80084F34) {
            arg0->x98 = -1; arg0->x8C = -20;
        }
        if (arg0 == D_8008A058) func_800A365C(2);
    }
    return 0;
}
