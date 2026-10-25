#include "types.h"

extern s32 D_8008929C;
extern void func_8003D78C(s32 value);

void transient_mode_clear(void)
{
    if (D_8008929C != 0 && (u32)D_8008929C < 5) {
        func_8003D78C(0);
        D_8008929C = 0;
    }
}
