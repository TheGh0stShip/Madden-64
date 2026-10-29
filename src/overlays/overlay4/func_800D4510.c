#include "types.h"

typedef struct Tgt { u8 pad[0x21]; u8 x21; u8 pad1[0x64 - 0x22]; u8 x64; } Tgt;
typedef struct Obj {
    u8 pad0[0x1E]; u8 x1E; u8 pad1[0x28 - 0x1F]; u16 flags; u8 pad2[0x30 - 0x2A]; s16 x30;
    u8 pad3[0x38 - 0x32]; Tgt *x38; u8 pad4[0x65 - 0x3C]; u8 x65; u8 pad5[0x8C - 0x66];
    s32 x8C; s32 x90; s32 x94;
} Obj;

s32 func_800D2E18(Obj *);
extern s16 D_80089320;
extern volatile u16 D_8008A5B4;
extern s16 D_800886E0;
extern s32 D_80087A70;
extern s16 D_800857F0;

s32 func_800D4510(Obj *arg0) {
    s32 d;
    u8 k;

    if (D_80089320 == -1) {
        return 1;
    }
    if (arg0->flags & 1) {
        return 0;
    }
    arg0->x8C -= D_8008A5B4;
    if (arg0->x8C >= 0) {
        arg0->x30 = 0;
        return 0;
    }
    arg0->x90 -= D_8008A5B4;
    if (arg0->x90 < 0) {
        return 1;
    }
    d = arg0->x30;
    if (d == 0) {
        return 0;
    }
    k = arg0->x38->x64;
    if (k == 5 || k == 0x1F) {
    switch (arg0->x65) {
    case 0:
        if (arg0->x1E == D_800886E0) {
            return 1;
        }
        if (d < arg0->x94 * 8) {
            return 0;
        }
        func_800D2E18(arg0);
        return 1;
    case 1:
        if (D_80087A70 == 0x7FFFFFFF) {
            return 0;
        }
        if (arg0->x94 * 4 >= d) {
            return 0;
        }
        if (d < arg0->x94 * 8) {
            arg0->x65 = 0xF;
        }
        break;
    case 2:
    case 0xE:
        if (arg0->x30 < arg0->x94 * 4) {
            return 0;
        }
        if (arg0->x38 == 0) {
            return 0;
        }
        if (D_800857F0 != 0) {
            return 0;
        }
        if ((arg0->x38->x21 & 0xC0) != 0x40) {
            return 0;
        }
        break;
    default:
        return 0;
    }
    func_800D2E18(arg0);
    return 1;
    }
    return 0;
}
