/* IJG libjpeg 6a jdcolor.c: build_ycc_rgb_table(). */
#include "types.h"

typedef u32 size_t;
typedef struct jpeg_common_struct *j_common_ptr;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef void *(*alloc_small_method)(j_common_ptr, s32, size_t);

typedef struct jpeg_memory_mgr { alloc_small_method alloc_small; } jpeg_memory_mgr;
typedef struct {
    void *pub[2];
    s32 *Cr_r_tab;
    s32 *Cb_b_tab;
    s32 *Cr_g_tab;
    s32 *Cb_g_tab;
} my_color_deconverter;
struct jpeg_decompress_struct {
    void *err;
    jpeg_memory_mgr *mem;
    u8 pad008[0x1BC];
    my_color_deconverter *cconvert;
};
struct jpeg_common_struct { void *err; jpeg_memory_mgr *mem; };

void func_8005F868(j_decompress_ptr cinfo)
{
    my_color_deconverter *cconvert = cinfo->cconvert;
    s32 i;
    s32 x;

    cconvert->Cr_r_tab = (s32 *)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, 256 * sizeof(s32));
    cconvert->Cb_b_tab = (s32 *)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, 256 * sizeof(s32));
    cconvert->Cr_g_tab = (s32 *)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, 256 * sizeof(s32));
    cconvert->Cb_g_tab = (s32 *)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, 256 * sizeof(s32));

    for (i = 0, x = -128; i <= 255; i++, x++) {
        cconvert->Cr_r_tab[i] = (91881 * x + 32768) >> 16;
        cconvert->Cb_b_tab[i] = (116130 * x + 32768) >> 16;
        cconvert->Cr_g_tab[i] = -46802 * x;
        cconvert->Cb_g_tab[i] = -22554 * x + 32768;
    }
}
