#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[][12];

#define MIDDLE(dest) do { product.half.high <<= 16; product.half.low >>= 16; dest = product.half.high | product.half.low; } while (0)
#define MUL_FIRST(a, b) do { factor_a = (a); factor_b = (b); product.full = (s64)factor_a * factor_b; MIDDLE(result); } while (0)
#define MUL_ADD(a, b) do { factor_a = (a); factor_b = (b); product.full = (s64)factor_a * factor_b; MIDDLE(term); result += term; } while (0)

void matrix_stack_transform_point(s32 *input, s32 *output)
{
    register union {
        s64 full;
        struct { s32 high; u32 low; } half;
    } product __asm__("$14");
    register s32 factor_a __asm__("$7");
    register s32 factor_b __asm__("$8");
    register s32 result __asm__("$3");
    register s32 term __asm__("$6");
    register s32 *matrix __asm__("$2");

    factor_a = input[0];
    matrix = D_80085E68[D_8008B35C];
    factor_b = matrix[0];
    product.full = (s64)factor_a * factor_b;
    MIDDLE(result);
    MUL_ADD(input[1], matrix[3]);
    MUL_ADD(input[2], matrix[6]);
    output[0] = result;
    MUL_FIRST(input[0], matrix[1]);
    MUL_ADD(input[1], matrix[4]);
    MUL_ADD(input[2], matrix[7]);
    output[1] = result;
    MUL_FIRST(input[0], matrix[2]);
    MUL_ADD(input[1], matrix[5]);
    input = (s32 *)input[2];
    matrix = (s32 *)matrix[8];
    product.full = (s64)(s32)input * (s32)matrix;
    product.half.high <<= 16;
    product.half.low >>= 16;
    matrix = (s32 *)(product.half.high | product.half.low);
    result += (s32)matrix;
    output[2] = result;
}
