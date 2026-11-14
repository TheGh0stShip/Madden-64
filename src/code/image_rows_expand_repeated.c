/* IJG libjpeg 6a jdsample.c: int_upsample(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_component_info { s32 component_id; s32 component_index; } jpeg_component_info;
typedef struct {
    void *pub[3];
    JSAMPARRAY color_buf[10];
    void *methods[10];
    s32 next_row_out;
    JDIMENSION rows_to_go;
    s32 rowgroup_height[10];
    u8 h_expand[10];
    u8 v_expand[10];
} my_upsampler;
struct jpeg_decompress_struct {
    u8 pad000[0x70];
    JDIMENSION output_width;
    u8 pad074[0xC0];
    s32 max_v_samp_factor;
    u8 pad138[0x88];
    my_upsampler *upsample;
};

extern void func_80063250(JSAMPARRAY, s32, JSAMPARRAY, s32, s32, JDIMENSION);

void image_rows_expand_repeated(j_decompress_ptr cinfo,
                                jpeg_component_info *compptr,
                                JSAMPARRAY input_data,
                                JSAMPARRAY *output_data_ptr)
{
    my_upsampler *upsample = cinfo->upsample;
    JSAMPARRAY output_data = *output_data_ptr;
    register JSAMPROW inptr;
    register JSAMPROW outptr;
    register JSAMPLE invalue;
    register s32 h;
    JSAMPROW outend;
    s32 h_expand;
    s32 v_expand;
    s32 inrow;
    s32 outrow;

    h_expand = upsample->h_expand[compptr->component_index];
    v_expand = upsample->v_expand[compptr->component_index];
    inrow = outrow = 0;
    while (outrow < cinfo->max_v_samp_factor) {
        inptr = input_data[inrow];
        outptr = output_data[outrow];
        outend = outptr + cinfo->output_width;
        while (outptr < outend) {
            invalue = *inptr++;
            for (h = h_expand; h > 0; h--)
                *outptr++ = invalue;
        }
        if (v_expand > 1)
            func_80063250(output_data, outrow, output_data, outrow + 1,
                          v_expand - 1, cinfo->output_width);
        inrow++;
        outrow += v_expand;
    }
}
