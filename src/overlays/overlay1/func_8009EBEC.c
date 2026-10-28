#include "types.h"

typedef struct {
    u8 pad00[0xC];
    u8 *pixels;
    u8 pad10[4];
    u16 width;
} Image4;

s32 func_8009EBEC(Image4 *image, s32 x, s32 y) {
    s32 bits;
    s32 value;

    bits = image->pixels[(image->width * y + x) >> 1] << 24;
    value = bits >> 24;
    if (x & 1) {
        value &= 0xF;
    } else {
        value = (u32)bits >> 28;
    }
    return value;
}
