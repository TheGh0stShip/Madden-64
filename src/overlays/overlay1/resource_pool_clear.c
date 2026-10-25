#include "types.h"

extern void *D_800718E8;
extern s32 D_800718F0;
extern s16 D_800718E0;
extern s16 D_800718E4;
extern s16 D_80064A72;
extern void func_80032F3C(s32 value, void *pool);

void resource_pool_clear(void)
{
    if (D_800718E8 != 0) {
        D_800718F0 = 0;
        D_800718E0 = 0;
        D_800718E4 = 0;
        D_80064A72 = 0;
        func_80032F3C(0, D_800718E8);
        D_800718E8 = 0;
    }
}
