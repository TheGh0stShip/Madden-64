#include "types.h"

extern s32 D_8008929C;
extern u32 D_80080C10;
extern void func_800AEA9C(s32 value);
extern void func_8002FF70(void *object);

void runtime_mode_enable(void *object)
{
    if (D_8008929C == 0) {
        func_800AEA9C(0);
        func_8002FF70(object);
        D_80080C10 = (D_80080C10 | 0x20000000) & 0xFFF7FFFF;
    }
}
