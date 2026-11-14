/* IJG libjpeg 6a jdcolor.c: ycck_cmyk_convert(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct {
    void *pub[2];
    s32 *Cr_r_tab;
    s32 *Cb_b_tab;
    s32 *Cr_g_tab;
    s32 *Cb_g_tab;
} my_color_deconverter;
struct jpeg_decompress_struct {
    u8 pad000[0x70];
    JDIMENSION output_width;
    u8 pad074[0xCC];
    JSAMPLE *sample_range_limit;
    u8 pad144[0x80];
    my_color_deconverter *cconvert;
};

void func_8005FB9C(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
                   JDIMENSION input_row, JSAMPARRAY output_buf, s32 num_rows)
{
    my_color_deconverter *cconvert = cinfo->cconvert;
    register s32 y;
    register s32 cb;
    register s32 cr;
    register JSAMPROW outptr;
    register JSAMPROW inptr0;
    register JSAMPROW inptr1;
    register JSAMPROW inptr2;
    register JSAMPROW inptr3;
    register JDIMENSION col;
    JDIMENSION num_cols = cinfo->output_width;
    register JSAMPLE *range_limit = cinfo->sample_range_limit;
    register s32 *Crrtab = cconvert->Cr_r_tab;
    register s32 *Cbbtab = cconvert->Cb_b_tab;
    register s32 *Crgtab = cconvert->Cr_g_tab;
    register s32 *Cbgtab = cconvert->Cb_g_tab;

    while (--num_rows >= 0) {
        inptr0 = input_buf[0][input_row];
        inptr1 = input_buf[1][input_row];
        inptr2 = input_buf[2][input_row];
        inptr3 = input_buf[3][input_row];
        input_row++;
        outptr = *output_buf++;
        for (col = 0; col < num_cols; col++) {
            y = inptr0[col];
            cb = inptr1[col];
            cr = inptr2[col];
            outptr[0] = range_limit[255 - (y + Crrtab[cr])];
            outptr[1] = range_limit[255 - (y + ((Cbgtab[cb] + Crgtab[cr]) >> 16))];
            outptr[2] = range_limit[255 - (y + Cbbtab[cb])];
            outptr[3] = inptr3[col];
            outptr += 4;
        }
    }
}
