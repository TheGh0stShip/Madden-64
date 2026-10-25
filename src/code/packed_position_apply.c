#include "types.h"

extern void **D_8006929C;
extern void func_80017000(void *object, s32 y, s32 x);
extern void func_80018540(void *object);

void packed_position_apply(u32 packed)
{
    register u32 x __asm__("$6") = packed;
    register void *object __asm__("$16");
    register void **objects __asm__("$3");
    register u32 index __asm__("$2");
    register void *call_object __asm__("$4");
    u32 x_negative;
    register s32 y __asm__("$5");

    x = packed;
    index = x >> 24;
    objects = D_8006929C;
    index <<= 2;
    index += (u32)objects;
    object = *(void **)index;
    x_negative = packed & 0x800;
    x &= 0xFFF;
    if (x_negative) {
        x |= -0x1000;
    }
    y = (s32)packed >> 12;
    y &= 0xFFF;
    if (y & 0x800) {
        y |= -0x1000;
    }
    call_object = object;
    y <<= 16;
    x <<= 16;
    y >>= 16;
    x = (s32)x >> 16;
    func_80017000(call_object, y, x);
    func_80018540(object);
}
