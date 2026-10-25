#include "types.h"

extern void *D_80065428;
extern s32 D_8006542C;
extern void *func_80032E00(s32 value, u32 size);
extern void func_80094FC0(void);

void large_pool_initialize(void)
{
    if (D_80065428 == 0) {
        D_80065428 = func_80032E00(0, 0xC800);
        D_8006542C = 0;
    }
    func_80094FC0();
}
