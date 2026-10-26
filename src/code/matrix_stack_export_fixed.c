#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[][12];

#define PACK_PAIR(src, hi, lo) do { \
    first = matrix[(src)]; second = matrix[(src) + 1]; \
    packed = first & mask; fragment = (u32)second >> 16; packed |= fragment; output[(hi)] = packed; \
    packed = first << 16; fragment = second & 0xFFFF; packed |= fragment; output[(lo)] = packed; \
} while (0)
#define PACK_SINGLE(src, hi, lo) do { \
    second = matrix[(src)]; first = second & mask; second <<= 16; output[(hi)] = first; output[(lo)] = second; \
} while (0)

void matrix_stack_export_fixed(u32 *output)
{
    register s32 *matrix;
    register s32 first __asm__("$8");
    register s32 second __asm__("$7");
    register u32 mask __asm__("$6");
    register u32 packed __asm__("$5");
    register u32 fragment __asm__("$2");

    matrix = D_80085E68[D_8008B35C];
    first = matrix[0];
    second = matrix[1];
    mask = 0xFFFF0000;
    packed = first & mask;
    fragment = (u32)second >> 16;
    packed |= fragment;
    output[0] = packed;
    packed = first << 16;
    fragment = second & 0xFFFF;
    packed |= fragment;
    output[8] = packed;
    PACK_SINGLE(2, 1, 9);
    PACK_PAIR(3, 2, 10);
    PACK_SINGLE(5, 3, 11);
    PACK_PAIR(6, 4, 12);
    PACK_SINGLE(8, 5, 13);

    fragment = matrix[9];
    packed = matrix[10];
    first = -fragment;
    second = -packed;
    packed = first & mask;
    fragment = (u32)second >> 16;
    packed |= fragment;
    output[6] = packed;
    packed = first << 16;
    fragment = second & 0xFFFF;
    packed |= fragment;
    output[14] = packed;
    fragment = matrix[11];
    second = -fragment;
    first = second & mask;
    second <<= 16;
    fragment = first | 1;
    output[7] = fragment;
    output[15] = second;
}
