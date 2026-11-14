/* IJG libjpeg 6a jdsample.c: jinit_upsampler(). */
#include "types.h"

typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef u32 JDIMENSION;
typedef u32 size_t;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_common_struct *j_common_ptr;
typedef struct jpeg_component_info {
    s32 component_id;
    s32 component_index;
    s32 h_samp_factor;
    s32 v_samp_factor;
    u8 pad010[0x14];
    s32 DCT_scaled_size;
    JDIMENSION downsampled_width;
    JDIMENSION downsampled_height;
    s32 component_needed;
    u8 pad034[0x20];
} jpeg_component_info;
typedef void (*upsample1_ptr)(j_decompress_ptr, jpeg_component_info *,
                             JSAMPARRAY, JSAMPARRAY *);
typedef struct {
    void *start_pass;
    void *upsample;
    s32 need_context_rows;
    JSAMPARRAY color_buf[10];
    upsample1_ptr methods[10];
    s32 next_row_out;
    JDIMENSION rows_to_go;
    s32 rowgroup_height[10];
    u8 h_expand[10];
    u8 v_expand[10];
} my_upsampler;
typedef struct jpeg_error_mgr {
    void (*error_exit)(j_common_ptr);
    void *other[4];
    s32 msg_code;
} jpeg_error_mgr;
typedef struct jpeg_memory_mgr {
    void *(*alloc_small)(j_common_ptr, s32, size_t);
    void *alloc_large;
    JSAMPARRAY (*alloc_sarray)(j_common_ptr, s32, JDIMENSION, JDIMENSION);
} jpeg_memory_mgr;
struct jpeg_decompress_struct {
    jpeg_error_mgr *err;
    jpeg_memory_mgr *mem;
    u8 pad008[0x18];
    s32 num_components;
    u8 pad024[0x28];
    s32 do_fancy_upsampling;
    u8 pad050[0x20];
    JDIMENSION output_width;
    u8 pad074[0x64];
    jpeg_component_info *comp_info;
    u8 pad0DC[0x50];
    s32 CCIR601_sampling;
    s32 max_h_samp_factor;
    s32 max_v_samp_factor;
    s32 min_DCT_scaled_size;
    u8 pad13C[0x84];
    my_upsampler *upsample;
};
struct jpeg_common_struct { jpeg_error_mgr *err; jpeg_memory_mgr *mem; };

extern void func_8005EE88(void);
extern void image_plane_decode(void);
extern void func_8005F030(void);
extern void func_8005F038(void);
extern void image_rows_expand_repeated(void);
extern void func_8005F15C(void);
extern void image_rows_expand_horizontal(void);
extern void byte_plane_filter(void);
extern void image_plane_process(void);
extern s32 func_80063214(s32, s32);

void image_plane_transform(j_decompress_ptr cinfo)
{
    my_upsampler *upsample;
    s32 ci;
    jpeg_component_info *compptr;
    s32 need_buffer;
    s32 do_fancy;
    s32 h_in_group;
    s32 v_in_group;
    s32 h_out_group;
    s32 v_out_group;

    upsample = (my_upsampler *)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, sizeof(my_upsampler));
    cinfo->upsample = upsample;
    upsample->start_pass = func_8005EE88;
    upsample->upsample = image_plane_decode;
    upsample->need_context_rows = 0;
    if (cinfo->CCIR601_sampling) {
        cinfo->err->msg_code = 0x17;
        (*cinfo->err->error_exit)((j_common_ptr)cinfo);
    }
    do_fancy = cinfo->do_fancy_upsampling && cinfo->min_DCT_scaled_size > 1;
    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components;
         ci++, compptr++) {
        h_in_group = (compptr->h_samp_factor * compptr->DCT_scaled_size) /
                     cinfo->min_DCT_scaled_size;
        v_in_group = (compptr->v_samp_factor * compptr->DCT_scaled_size) /
                     cinfo->min_DCT_scaled_size;
        h_out_group = cinfo->max_h_samp_factor;
        v_out_group = cinfo->max_v_samp_factor;
        upsample->rowgroup_height[ci] = v_in_group;
        need_buffer = 1;
        if (!compptr->component_needed) {
            upsample->methods[ci] = (upsample1_ptr)func_8005F038;
            need_buffer = 0;
        } else if (h_in_group == h_out_group && v_in_group == v_out_group) {
            upsample->methods[ci] = (upsample1_ptr)func_8005F030;
            need_buffer = 0;
        } else if (h_in_group * 2 == h_out_group && v_in_group == v_out_group) {
            if (do_fancy && compptr->downsampled_width > 2)
                upsample->methods[ci] = (upsample1_ptr)byte_plane_filter;
            else
                upsample->methods[ci] = (upsample1_ptr)func_8005F15C;
        } else if (h_in_group * 2 == h_out_group &&
                   v_in_group * 2 == v_out_group) {
            if (do_fancy && compptr->downsampled_width > 2) {
                upsample->methods[ci] = (upsample1_ptr)image_plane_process;
                upsample->need_context_rows = 1;
            } else {
                upsample->methods[ci] =
                    (upsample1_ptr)image_rows_expand_horizontal;
            }
        } else {
            s32 h_expand = h_out_group / h_in_group;
            s32 h_remainder = h_out_group % h_in_group;

            if (h_remainder != 0)
                goto invalid_scale;
            {
                s32 v_expand = v_out_group / v_in_group;
                s32 v_remainder = v_out_group % v_in_group;

                if (v_remainder != 0)
                    goto invalid_scale;
                upsample->methods[ci] =
                    (upsample1_ptr)image_rows_expand_repeated;
                upsample->h_expand[ci] = h_expand;
                upsample->v_expand[ci] = v_expand;
                goto method_selected;
            }
invalid_scale:
            cinfo->err->msg_code = 0x25;
            (*cinfo->err->error_exit)((j_common_ptr)cinfo);
        }
method_selected:
        if (need_buffer) {
            upsample->color_buf[ci] = (*cinfo->mem->alloc_sarray)(
                (j_common_ptr)cinfo, 1,
                func_80063214(cinfo->output_width,
                              cinfo->max_h_samp_factor),
                cinfo->max_v_samp_factor);
        }
    }
}
