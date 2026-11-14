/* IJG libjpeg 6a jdsample.c: sep_upsample(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;
typedef u32 JDIMENSION;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_component_info { u8 bytes[0x54]; } jpeg_component_info;
typedef void (*upsample1_ptr)(j_decompress_ptr, jpeg_component_info *,
                             JSAMPARRAY, JSAMPARRAY *);
typedef struct {
    void *pub[3];
    JSAMPARRAY color_buf[10];
    upsample1_ptr methods[10];
    s32 next_row_out;
    JDIMENSION rows_to_go;
    s32 rowgroup_height[10];
    u8 h_expand[10];
    u8 v_expand[10];
} my_upsampler;
typedef struct {
    void *start_pass;
    void (*color_convert)(j_decompress_ptr, JSAMPIMAGE, JDIMENSION,
                          JSAMPARRAY, s32);
} jpeg_color_deconverter;
struct jpeg_decompress_struct {
    u8 pad000[0x20];
    s32 num_components;
    u8 pad024[0xB4];
    jpeg_component_info *comp_info;
    u8 pad0DC[0x58];
    s32 max_v_samp_factor;
    u8 pad138[0x88];
    my_upsampler *upsample;
    jpeg_color_deconverter *cconvert;
};

void image_plane_decode(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
                        JDIMENSION *in_row_group_ctr,
                        JDIMENSION in_row_groups_avail,
                        JSAMPARRAY output_buf, JDIMENSION *out_row_ctr,
                        JDIMENSION out_rows_avail)
{
    my_upsampler *upsample = cinfo->upsample;
    s32 ci;
    jpeg_component_info *compptr;
    JDIMENSION num_rows;

    if (upsample->next_row_out >= cinfo->max_v_samp_factor) {
        for (ci = 0, compptr = cinfo->comp_info;
             ci < cinfo->num_components; ci++, compptr++) {
            (*upsample->methods[ci])(
                cinfo, compptr,
                input_buf[ci] +
                    (*in_row_group_ctr * upsample->rowgroup_height[ci]),
                upsample->color_buf + ci);
        }
        upsample->next_row_out = 0;
    }
    num_rows = cinfo->max_v_samp_factor - upsample->next_row_out;
    if (num_rows > upsample->rows_to_go)
        num_rows = upsample->rows_to_go;
    out_rows_avail -= *out_row_ctr;
    if (num_rows > out_rows_avail)
        num_rows = out_rows_avail;
    (*cinfo->cconvert->color_convert)(
        cinfo, upsample->color_buf, upsample->next_row_out,
        output_buf + *out_row_ctr, num_rows);
    *out_row_ctr += num_rows;
    upsample->rows_to_go -= num_rows;
    upsample->next_row_out += num_rows;
    if (upsample->next_row_out >= cinfo->max_v_samp_factor)
        (*in_row_group_ctr)++;
}
