/* IJG libjpeg 6a jdsample.c: h2v2_fancy_upsample(). */
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

void image_plane_process(j_decompress_ptr cinfo, jpeg_component_info *compptr,
                         JSAMPARRAY input_data, JSAMPARRAY *output_data_ptr)
{
    JSAMPARRAY output_data = *output_data_ptr;
    register JSAMPROW inptr0;
    register JSAMPROW inptr1;
    register JSAMPROW outptr;
    register s32 thiscolsum;
    register s32 lastcolsum;
    register s32 nextcolsum;
    register JDIMENSION colctr;
    s32 inrow;
    s32 outrow;
    s32 v;

    inrow = outrow = 0;
    while (outrow < cinfo->max_v_samp_factor) {
        for (v = 0; v < 2; v++) {
            inptr0 = input_data[inrow];
            if (v == 0)
                inptr1 = input_data[inrow - 1];
            else
                inptr1 = input_data[inrow + 1];
            outptr = output_data[outrow++];
            thiscolsum = *inptr0++ * 3 + *inptr1++;
            nextcolsum = *inptr0++ * 3 + *inptr1++;
            *outptr++ = (JSAMPLE)((thiscolsum * 4 + 8) >> 4);
            *outptr++ = (JSAMPLE)((thiscolsum * 3 + nextcolsum + 7) >> 4);
            lastcolsum = thiscolsum;
            thiscolsum = nextcolsum;
            for (colctr = compptr->downsampled_width - 2; colctr > 0; colctr--) {
                nextcolsum = *inptr0++ * 3 + *inptr1++;
                *outptr++ = (JSAMPLE)((thiscolsum * 3 + lastcolsum + 8) >> 4);
                *outptr++ = (JSAMPLE)((thiscolsum * 3 + nextcolsum + 7) >> 4);
                lastcolsum = thiscolsum;
                thiscolsum = nextcolsum;
            }
            *outptr++ = (JSAMPLE)((thiscolsum * 3 + lastcolsum + 8) >> 4);
            *outptr++ = (JSAMPLE)((thiscolsum * 4 + 7) >> 4);
        }
        inrow++;
    }
}
