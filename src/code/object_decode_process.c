#include "types.h"

/* IJG libjpeg jdcoefct.c jinit_d_coef_controller(): create the coefficient buffer controller. */

typedef struct JpegDecompress JpegDecompress;
typedef s16 JBlock[64];

typedef struct {
    void *(*alloc_small)(JpegDecompress *cinfo, s32 pool_id, u32 sizeofobject);
    void *(*alloc_large)(JpegDecompress *cinfo, s32 pool_id, u32 sizeofobject);
    u8 pad08[0x14 - 0x8];
    void *(*request_virt_barray)(JpegDecompress *cinfo, s32 pool_id, s32 pre_zero, u32 blocksperrow, u32 numrows, u32 maxaccess);
} JpegMemory;

typedef struct {
    s32 component_id;
    s32 component_index;
    s32 h_samp_factor;
    s32 v_samp_factor;
    u8 pad10[0x1C - 0x10];
    u32 width_in_blocks;
    u32 height_in_blocks;
    u8 pad24[0x54 - 0x24];
} JpegComponent;

typedef struct {
    void (*start_input_pass)(JpegDecompress *cinfo);
    s32 (*consume_data)(JpegDecompress *cinfo);
    void (*start_output_pass)(JpegDecompress *cinfo);
    s32 (*decompress_data)(JpegDecompress *cinfo, void *output_buf);
    void **coef_arrays;
    u8 pad14[0x20 - 0x14];
    JBlock *MCU_buffer[10];
    void *whole_image[10];
    s32 *coef_bits_latch;
} CoefController;

struct JpegDecompress {
    void *err;
    JpegMemory *mem;
    u8 pad08[0x20 - 0x8];
    s32 num_components;
    u8 pad24[0xD8 - 0x24];
    JpegComponent *comp_info;
    s32 progressive_mode;
    u8 padE0[0x1A8 - 0xE0];
    CoefController *coef;
};

extern void func_8005B66C(JpegDecompress *cinfo); /* start_input_pass */
extern void func_8005B68C(JpegDecompress *cinfo); /* start_output_pass */
extern s32 func_8005B9F0(JpegDecompress *cinfo); /* consume_data */
extern s32 func_8005BC20(JpegDecompress *cinfo, void *output_buf); /* decompress_data */
extern s32 func_8005B9E8(JpegDecompress *cinfo); /* dummy_consume_data */
extern s32 func_8005B704(JpegDecompress *cinfo, void *output_buf); /* decompress_onepass */
extern s32 func_80063214(s32 a, s32 b); /* jround_up */

void object_decode_process(JpegDecompress *cinfo, s32 need_full_buffer) {
    CoefController *coef;

    coef = (*cinfo->mem->alloc_small)(cinfo, 1, sizeof(CoefController));
    cinfo->coef = coef;
    coef->start_input_pass = func_8005B66C;
    coef->start_output_pass = func_8005B68C;
    coef->coef_bits_latch = 0;
    if (need_full_buffer) {
        s32 ci;
        s32 access_rows;
        JpegComponent *compptr;

        for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
            access_rows = compptr->v_samp_factor;
            if (cinfo->progressive_mode) {
                access_rows *= 3;
            }
            coef->whole_image[ci] = (*cinfo->mem->request_virt_barray)(cinfo, 1, 1,
                func_80063214(compptr->width_in_blocks, compptr->h_samp_factor),
                func_80063214(compptr->height_in_blocks, compptr->v_samp_factor),
                access_rows);
        }
        coef->consume_data = func_8005B9F0;
        coef->decompress_data = func_8005BC20;
        coef->coef_arrays = coef->whole_image;
    } else {
        JBlock *buffer;
        s32 i;

        buffer = (*cinfo->mem->alloc_large)(cinfo, 1, 10 * sizeof(JBlock));
        for (i = 0; i < 10; i++) {
            coef->MCU_buffer[i] = buffer + i;
        }
        coef->consume_data = func_8005B9E8;
        coef->decompress_data = func_8005B704;
        coef->coef_arrays = 0;
    }
}
