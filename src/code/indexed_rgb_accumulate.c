/* IJG libjpeg 6a jquant1.c: color_quantize3(). */
#include "types.h"

typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;

typedef struct { u8 pad00[0x18]; JSAMPARRAY colorindex; } my_cquantizer;
typedef struct {
    u8 pad000[0x70];
    JDIMENSION output_width;
    u8 pad074[0x154];
    my_cquantizer *cquantize;
} jpeg_decompress_struct;
typedef jpeg_decompress_struct *j_decompress_ptr;

void indexed_rgb_accumulate(j_decompress_ptr cinfo, JSAMPARRAY input_buf,
                            JSAMPARRAY output_buf, s32 num_rows)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    register s32 pixcode;
    register JSAMPROW ptrin, ptrout;
    JSAMPROW colorindex0 = cquantize->colorindex[0];
    JSAMPROW colorindex1 = cquantize->colorindex[1];
    JSAMPROW colorindex2 = cquantize->colorindex[2];
    s32 row;
    JDIMENSION col;
    JDIMENSION width = cinfo->output_width;

    for (row = 0; row < num_rows; row++) {
        ptrin = input_buf[row];
        ptrout = output_buf[row];
        for (col = width; col > 0; col--) {
            pixcode = colorindex0[*ptrin++];
            pixcode += colorindex1[*ptrin++];
            pixcode += colorindex2[*ptrin++];
            *ptrout++ = (JSAMPLE)pixcode;
        }
    }
}
