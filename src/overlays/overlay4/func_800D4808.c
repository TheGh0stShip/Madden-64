#include "types.h"

typedef struct Obj { u8 pad0[0x8C]; s32 x8C; s32 x90; s32 x94; } Obj;

s16 func_8001FA38(s32);
s16 func_8002098C(void);
s32 func_80020AE8(Obj *);
u16 func_80031A1C(u16);
s32 func_800C0018(Obj *, s16, s32);
s32 func_800E1C98(Obj *);
extern s16 D_80086CB0;
extern s32 D_80087B60;
extern s16 D_800894FC;
extern volatile u16 D_8008A5B4;

s32 func_800D4808(Obj *arg0) {
    if (func_8001FA38(7) == 0) {
        return 1;
    }
    if (arg0->x94 < 0) {
        if (D_800894FC != 0) {
            func_800E1C98(arg0);
            return 1;
        }
        if (arg0->x8C != 0 && D_80086CB0 > 0 && func_80031A1C(arg0->x8C) < 4) {
            if (func_8002098C() == 0) {
                arg0->x94 = 10;
                func_80020AE8(arg0);
                return 0;
            }
            return 1;
        }
        return 0;
    }
    arg0->x94 -= D_8008A5B4;
    if (arg0->x94 != 0) {
        D_80087B60 = 0xF0001;
        func_800C0018(arg0, arg0->x90 << 9, 0);
    }
    return 0;
}
