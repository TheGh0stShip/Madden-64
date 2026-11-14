/* IJG libjpeg 6a jquant1.c: start_pass_1_quant(). */
#include "types.h"

typedef u32 size_t;
typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef s16 FSERROR;
typedef FSERROR *FSERRPTR;
typedef s32 boolean;
typedef struct jpeg_decompress_struct *j_decompress_ptr;

typedef struct {
    void *start_pass;
    void (*color_quantize)(j_decompress_ptr, JSAMPARRAY, JSAMPARRAY, s32);
    void *finish_pass;
    void *new_color_map;
} jpeg_color_quantizer;

typedef struct {
    jpeg_color_quantizer pub;
    JSAMPARRAY sv_colormap;
    s32 sv_actual;
    JSAMPARRAY colorindex;
    boolean is_padded;
    s32 Ncolors[4];
    s32 row_index;
    void *odither[4];
    FSERRPTR fserrors[4];
    boolean on_odd_row;
} my_cquantizer;

typedef struct jpeg_error_mgr {
    void (*error_exit)(j_decompress_ptr cinfo);
    void *other[4];
    s32 msg_code;
} jpeg_error_mgr;

typedef struct jpeg_decompress_struct {
    jpeg_error_mgr *err;
    u8 pad004[0x54];
    u32 dither_mode;
    u8 pad05C[0x14];
    JDIMENSION output_width;
    u8 pad074[4];
    s32 out_color_components;
    u8 pad07C[8];
    s32 actual_number_of_colors;
    JSAMPARRAY colormap;
    u8 pad08C[0x13C];
    my_cquantizer *cquantize;
} jpeg_decompress_struct;

extern void index_planes_accumulate(j_decompress_ptr, JSAMPARRAY,
                                    JSAMPARRAY, s32);
extern void indexed_rgb_accumulate(j_decompress_ptr, JSAMPARRAY,
                                   JSAMPARRAY, s32);
extern void func_80060870(j_decompress_ptr, JSAMPARRAY, JSAMPARRAY, s32);
extern void func_8006099C(j_decompress_ptr, JSAMPARRAY, JSAMPARRAY, s32);
extern void object_table_process(j_decompress_ptr, JSAMPARRAY, JSAMPARRAY,
                                 s32);
extern void image_table_decode(j_decompress_ptr cinfo);
extern void object_shared_buffers_assign(j_decompress_ptr cinfo);
extern void object_children_allocate(j_decompress_ptr cinfo);
extern void func_800632F4(void *output, size_t count);

void image_table_update(j_decompress_ptr cinfo, boolean is_pre_scan)
{
    my_cquantizer *cquantize = cinfo->cquantize;
    size_t arraysize;
    s32 i;

    cinfo->colormap = cquantize->sv_colormap;
    cinfo->actual_number_of_colors = cquantize->sv_actual;

    switch (cinfo->dither_mode) {
    case 0:
        if (cinfo->out_color_components == 3)
            cquantize->pub.color_quantize = indexed_rgb_accumulate;
        else
            cquantize->pub.color_quantize = index_planes_accumulate;
        break;
    case 1:
        if (cinfo->out_color_components == 3)
            cquantize->pub.color_quantize = func_8006099C;
        else
            cquantize->pub.color_quantize = func_80060870;
        cquantize->row_index = 0;
        if (!cquantize->is_padded)
            image_table_decode(cinfo);
        if (cquantize->odither[0] == 0)
            object_shared_buffers_assign(cinfo);
        break;
    case 2:
        cquantize->pub.color_quantize = object_table_process;
        cquantize->on_odd_row = 0;
        if (cquantize->fserrors[0] == 0)
            object_children_allocate(cinfo);
        arraysize = (size_t)((cinfo->output_width + 2) * sizeof(FSERROR));
        for (i = 0; i < cinfo->out_color_components; i++)
            func_800632F4(cquantize->fserrors[i], arraysize);
        break;
    default:
        cinfo->err->msg_code = 0x2F;
        (*cinfo->err->error_exit)(cinfo);
        break;
    }
}
