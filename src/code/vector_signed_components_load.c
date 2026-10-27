#include "types.h"

extern volatile s8 D_80078418[];
extern volatile s8 D_80078419;
extern volatile s8 D_8007841A;
extern volatile s8 D_8007841C;
extern volatile s8 D_8007841D;
extern volatile s8 D_8007841E;
extern volatile s8 D_80078429;
extern volatile s8 D_8007842A;

void vector_signed_components_load(s8 *components)
{
    register s8 *source __asm__("$5") = components;
    register volatile s8 *base __asm__("$4");
    register volatile s8 *alias __asm__("$6");
    register s32 value __asm__("$2");
    register s32 original __asm__("$3");
    volatile u32 frame_pad[12];

    __asm__("" : "=r"(source) : "0"(source));
    value = source[0];
    base = D_80078418;
    value &= ~value >> 31;
    D_8007841C = value;
    base[0] = value;

    value = source[1];
    value &= ~value >> 31;
    D_8007841D = value;
    D_80078419 = value;

    value = source[2];
    value &= ~value >> 31;
    D_8007841E = value;
    D_8007841A = value;

    value = source[0];
    original = value;
    if (value > 0) goto positive_x;
    value = -original;
    goto store_x;
positive_x:
    value = 0;
store_x:
    base += 0x10;
    alias = base;
    *alias = value;
    *base = value;

    value = source[1];
    original = value;
    if (value > 0) goto positive_y;
    value = -original;
    goto store_y;
positive_y:
    value = 0;
store_y:
    base = &D_80078429;
    alias = base;
    *alias = value;
    *base = value;

    value = source[2];
    original = value;
    if (value > 0) goto positive_z;
    value = -original;
    goto store_z;
positive_z:
    value = 0;
store_z:
    base = &D_8007842A;
    source = (s8 *)base;
    *source = value;
    *base = value;
}
