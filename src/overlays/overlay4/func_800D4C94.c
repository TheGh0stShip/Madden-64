#include "types.h"

typedef struct Sub { u8 pad[0x20]; s32 x20; u8 pad2[0x2C - 0x24]; s32 x2C; s32 x30; } Sub;
typedef struct Obj {
    u8 pad0[0x21]; u8 x21; u8 pad1[0x24 - 0x22]; Sub *sub; u16 flags;
    u8 pad2[0x65 - 0x2A]; u8 x65; u8 pad3[0x90 - 0x66]; s32 x90;
} Obj;

s32 func_800BE784(void);
s32 func_800C0D00(Obj *, s32);
s32 func_800C0DD4(Obj *);
extern s32 D_80080C10;
extern Obj *D_8008A058;

s32 func_800D4C94(Obj *arg0) {
    Sub *s;
    s32 f;

    switch (arg0->x65) {
    case 0:
        f = D_80080C10;
        D_80080C10 = f & ~0x100;
        if (f & 0x2000) {
            func_800BE784();
        }
        if ((D_80080C10 & 2) && D_8008A058 != 0 && !(D_8008A058->x21 & 0xC0)) {
            func_800C0DD4(D_8008A058);
            return 1;
        }
        return 1;
    case 1:
        s = arg0->sub;
        s->x30 = 0;
        s->x2C = 0;
        func_800C0D00(arg0, 4);
        arg0->flags |= 0x10;
        break;
    case 3:
        arg0->flags = (arg0->flags & ~1) | 0x10;
        arg0->x90 = arg0->sub->x20 - 0x180000;
        break;
    default:
        return 0;
    }
    return 0;
}
