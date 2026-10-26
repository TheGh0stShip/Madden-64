#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[][12];

#define SCALE_CELL(index, scale) do { \
    value = matrix[(index)]; \
    product.full = (s64)value * (scale); \
    product.half.high <<= 16; \
    product.half.low >>= 16; \
    value = product.half.high | product.half.low; \
    matrix[(index)] = value; \
} while (0)

void matrix_stack_scale_fixed(s32 x, s32 y, s32 z)
{
    register union {
        s64 full;
        struct { s32 high; u32 low; } half;
    } product __asm__("$14");
    register s32 *matrix = D_80085E68[D_8008B35C];
    register s32 value __asm__("$7");

    SCALE_CELL(0, x);
    SCALE_CELL(1, x);
    SCALE_CELL(2, x);
    SCALE_CELL(3, y);
    SCALE_CELL(4, y);
    SCALE_CELL(5, y);
    SCALE_CELL(6, z);
    SCALE_CELL(7, z);
    SCALE_CELL(8, z);
}
