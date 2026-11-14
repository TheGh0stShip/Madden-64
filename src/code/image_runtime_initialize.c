/* IJG libjpeg 6a jquant1.c: jinit_1pass_quantizer(). */
#include "types.h"

typedef u32 size_t;
typedef s16 FSERROR;
typedef FSERROR *FSERRPTR;
typedef struct jpeg_decompress_struct *j_decompress_ptr;
typedef struct jpeg_common_struct *j_common_ptr;
typedef void *(*alloc_small_method)(j_common_ptr, s32, size_t);

typedef struct {
    void *start_pass;
    void *color_quantize;
    void *finish_pass;
    void *new_color_map;
} jpeg_color_quantizer;
typedef struct {
    jpeg_color_quantizer pub;
    void *sv_colormap;
    s32 sv_actual;
    void *colorindex;
    s32 is_padded;
    s32 Ncolors[4];
    s32 row_index;
    void *odither[4];
    FSERRPTR fserrors[4];
    s32 on_odd_row;
} my_cquantizer;

typedef struct jpeg_error_mgr {
    void (*error_exit)(j_common_ptr cinfo);
    void *other[4];
    s32 msg_code;
    union { s32 i[8]; char s[80]; } msg_parm;
} jpeg_error_mgr;
typedef struct jpeg_memory_mgr { alloc_small_method alloc_small; } jpeg_memory_mgr;

struct jpeg_decompress_struct {
    jpeg_error_mgr *err;
    jpeg_memory_mgr *mem;
    u8 pad008[0x50];
    u32 dither_mode;
    u8 pad05C[4];
    s32 desired_number_of_colors;
    u8 pad064[0x14];
    s32 out_color_components;
    u8 pad07C[0x14C];
    jpeg_color_quantizer *cquantize;
};
struct jpeg_common_struct { jpeg_error_mgr *err; jpeg_memory_mgr *mem; };

extern void image_table_update(void);
extern void func_80060EF4(void);
extern void func_80060EFC(void);
extern void image_table_process(j_decompress_ptr cinfo);
extern void image_table_decode(j_decompress_ptr cinfo);
extern void object_children_allocate(j_decompress_ptr cinfo);

void image_runtime_initialize(j_decompress_ptr cinfo)
{
    my_cquantizer *cquantize;

    cquantize = (my_cquantizer *)(*cinfo->mem->alloc_small)(
        (j_common_ptr)cinfo, 1, sizeof(my_cquantizer));
    cinfo->cquantize = (jpeg_color_quantizer *)cquantize;
    cquantize->pub.start_pass = image_table_update;
    cquantize->pub.finish_pass = func_80060EF4;
    cquantize->pub.new_color_map = func_80060EFC;
    cquantize->fserrors[0] = 0;
    cquantize->odither[0] = 0;

    if (cinfo->out_color_components > 4) {
        cinfo->err->msg_code = 0x36;
        cinfo->err->msg_parm.i[0] = 4;
        (*cinfo->err->error_exit)((j_common_ptr)cinfo);
    }
    if (cinfo->desired_number_of_colors > 256) {
        cinfo->err->msg_code = 0x38;
        cinfo->err->msg_parm.i[0] = 256;
        (*cinfo->err->error_exit)((j_common_ptr)cinfo);
    }

    image_table_process(cinfo);
    image_table_decode(cinfo);
    if (cinfo->dither_mode == 2)
        object_children_allocate(cinfo);
}
