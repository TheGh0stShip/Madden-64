/* IJG libjpeg 6a jquant1.c: quantize_ord_dither(). */
#include "types.h"

typedef u32 size_t;
typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
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
    s16 *fserrors[4];
    s32 on_odd_row;
} my_cquantizer;

typedef struct {
    u8 pad000[0x70];
    JDIMENSION output_width;
    u8 pad074[4];
    s32 out_color_components;
    u8 pad07C[0x14C];
    my_cquantizer *cquantize;
} jpeg_decompress_struct;
typedef jpeg_decompress_struct *j_decompress_ptr;

extern void func_800632F4(void *output, size_t count);

void func_80060870(j_decompress_ptr cinfo, JSAMPARRAY input_buf,
                   JSAMPARRAY output_buf, s32 num_rows)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    register JSAMPROW input_ptr;
    register JSAMPROW output_ptr;
    JSAMPROW colorindex_ci;
    s32 *dither;
    s32 row_index, col_index;
    s32 nc = cinfo->out_color_components;
    s32 ci;
    s32 row;
    JDIMENSION col;
    JDIMENSION width = cinfo->output_width;

    for (row = 0; row < num_rows; row++) {
        func_800632F4(output_buf[row], (size_t)(width * sizeof(JSAMPLE)));
        row_index = cquantize->row_index;
        for (ci = 0; ci < nc; ci++) {
            input_ptr = input_buf[row] + ci;
            output_ptr = output_buf[row];
            colorindex_ci = cquantize->colorindex[ci];
            dither = cquantize->odither[ci][row_index];
            col_index = 0;

            for (col = width; col > 0; col--) {
                *output_ptr += colorindex_ci[*input_ptr + dither[col_index]];
                input_ptr += nc;
                output_ptr++;
                col_index = (col_index + 1) & 15;
            }
        }
        row_index = (row_index + 1) & 15;
        cquantize->row_index = row_index;
    }
}
