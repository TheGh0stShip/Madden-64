#include "types.h"

void matrix_vector_transform(f32 *output, f32 *input, f32 *matrix)
{
    f32 r0 = matrix[0] * input[0] + matrix[4] * input[1] + matrix[8] * input[2] + matrix[12];
    f32 r1 = matrix[1] * input[0] + matrix[5] * input[1] + matrix[9] * input[2] + matrix[13];
    f32 r2 = matrix[2] * input[0] + matrix[6] * input[1] + matrix[10] * input[2] + matrix[14];
    f32 r3 = matrix[3] * input[0] + matrix[7] * input[1] + matrix[11] * input[2] + matrix[15];

    output[0] = r0;
    output[1] = r1;
    output[2] = r2;
    output[3] = r3;
}
