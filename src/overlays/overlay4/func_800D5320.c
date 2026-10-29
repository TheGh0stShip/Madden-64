#include "types.h"

typedef struct Slot { u8 a, b, c, d; } Slot;
typedef struct Obj {
    u8 pad0[0xE]; u8 xE; u8 pad1[0x1F - 0xF]; u8 x1F; u8 pad2[0x30 - 0x20]; s16 x30;
    u8 pad3[0x64 - 0x32]; Slot slots[10]; u8 pad4[0xA0 - 0x8C]; s32 xA0;
} Obj;
typedef struct Msg { s8 a; u8 b; u8 c; u8 d; } Msg;

u16 func_800C1608(Obj *);
s32 func_800C9090(Obj *, s32);
s32 func_800E1A84(Obj *, Msg *);
extern s32 D_80080C10;
extern s16 D_80085112[];
extern s32 D_80087B60;
extern volatile u16 D_8008A5B4;

void func_800D5320(Obj *arg0, Msg *arg1) {
    s32 i, found;
    u16 dir;

    if (arg0->x30 != 0) {
        D_80087B60 = 0xC0022;
    }
    if (arg0->x1F == 0) {
        return;
    }
    arg0->xA0 -= D_8008A5B4;
    if (arg0->xA0 >= 0) {
        return;
    }
    arg0->xA0 = (0xFF - arg0->xE) >> 4;
    arg1->a = 0;
    found = 0;
    if (D_80080C10 & 2) {
        return;
    }
    for (i = 1; i < 10; i++) {
        if (arg0->slots[i].a == 0xB) {
            found = 1;
            break;
        }
    }
    if (found) {
        return;
    }
    if (arg0->slots[0].d == 0) {
        arg1->a = 9;
        arg1->c = arg0->slots[0].c;
        arg1->d = arg0->slots[0].d;
    } else {
        arg1->a = 0xB;
        arg1->b = arg0->slots[0].d;
        arg1->c = 0;
    }
    func_800C9090(arg0, found);
    dir = func_800C1608(arg0);
    if (D_80085112[dir] < -4 || D_80085112[(dir + 1) & 7] < -5 || D_80085112[(dir - 1) & 7] < -5) {
        func_800E1A84(arg0, arg1);
        return;
    }
    arg1->a = 0;
}
