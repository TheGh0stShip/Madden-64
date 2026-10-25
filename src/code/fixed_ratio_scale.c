#include "types.h"

extern u8 D_80001550[];
extern void func_8002CA88(void *value);

s32 fixed_ratio_scale(s32 value, s32 ratio)
{
    s32 original = ratio;

    ratio >>= 8;
    if (ratio == 0) {
        func_8002CA88(D_80001550);
        value <<= 8;
        if (original < 0) {
            value = -value;
        }
        return value;
    }
    value /= ratio;
    return value << 8;
}
