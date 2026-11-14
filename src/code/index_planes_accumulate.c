/* IJG libjpeg 6a jquant1.c: color_quantize(). */
#include "types.h"

typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;

typedef struct {
    u8 pad00[0x18];
    JSAMPARRAY colorindex;
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

void index_planes_accumulate(j_decompress_ptr cinfo, JSAMPARRAY input_buf,
                             JSAMPARRAY output_buf, s32 num_rows)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    JSAMPARRAY colorindex = cquantize->colorindex;
    register s32 pixcode, ci;
    register JSAMPROW ptrin, ptrout;
    s32 row;
    JDIMENSION col;
    JDIMENSION width = cinfo->output_width;
    register s32 nc = cinfo->out_color_components;

    for (row = 0; row < num_rows; row++) {
        ptrin = input_buf[row];
        ptrout = output_buf[row];
        for (col = width; col > 0; col--) {
            pixcode = 0;
            for (ci = 0; ci < nc; ci++) {
                pixcode += colorindex[ci][*ptrin++];
            }
            *ptrout++ = (JSAMPLE)pixcode;
        }
    }
}
