#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[][12];

#define PACK_PAIR(hi, lo) \
    packed = (first & mask) | ((u32)second >> 16); output[(hi)] = packed; \
    packed = (first << 16) | (second & 0xFFFF); output[(lo)] = packed
#define PACK_SINGLE(src, hi, lo) \
    second = matrix[(src)]; first = second & mask; second <<= 16; output[(hi)] = first; output[(lo)] = second

void matrix_stack_export_fixed(u32 *output)
{
    s32 *matrix;
    s32 first;
    s32 second;
    u32 mask;
    u32 packed;

    matrix = D_80085E68[D_8008B35C];
    first = matrix[0];
    second = matrix[1];
    mask = 0xFFFF0000;
    PACK_PAIR(0, 8);
    PACK_SINGLE(2, 1, 9);
    first = matrix[3];
    second = matrix[4];
    PACK_PAIR(2, 10);
    PACK_SINGLE(5, 3, 11);
    first = matrix[6];
    second = matrix[7];
    PACK_PAIR(4, 12);
    PACK_SINGLE(8, 5, 13);
    first = -matrix[9]; second = -matrix[10];
    PACK_PAIR(6, 14);
    second = -matrix[11];
    first = second & mask;
    second <<= 16;
    output[7] = first | 1;
    output[15] = second;
}
