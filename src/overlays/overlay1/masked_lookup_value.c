#include "types.h"

extern s32 func_80034198(void *context, u16 selector);

u16 masked_lookup_value(void *context, u16 value, s32 selector)
{
    register s32 result __asm__("$2");
    register u16 saved __asm__("$16") = value;

    result = func_80034198(context, (selector << 8) & 0xFF00) & 0xFF;
    result = (u32)result > 0;
    result = -result;
    saved &= result;
    return saved;
}
