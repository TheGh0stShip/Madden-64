/* IJG libjpeg 6a jdsample.c: h2v1_fancy_upsample(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_component_info {
    u8 pad000[0x28];
    JDIMENSION downsampled_width;
} jpeg_component_info;
struct jpeg_decompress_struct {
    u8 pad000[0x134];
    s32 max_v_samp_factor;
};

void byte_plane_filter(j_decompress_ptr cinfo, jpeg_component_info *compptr,
                       JSAMPARRAY input_data, JSAMPARRAY *output_data_ptr)
{
    JSAMPARRAY output_data = *output_data_ptr;
    register JSAMPROW inptr;
    register JSAMPROW outptr;
    register s32 invalue;
    register JDIMENSION colctr;
    s32 inrow;

    for (inrow = 0; inrow < cinfo->max_v_samp_factor; inrow++) {
        inptr = input_data[inrow];
        outptr = output_data[inrow];
        invalue = *inptr++;
        *outptr++ = (JSAMPLE)invalue;
        *outptr++ = (JSAMPLE)((invalue * 3 + *inptr + 2) >> 2);
        for (colctr = compptr->downsampled_width - 2; colctr > 0; colctr--) {
            invalue = *inptr++ * 3;
            *outptr++ = (JSAMPLE)((invalue + inptr[-2] + 1) >> 2);
            *outptr++ = (JSAMPLE)((invalue + *inptr + 2) >> 2);
        }
        invalue = *inptr;
        *outptr++ = (JSAMPLE)((invalue * 3 + inptr[-1] + 1) >> 2);
        *outptr++ = (JSAMPLE)invalue;
    }
}
