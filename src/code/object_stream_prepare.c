/* IJG libjpeg 6a jquant2.c: jinit_2pass_quantizer(). */
#include "types.h"

typedef u32 size_t;
typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef u16 histcell;
typedef histcell *hist2d;
typedef hist2d *hist3d;
typedef s16 FSERROR;
typedef FSERROR *FSERRPTR;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_common_struct *j_common_ptr;

typedef struct {
    void *start_pass;
    void *color_quantize;
    void *finish_pass;
    void *new_color_map;
} jpeg_color_quantizer;
typedef struct {
    jpeg_color_quantizer pub;
    JSAMPARRAY sv_colormap;
    s32 desired;
    hist3d histogram;
    s32 needs_zeroed;
    FSERRPTR fserrors;
    s32 on_odd_row;
    s32 *error_limiter;
} my_cquantizer;
typedef struct jpeg_error_mgr {
    void (*error_exit)(j_common_ptr);
    void *emit_message;
    void *output_message;
    void *format_message;
    void *reset_error_mgr;
    s32 msg_code;
    union { s32 i[8]; char s[80]; } msg_parm;
} jpeg_error_mgr;
typedef struct jpeg_memory_mgr {
    void *(*alloc_small)(j_common_ptr, s32, size_t);
    void *(*alloc_large)(j_common_ptr, s32, size_t);
    JSAMPARRAY (*alloc_sarray)(j_common_ptr, s32, u32, u32);
} jpeg_memory_mgr;
struct jpeg_decompress_struct {
    jpeg_error_mgr *err;
    jpeg_memory_mgr *mem;
    u8 pad008[0x50];
    s32 dither_mode;
    u8 pad05C[4];
    s32 desired_number_of_colors;
    u8 pad064[8];
    s32 enable_2pass_quant;
    u32 output_width;
    u8 pad074[4];
    s32 out_color_components;
    u8 pad07C[0x14C];
    my_cquantizer *cquantize;
};
struct jpeg_common_struct { jpeg_error_mgr *err; jpeg_memory_mgr *mem; };

extern void object_stream_state_process(void);
extern void func_800627E0(void);
extern void object_lookup_table_create(j_decompress_ptr);

void object_stream_prepare(j_decompress_ptr cinfo)
{
    my_cquantizer *cquantize;
    s32 i;

    cquantize = (my_cquantizer *)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, sizeof(my_cquantizer));
    cinfo->cquantize = cquantize;
    cquantize->pub.start_pass = object_stream_state_process;
    cquantize->pub.new_color_map = func_800627E0;
    cquantize->fserrors = 0;
    cquantize->error_limiter = 0;
    if (cinfo->out_color_components != 3) {
        cinfo->err->msg_code = 0x2E;
        (*cinfo->err->error_exit)((j_common_ptr)cinfo);
    }
    cquantize->histogram = (hist3d)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, 32 * sizeof(hist2d));
    for (i = 0; i < 32; i++)
        cquantize->histogram[i] = (hist2d)(*cinfo->mem->alloc_large)(
            (j_common_ptr)cinfo, 1, 4096);
    cquantize->needs_zeroed = 1;
    if (cinfo->enable_2pass_quant) {
        s32 desired = cinfo->desired_number_of_colors;
        if (desired < 8) {
            cinfo->err->msg_code = 0x37;
            cinfo->err->msg_parm.i[0] = 8;
            (*cinfo->err->error_exit)((j_common_ptr)cinfo);
        }
        if (desired > 256) {
            cinfo->err->msg_code = 0x38;
            cinfo->err->msg_parm.i[0] = 256;
            (*cinfo->err->error_exit)((j_common_ptr)cinfo);
        }
        cquantize->sv_colormap = (*cinfo->mem->alloc_sarray)(
            (j_common_ptr)cinfo, 1, desired, 3);
        cquantize->desired = desired;
    } else {
        cquantize->sv_colormap = 0;
    }
    if (cinfo->dither_mode != 0)
        cinfo->dither_mode = 2;
    if (cinfo->dither_mode == 2) {
        cquantize->fserrors = (FSERRPTR)(*cinfo->mem->alloc_large)(
            (j_common_ptr)cinfo, 1,
            (cinfo->output_width + 2) * (3 * sizeof(FSERROR)));
        object_lookup_table_create(cinfo);
    }
}
