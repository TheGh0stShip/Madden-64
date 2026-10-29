#include "types.h"

typedef struct Obj {
    u8 pad0[0x28]; u16 flags; u8 pad1[0x30 - 0x2A]; s16 x30;
    u8 pad2[0x65 - 0x32]; u8 x65; u8 x66; u8 pad3[0x8C - 0x67];
    s32 x8C; s32 x90; s32 x94;
} Obj;

s16 func_8001FA38(u8, u8);
extern s16 D_80089320;

s32 func_800D4494(Obj *arg0) {
    s32 v = arg0->x66;

    arg0->x30 = 0;
    arg0->x90 = 0x28;
    arg0->x8C = v;
    arg0->flags &= ~1;
    arg0->x94 = 10 - func_8001FA38(arg0->x65, v);
    if (D_80089320 != -1) {
        return D_80089320 == 0;
    }
    return 1;
}
