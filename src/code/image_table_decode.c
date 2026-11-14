/* IJG libjpeg 6a jquant1.c: create_colorindex(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_common_struct *j_common_ptr;
typedef struct jpeg_memory_mgr {
    void *alloc_small;
    void *alloc_large;
    JSAMPARRAY (*alloc_sarray)(j_common_ptr, s32, JDIMENSION, JDIMENSION);
} jpeg_memory_mgr;
typedef struct {
    void *pub[4];
    JSAMPARRAY sv_colormap;
    s32 sv_actual;
    JSAMPARRAY colorindex;
    s32 is_padded;
    s32 Ncolors[4];
    s32 row_index;
    void *odither[4];
    void *fserrors[4];
    s32 on_odd_row;
} my_cquantizer;
struct jpeg_decompress_struct {
    void *err;
    jpeg_memory_mgr *mem;
    u8 pad008[0x50];
    u32 dither_mode;
    u8 pad05C[0x1C];
    s32 out_color_components;
    u8 pad07C[0x14C];
    my_cquantizer *cquantize;
};
struct jpeg_common_struct { void *err; jpeg_memory_mgr *mem; };

extern s32 func_8006012C(j_decompress_ptr, s32, s32, s32);

void image_table_decode(j_decompress_ptr cinfo)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    JSAMPROW indexptr;
    s32 i;
    s32 j;
    s32 k;
    s32 nci;
    s32 blksize;
    s32 val;
    s32 pad;

    if (cinfo->dither_mode == 1) {
        pad = 510;
        cquantize->is_padded = 1;
    } else {
        pad = 0;
        cquantize->is_padded = 0;
    }
    cquantize->colorindex = (*cinfo->mem->alloc_sarray)(
        (j_common_ptr)cinfo, 1, (JDIMENSION)(256 + pad),
        (JDIMENSION)cinfo->out_color_components);
    blksize = cquantize->sv_actual;
    for (i = 0; i < cinfo->out_color_components; i++) {
        nci = cquantize->Ncolors[i];
        blksize = blksize / nci;
        if (pad)
            cquantize->colorindex[i] += 255;
        indexptr = cquantize->colorindex[i];
        val = 0;
        k = func_8006012C(cinfo, i, 0, nci - 1);
        for (j = 0; j <= 255; j++) {
            while (j > k)
                k = func_8006012C(cinfo, i, ++val, nci - 1);
            indexptr[j] = (JSAMPLE)(val * blksize);
        }
        if (pad)
            for (j = 1; j <= 255; j++) {
                indexptr[-j] = indexptr[0];
                indexptr[255 + j] = indexptr[255];
            }
    }
}
