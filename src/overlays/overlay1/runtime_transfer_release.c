#include "types.h"

extern u16 D_80087914;
extern u16 D_8008A71C;
extern void *D_80089350;
extern void *D_8008931C;
extern s32 func_80036540(s32 value);
extern void func_8000D834(void *owner, void *resource);

void runtime_transfer_release(void)
{
    if (D_80087914 == 1) {
        func_80036540(0);
        D_80087914 = 0;
        D_8008A71C &= ~2;
    }
    if (D_80089350 != 0) {
        func_8000D834(D_8008931C, D_80089350);
        D_80089350 = 0;
    }
}
