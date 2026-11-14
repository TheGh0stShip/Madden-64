/* IJG libjpeg 6a jquant2.c: start_pass_2_quant(). */
#include "types.h"

typedef u32 size_t;
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
    void *sv_colormap;
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
    void *alloc_small;
    void *alloc_large;
} jpeg_memory_mgr;

struct jpeg_decompress_struct {
    jpeg_error_mgr *err;
    jpeg_memory_mgr *mem;
    u8 pad008[0x50];
    s32 dither_mode;
    u8 pad05C[0x14];
    u32 output_width;
    u8 pad074[0x10];
    s32 actual_number_of_colors;
    void *colormap;
    u8 pad08C[0x13C];
    my_cquantizer *cquantize;
};
struct jpeg_common_struct { jpeg_error_mgr *err; jpeg_memory_mgr *mem; };

extern void indexed_texel_increment(void);
extern void func_800625E0(void);
extern void func_80062620(void);
extern void object_lookup_table_build(void);
extern void object_lookup_indices_decode(void);
extern void object_lookup_table_create(j_decompress_ptr);
extern void func_800632F4(void *, size_t);

void object_stream_state_process(j_decompress_ptr cinfo, s32 is_pre_scan)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    hist3d histogram = cquantize->histogram;
    s32 i;

    if (cinfo->dither_mode != 0)
        cinfo->dither_mode = 2;
    if (is_pre_scan) {
        cquantize->pub.color_quantize = indexed_texel_increment;
        cquantize->pub.finish_pass = func_800625E0;
        cquantize->needs_zeroed = 1;
    } else {
        if (cinfo->dither_mode == 2)
            cquantize->pub.color_quantize = object_lookup_table_build;
        else
            cquantize->pub.color_quantize = object_lookup_indices_decode;
        cquantize->pub.finish_pass = func_80062620;
        i = cinfo->actual_number_of_colors;
        if (i < 1) {
            cinfo->err->msg_code = 0x37;
            cinfo->err->msg_parm.i[0] = 1;
            (*cinfo->err->error_exit)((j_common_ptr)cinfo);
        }
        if (i > 256) {
            cinfo->err->msg_code = 0x38;
            cinfo->err->msg_parm.i[0] = 256;
            (*cinfo->err->error_exit)((j_common_ptr)cinfo);
        }
        if (cinfo->dither_mode == 2) {
            size_t arraysize = (cinfo->output_width + 2) * (3 * sizeof(FSERROR));
            if (cquantize->fserrors == 0)
                cquantize->fserrors = (FSERRPTR)(*(void *(*)(j_common_ptr, s32, size_t))
                    cinfo->mem->alloc_large)((j_common_ptr)cinfo, 1, arraysize);
            func_800632F4(cquantize->fserrors, arraysize);
            if (cquantize->error_limiter == 0)
                object_lookup_table_create(cinfo);
            cquantize->on_odd_row = 0;
        }
    }
    if (cquantize->needs_zeroed) {
        for (i = 0; i < 32; i++)
            func_800632F4(histogram[i], 4096);
        cquantize->needs_zeroed = 0;
    }
}
