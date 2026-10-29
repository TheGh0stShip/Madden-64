#include "types.h"

/* IJG libjpeg jdinput.c initial_setup(): validate the frame header and compute component dimensions. */

typedef struct JpegDecompress JpegDecompress;

typedef struct {
    void (*error_exit)(JpegDecompress *cinfo);
    void (*emit_message)(JpegDecompress *cinfo, s32 level);
    u8 pad08[0x14 - 0x8];
    s32 msg_code;
    s32 msg_parm[8];
} JpegError;

typedef struct {
    s32 component_id;
    s32 component_index;
    s32 h_samp_factor;
    s32 v_samp_factor;
    s32 quant_tbl_no;
    s32 dc_tbl_no;
    s32 ac_tbl_no;
    u32 width_in_blocks;
    u32 height_in_blocks;
    s32 DCT_scaled_size;
    u32 downsampled_width;
    u32 downsampled_height;
    s32 component_needed;
    u8 pad34[0x4C - 0x34];
    void *quant_table;
    u8 pad50[0x54 - 0x50];
} JpegComponent;

typedef struct {
    u8 pad00[0x10];
    s32 has_multiple_scans;
} JpegInputController;

struct JpegDecompress {
    JpegError *err;
    u8 pad04[0x18 - 0x4];
    u32 image_width;
    u32 image_height;
    s32 num_components;
    u8 pad24[0xD4 - 0x24];
    s32 data_precision;
    JpegComponent *comp_info;
    s32 progressive_mode;
    u8 padE0[0x130 - 0xE0];
    s32 max_h_samp_factor;
    s32 max_v_samp_factor;
    s32 min_DCT_scaled_size;
    u32 total_iMCU_rows;
    u8 pad140[0x144 - 0x140];
    s32 comps_in_scan;
    u8 pad148[0x1B0 - 0x148];
    JpegInputController *inputctl;
};

extern s32 func_800631D8(s32 a, s32 b); /* jdiv_round_up */

#define MAX(a, b) ((a) > (b) ? (a) : (b))

void object_animation_configure(JpegDecompress *cinfo) {
    s32 ci;
    JpegComponent *compptr;

    if ((s32)cinfo->image_height > 0xFFDC || (s32)cinfo->image_width > 0xFFDC) {
        (cinfo->err->msg_code = 0x28, cinfo->err->msg_parm[0] = 0xFFDC, (*cinfo->err->error_exit)(cinfo));
    }
    if (cinfo->data_precision != 8) {
        (cinfo->err->msg_code = 0xD, cinfo->err->msg_parm[0] = cinfo->data_precision, (*cinfo->err->error_exit)(cinfo));
    }
    if (cinfo->num_components > 10) {
        (cinfo->err->msg_code = 0x18, cinfo->err->msg_parm[0] = cinfo->num_components, cinfo->err->msg_parm[1] = 10,
         (*cinfo->err->error_exit)(cinfo));
    }
    cinfo->max_h_samp_factor = 1;
    cinfo->max_v_samp_factor = 1;
    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        if (compptr->h_samp_factor <= 0 || compptr->h_samp_factor > 4 ||
            compptr->v_samp_factor <= 0 || compptr->v_samp_factor > 4) {
            (cinfo->err->msg_code = 0x10, (*cinfo->err->error_exit)(cinfo));
        }
        cinfo->max_h_samp_factor = MAX(cinfo->max_h_samp_factor, compptr->h_samp_factor);
        cinfo->max_v_samp_factor = MAX(cinfo->max_v_samp_factor, compptr->v_samp_factor);
    }
    cinfo->min_DCT_scaled_size = 8;
    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        compptr->DCT_scaled_size = 8;
        compptr->width_in_blocks = func_800631D8((s32)cinfo->image_width * compptr->h_samp_factor, cinfo->max_h_samp_factor * 8);
        compptr->height_in_blocks = func_800631D8((s32)cinfo->image_height * compptr->v_samp_factor, cinfo->max_v_samp_factor * 8);
        compptr->downsampled_width = func_800631D8((s32)cinfo->image_width * compptr->h_samp_factor, cinfo->max_h_samp_factor);
        compptr->downsampled_height = func_800631D8((s32)cinfo->image_height * compptr->v_samp_factor, cinfo->max_v_samp_factor);
        compptr->component_needed = 1;
        compptr->quant_table = 0;
    }
    cinfo->total_iMCU_rows = func_800631D8(cinfo->image_height, cinfo->max_v_samp_factor * 8);
    if (cinfo->comps_in_scan < cinfo->num_components || cinfo->progressive_mode) {
        cinfo->inputctl->has_multiple_scans = 1;
    } else {
        cinfo->inputctl->has_multiple_scans = 0;
    }
}
