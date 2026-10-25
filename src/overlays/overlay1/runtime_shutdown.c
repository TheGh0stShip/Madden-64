#include "types.h"

extern u32 D_80080C10;
extern u16 D_80080C20;
extern s16 D_8008B33C;
extern void func_800BDF68(void);
extern u16 func_80016FD4(void);
extern void func_80035EF0(u16 value, s32 type);

void runtime_shutdown(void)
{
    func_800BDF68();
    D_80080C10 &= ~0x2000;
    func_80035EF0(func_80016FD4(), 0x1B);
    func_80035EF0(func_80016FD4(), 0x1D);
    func_80035EF0(func_80016FD4(), 0x1C);
    D_8008B33C = -1;
    D_80080C20 = 0;
}
