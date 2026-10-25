#include "types.h"

extern void *D_80088090;

extern s32 func_800C157C(void);
extern s32 func_8000C8EC(void *object);

u8 oriented_value_bucket(void)
{
    register s32 value __asm__("$16");

    value = (s16)func_800C157C();

    if (func_8000C8EC(D_80088090) != 0) {
        value += 0x800;
    }
    value >>= 4;
    return value;
}
