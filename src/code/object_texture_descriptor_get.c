#include "types.h"

extern s32 D_800784A0;
extern u8 D_800654A0[];
extern u8 D_800654D0[];
extern u32 func_800A6580(void);

void *object_texture_descriptor_get(u8 *object)
{
    register u32 mode __asm__("$4");
    register u32 call_mode __asm__("$3");
    register u32 type __asm__("$3");
    register u8 *base __asm__("$3");
    register u32 index __asm__("$2");
    register void *result __asm__("$2");

    if (D_800784A0 == -1) {
        goto early_zero;
    }
    call_mode = func_800A6580() & 0xFF;
    switch (call_mode) {
    case 3:
        mode = 1;
        break;
    case 7:
        mode = 2;
        break;
    default:
        mode = 0;
        break;
    }
    type = *(u16 *)(object + 0x54);
    if (type == 8) goto type_eight;
    if (type == 12) goto type_twelve;
    result = 0;
    goto done;
type_eight:
    index = D_800784A0;
    base = D_800654A0;
    mode <<= 4;
    goto index_value;
type_twelve:
    mode <<= 4;
    index = D_800784A0;
    base = D_800654D0;
index_value:
    index <<= 2;
    index += (u32)base;
    result = (void *)(mode + index);
    goto done;
early_zero:
    result = 0;
done:
    return result;
}
