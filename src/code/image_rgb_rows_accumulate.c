/* IJG libjpeg 6a jquant1.c: quantize3_ord_dither(). */
#include "types.h"

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
    u8 pad074[0x154];
    my_cquantizer *cquantize;
} jpeg_decompress_struct;
typedef jpeg_decompress_struct *j_decompress_ptr;

void func_8006099C(j_decompress_ptr cinfo, JSAMPARRAY input_buf,
                   JSAMPARRAY output_buf, s32 num_rows)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    register s32 pixcode;
    register JSAMPROW input_ptr;
    register JSAMPROW output_ptr;
    JSAMPROW colorindex0 = cquantize->colorindex[0];
    JSAMPROW colorindex1 = cquantize->colorindex[1];
    JSAMPROW colorindex2 = cquantize->colorindex[2];
    s32 *dither0;
    s32 *dither1;
    s32 *dither2;
    s32 row_index, col_index;
    s32 row;
    JDIMENSION col;
    JDIMENSION width = cinfo->output_width;

    for (row = 0; row < num_rows; row++) {
        row_index = cquantize->row_index;
        input_ptr = input_buf[row];
        output_ptr = output_buf[row];
        dither0 = cquantize->odither[0][row_index];
        dither1 = cquantize->odither[1][row_index];
        dither2 = cquantize->odither[2][row_index];
        col_index = 0;

        for (col = width; col > 0; col--) {
            pixcode = colorindex0[*input_ptr++ + dither0[col_index]];
            pixcode += colorindex1[*input_ptr++ + dither1[col_index]];
            pixcode += colorindex2[*input_ptr++ + dither2[col_index]];
            *output_ptr++ = (JSAMPLE)pixcode;
            col_index = (col_index + 1) & 15;
        }
        row_index = (row_index + 1) & 15;
        cquantize->row_index = row_index;
    }
}
