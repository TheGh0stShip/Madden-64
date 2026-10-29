#include "types.h"

typedef struct Obj { u8 pad[0x30]; s16 x30; } Obj;

s32 func_800CE6BC(Obj *);
void func_800E1A84(Obj *, s8 *);
extern s32 D_80080C10;

s32 func_800D1A28(Obj *arg0) {
    s8 sp10;

    if (arg0->x30 != 0 && !(D_80080C10 & 0x40)) {
        sp10 = 0x11;
        func_800E1A84(arg0, &sp10);
        return 1;
    }
    return (u16)func_800CE6BC(arg0);
}
