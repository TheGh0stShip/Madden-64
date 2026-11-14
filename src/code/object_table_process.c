/* IJG libjpeg 6a jquant1.c: quantize_fs_dither(). */
#include "types.h"

typedef u32 size_t;
typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef s16 FSERROR;
typedef FSERROR *FSERRPTR;
typedef s32 ODITHER_MATRIX[16][16];
typedef s32 (*ODITHER_MATRIX_PTR)[16];

typedef struct {
    void *pub[4];
    JSAMPARRAY sv_colormap;
    s32 sv_actual;
    JSAMPARRAY colorindex;
    s32 is_padded;
    s32 Ncolors[4];
    s32 row_index;
    ODITHER_MATRIX_PTR odither[4];
    FSERRPTR fserrors[4];
    s32 on_odd_row;
} my_cquantizer;

typedef struct {
    u8 pad000[0x70];
    JDIMENSION output_width;
    u8 pad074[4];
    s32 out_color_components;
    u8 pad07C[0xC4];
    JSAMPLE *sample_range_limit;
    u8 pad144[0x84];
    my_cquantizer *cquantize;
} jpeg_decompress_struct;
typedef jpeg_decompress_struct *j_decompress_ptr;

extern void func_800632F4(void *output, size_t count);

void object_table_process(j_decompress_ptr cinfo, JSAMPARRAY input_buf,
                          JSAMPARRAY output_buf, s32 num_rows)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    register s32 cur;
    s32 belowerr;
    s32 bpreverr;
    s32 bnexterr;
    s32 delta;
    register FSERRPTR errorptr;
    register JSAMPROW input_ptr;
    register JSAMPROW output_ptr;
    JSAMPROW colorindex_ci;
    JSAMPROW colormap_ci;
    s32 pixcode;
    s32 nc = cinfo->out_color_components;
    s32 dir;
    s32 dirnc;
    s32 ci;
    s32 row;
    JDIMENSION col;
    JDIMENSION width = cinfo->output_width;
    JSAMPLE *range_limit = cinfo->sample_range_limit;

    for (row = 0; row < num_rows; row++) {
        func_800632F4(output_buf[row], (size_t)(width * sizeof(JSAMPLE)));
        for (ci = 0; ci < nc; ci++) {
            input_ptr = input_buf[row] + ci;
            output_ptr = output_buf[row];
            if (cquantize->on_odd_row) {
                input_ptr += (width - 1) * nc;
                output_ptr += width - 1;
                dir = -1;
                dirnc = -nc;
                errorptr = cquantize->fserrors[ci] + (width + 1);
            } else {
                dir = 1;
                dirnc = nc;
                errorptr = cquantize->fserrors[ci];
            }
            colorindex_ci = cquantize->colorindex[ci];
            colormap_ci = cquantize->sv_colormap[ci];
            cur = 0;
            belowerr = bpreverr = 0;

            for (col = width; col > 0; col--) {
                cur = (cur + errorptr[dir] + 8) >> 4;
                cur += *input_ptr;
                cur = range_limit[cur];
                pixcode = colorindex_ci[cur];
                *output_ptr += (JSAMPLE)pixcode;
                cur -= colormap_ci[pixcode];
                bnexterr = cur;
                delta = cur * 2;
                cur += delta;
                errorptr[0] = (FSERROR)(bpreverr + cur);
                cur += delta;
                bpreverr = belowerr + cur;
                belowerr = bnexterr;
                cur += delta;
                input_ptr += dirnc;
                output_ptr += dir;
                errorptr += dir;
            }
            errorptr[0] = (FSERROR)bpreverr;
        }
        cquantize->on_odd_row = cquantize->on_odd_row ? 0 : 1;
    }
}
