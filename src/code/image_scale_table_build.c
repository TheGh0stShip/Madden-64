/* IJG libjpeg 6a jquant1.c: make_odither_array(). */
#include "types.h"

typedef u32 size_t;
typedef struct jpeg_common_struct *j_common_ptr;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef void *(*alloc_small_method)(j_common_ptr, s32, size_t);
typedef s32 ODITHER_MATRIX[16][16];
typedef s32 (*ODITHER_MATRIX_PTR)[16];

typedef struct jpeg_memory_mgr { alloc_small_method alloc_small; } jpeg_memory_mgr;
struct jpeg_decompress_struct { void *err; jpeg_memory_mgr *mem; };
struct jpeg_common_struct { void *err; jpeg_memory_mgr *mem; };

extern u8 D_80003418[16][16];

ODITHER_MATRIX_PTR func_8006056C(j_decompress_ptr cinfo, s32 ncolors)
{
    ODITHER_MATRIX_PTR odither;
    s32 j;
    s32 k;
    s32 num;
    s32 den;

    odither = (ODITHER_MATRIX_PTR)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, sizeof(ODITHER_MATRIX));
    den = 2 * 256 * (ncolors - 1);
    for (j = 0; j < 16; j++) {
        for (k = 0; k < 16; k++) {
            num = (255 - 2 * (s32)D_80003418[j][k]) * 255;
            odither[j][k] = num < 0 ? -((-num) / den) : num / den;
        }
    }
    return odither;
}
