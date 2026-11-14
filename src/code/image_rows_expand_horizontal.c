/* IJG libjpeg 6a jdsample.c: h2v2_upsample(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_component_info jpeg_component_info;
struct jpeg_decompress_struct {
    u8 pad000[0x70];
    JDIMENSION output_width;
    u8 pad074[0xC0];
    s32 max_v_samp_factor;
};

extern void func_80063250(JSAMPARRAY, s32, JSAMPARRAY, s32, s32, JDIMENSION);

void image_rows_expand_horizontal(j_decompress_ptr cinfo,
                                  jpeg_component_info *compptr,
                                  JSAMPARRAY input_data,
                                  JSAMPARRAY *output_data_ptr)
{
    JSAMPARRAY output_data = *output_data_ptr;
    register JSAMPROW inptr;
    register JSAMPROW outptr;
    register JSAMPLE invalue;
    JSAMPROW outend;
    s32 inrow;
    s32 outrow;

    inrow = outrow = 0;
    while (outrow < cinfo->max_v_samp_factor) {
        inptr = input_data[inrow];
        outptr = output_data[outrow];
        outend = outptr + cinfo->output_width;
        while (outptr < outend) {
            invalue = *inptr++;
            *outptr++ = invalue;
            *outptr++ = invalue;
        }
        func_80063250(output_data, outrow, output_data, outrow + 1, 1,
                      cinfo->output_width);
        inrow++;
        outrow += 2;
    }
}
