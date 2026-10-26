#include "types.h"

#define LOAD_PRODUCT(a, b) do { factor_right = (a); factor_left = (b); product.full = (s64)factor_right * factor_left; } while (0)
#define MIDDLE(dest) do { product.half.high <<= 16; product.half.low >>= 16; dest = product.half.high | product.half.low; } while (0)
#define FIRST(a, b) do { LOAD_PRODUCT(a, b); MIDDLE(result); } while (0)
#define ADD(a, b) do { LOAD_PRODUCT(a, b); MIDDLE(term); result += term; } while (0)
#define CELL(n, a, b, c, d, e, f) do { FIRST(a, b); ADD(c, d); ADD(e, f); output[n] = result; } while (0)

void matrix_multiply_fixed(s32 *left, s32 *right, s32 *output)
{
    register union {
        s64 full;
        struct { s32 high; u32 low; } half;
    } product __asm__("$14");
    register s32 factor_right __asm__("$7");
    register s32 factor_left __asm__("$8");
    register s32 result __asm__("$2");
    register s32 term __asm__("$3");
    CELL(0, right[0], left[0], right[3], left[1], right[6], left[2]);
    CELL(1, right[1], left[0], right[4], left[1], right[7], left[2]);
    CELL(2, right[2], left[0], right[5], left[1], right[8], left[2]);
    CELL(3, right[0], left[3], right[3], left[4], right[6], left[5]);
    CELL(4, right[1], left[3], right[4], left[4], right[7], left[5]);
    CELL(5, right[2], left[3], right[5], left[4], right[8], left[5]);
    CELL(6, right[0], left[6], right[3], left[7], right[6], left[8]);
    CELL(7, right[1], left[6], right[4], left[7], right[7], left[8]);
    FIRST(right[2], left[6]);
    ADD(right[5], left[7]);
    right = (s32 *)right[8];
    left = (s32 *)left[8];
    product.full = (s64)(s32)right * (s32)left;
    MIDDLE(term);
    result += term;
    output[8] = result;
}
