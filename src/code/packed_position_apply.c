#include "types.h"

extern void **D_8006929C;
extern void func_80017000(void *object, s32 y, s32 x);
extern void func_80018540(void *object);

typedef struct PackedPosition {
    u32 value;
} PackedPosition;

void packed_position_apply(PackedPosition packed_arg)
{
    u32 packed = packed_arg.value;
    u32 x = packed;
    void *object;
    void **objects;
    u32 index;
    void *call_object;
    s32 y;

    index = x >> 24;
    objects = D_8006929C;
    index <<= 2;
    index += (u32)objects;
    object = *(void **)index;
    call_object = object;
    x &= 0xFFF;
    if (packed & 0x800) {
        x |= -0x1000;
    }
    y = (s32)packed >> 12;
    y &= 0xFFF;
    if (y & 0x800) {
        y |= -0x1000;
    }
    func_80017000(call_object, (s16)y, (s16)x);
    func_80018540(object);
}
