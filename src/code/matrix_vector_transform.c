#include "types.h"

void matrix_vector_transform(f32 *output, f32 *input, f32 *matrix)
{
    register f32 x __asm__("$f18") = input[0];
    register f32 y __asm__("$f20") = input[1];
    register f32 z __asm__("$f22") = input[2];
    register f32 row0 __asm__("$f10") = matrix[0];
    register f32 row1 __asm__("$f8");
    register f32 row2 __asm__("$f6");
    register f32 row3 __asm__("$f2");
    register f32 temp0 __asm__("$f0");
    register f32 temp4 __asm__("$f4");
    register f32 temp12 __asm__("$f12");
    register f32 temp14 __asm__("$f14");
    register f32 temp16 __asm__("$f16");

    row0 *= x;
    row3 = matrix[4];
    row3 *= y;
    temp0 = matrix[8];
    temp0 *= z;
    row1 = matrix[1];
    row1 *= x;
    temp4 = matrix[5];
    temp4 *= y;
    row2 = matrix[2];
    row2 *= x;
    temp16 = matrix[6];
    temp16 *= y;
    temp14 = matrix[9];
    row0 += row3;
    temp14 *= z;
    row1 += temp4;
    temp12 = matrix[10];
    row2 += temp16;
    temp12 *= z;
    row0 += temp0;
    row3 = matrix[3];
    row1 += temp14;
    row3 *= x;
    row2 += temp12;
    temp0 = matrix[12];
    temp4 = matrix[7];
    row0 += temp0;
    temp0 = matrix[13];
    temp4 *= y;
    row1 += temp0;
    temp12 = matrix[14];
    temp0 = matrix[11];
    row2 += temp12;
    temp0 *= z;
    row3 += temp4;
    row3 += temp0;
    temp0 = matrix[15];
    row3 += temp0;
    output[0] = row0;
    output[1] = row1;
    output[2] = row2;
    output[3] = row3;
}
