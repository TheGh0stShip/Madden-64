#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[][12];

#define MIDDLE(dest) do { product.half.high <<= 16; product.half.low >>= 16; dest = product.half.high | product.half.low; } while (0)
#define MULTIPLY(value, coefficient, dest) do { matrix_factor = (coefficient); product.full = (s64)(value) * matrix_factor; MIDDLE(dest); } while (0)

void matrix_stack_transform_vector(s32 *input)
{
    register union {
        s64 full;
        struct { s32 high; u32 low; } half;
    } product __asm__("$14");
    register s32 x __asm__("$6");
    register s32 y __asm__("$7");
    register s32 z __asm__("$8");
    register s32 *matrix;
    register s32 matrix_factor __asm__("$9");
    register s32 result __asm__("$3");
    register s32 term0 __asm__("$4");
    register s32 term1 __asm__("$5");

    result = D_8008B35C;
    x = input[0];
    y = input[1];
    z = input[2];
    matrix = (s32 *)(result * 48);
    result = (s32)D_80085E68;
    matrix = (s32 *)((u32)matrix + result);
    MULTIPLY(x, matrix[0], result);
    MULTIPLY(y, matrix[3], term0);
    result += term0;
    term0 = matrix[9];
    MULTIPLY(z, matrix[6], term1);
    result += term1;
    matrix_factor = matrix[1];
    term0 += result;
    __asm__("" : "=r"(term0), "=r"(matrix_factor) : "0"(term0), "1"(matrix_factor));
    product.full = (s64)x * matrix_factor;
    MIDDLE(result);
    matrix_factor = matrix[4];
    matrix[9] = term0;
    __asm__("" : "=r"(term0), "=r"(matrix_factor) : "0"(term0), "1"(matrix_factor));
    product.full = (s64)y * matrix_factor;
    MIDDLE(term0);
    result += term0;
    term0 = matrix[10];
    MULTIPLY(z, matrix[7], term1);
    result += term1;
    matrix_factor = matrix[2];
    term0 += result;
    __asm__("" : "=r"(term0), "=r"(matrix_factor) : "0"(term0), "1"(matrix_factor));
    product.full = (s64)x * matrix_factor;
    MIDDLE(result);
    matrix_factor = matrix[5];
    matrix[10] = term0;
    __asm__("" : "=r"(term0), "=r"(matrix_factor) : "0"(term0), "1"(matrix_factor));
    product.full = (s64)y * matrix_factor;
    MIDDLE(term0);
    result += term0;
    term0 = matrix[11];
    MULTIPLY(z, matrix[8], term1);
    result += term1;
    term0 += result;
    matrix[11] = term0;
}
