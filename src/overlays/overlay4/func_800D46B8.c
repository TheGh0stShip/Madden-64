#include "types.h"

typedef struct Sub { u8 pad[0x20]; s32 x20; } Sub;
typedef struct Obj { u8 pad0[0x24]; Sub *sub; u8 pad1[0x38 - 0x28]; s32 x38; u8 pad2[0x65 - 0x3C]; u8 x65; } Obj;

s16 func_8001FA68(u8, s32, s32, s32);
s32 func_800E1A84(Obj *, s8 *);
s32 func_800E1BAC(Obj *, s8 *);
extern Sub *D_80086178;

void func_800D46B8(Obj *arg0) {
    s8 sp10;

    if (func_8001FA68(arg0->x65, arg0->x38, arg0->sub->x20, D_80086178->x20) == 1) {
        sp10 = 0x1A;
        func_800E1A84(arg0, &sp10);
        sp10 = 0x11;
        func_800E1BAC(arg0, &sp10);
        return;
    }
    sp10 = 0x11;
    func_800E1A84(arg0, &sp10);
}
