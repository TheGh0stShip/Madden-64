/* IJG libjpeg 6a jdmerge.c: h2v1_merged_upsample(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;

typedef struct {
    u8 pad00[0x10];
    s32 *Cr_r_tab;
    s32 *Cb_b_tab;
    s32 *Cr_g_tab;
    s32 *Cb_g_tab;
} my_upsampler;

struct jpeg_decompress_struct {
    u8 pad000[0x70];
    JDIMENSION output_width;
    u8 pad074[0xCC];
    JSAMPLE *sample_range_limit;
    u8 pad144[0x7C];
    my_upsampler *upsample;
};

void object_stream_state_update(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
                                JDIMENSION in_row_group_ctr,
                                JSAMPARRAY output_buf)
{
    my_upsampler *upsample = cinfo->upsample;
    register s32 y, cred, cgreen, cblue;
    s32 cb, cr;
    register JSAMPROW outptr;
    JSAMPROW inptr0, inptr1, inptr2;
    JDIMENSION col;
    register JSAMPLE *range_limit = cinfo->sample_range_limit;
    s32 *Crrtab = upsample->Cr_r_tab;
    s32 *Cbbtab = upsample->Cb_b_tab;
    s32 *Crgtab = upsample->Cr_g_tab;
    s32 *Cbgtab = upsample->Cb_g_tab;

    inptr0 = input_buf[0][in_row_group_ctr];
    inptr1 = input_buf[1][in_row_group_ctr];
    inptr2 = input_buf[2][in_row_group_ctr];
    outptr = output_buf[0];
    for (col = cinfo->output_width >> 1; col > 0; col--) {
        cb = *inptr1++;
        cr = *inptr2++;
        cred = Crrtab[cr];
        cgreen = (Cbgtab[cb] + Crgtab[cr]) >> 16;
        cblue = Cbbtab[cb];
        y = *inptr0++;
        outptr[0] = range_limit[y + cred];
        outptr[1] = range_limit[y + cgreen];
        outptr[2] = range_limit[y + cblue];
        outptr += 3;
        y = *inptr0++;
        outptr[0] = range_limit[y + cred];
        outptr[1] = range_limit[y + cgreen];
        outptr[2] = range_limit[y + cblue];
        outptr += 3;
    }
    if (cinfo->output_width & 1) {
        cb = *inptr1;
        cr = *inptr2;
        cred = Crrtab[cr];
        cgreen = (Cbgtab[cb] + Crgtab[cr]) >> 16;
        cblue = Cbbtab[cb];
        y = *inptr0;
        outptr[0] = range_limit[y + cred];
        outptr[1] = range_limit[y + cgreen];
        outptr[2] = range_limit[y + cblue];
    }
}
