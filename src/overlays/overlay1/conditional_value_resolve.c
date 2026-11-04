#include "types.h"

extern u16 func_80039750(void *object);
extern u16 func_800AE65C(void);
extern s32 func_800AE680(void);

s32 conditional_value_resolve(void *unused, void *object)
{
    s32 result = 0;
    u16 expected = func_80039750(object);

    if (expected == func_800AE65C()) {
        result = func_800AE680();
    }
    return result;
}
