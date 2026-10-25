#include "types.h"

extern u8 D_80086CE8[];
extern s32 D_80086178;
extern s32 D_80086CF4;
extern s16 D_800876DC;
extern u16 D_800886FC;
extern s16 D_800782EC;
extern u8 D_8008FBA0[];
extern void func_8000BEE8(s32 value);
extern void func_800A6590(void *object, s32 value);
extern void func_800A3004(void *object, s32 arg1, s32 arg2, s32 arg3);
extern void func_80035F88(u16 arg0, s16 arg1);
extern void func_8002FEA4(void *object, s32 arg1, s32 arg2);

void runtime_frontend_initialize(void)
{
    func_8000BEE8(0);
    func_800A6590(D_80086CE8, 0);
    D_80086CF4 = D_80086178;
    func_800A3004(D_80086CE8, 0, 1, 0xBFF);
    if (D_800876DC != 5) {
        func_80035F88(D_800886FC, D_800782EC);
    }
    func_8002FEA4(D_8008FBA0, 10, 90);
}
