#include "types.h"

/* IJG libjpeg jdinput.c per_scan_setup(): compute MCU geometry for the current scan. */

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
    s32 MCU_width;
    s32 MCU_height;
    s32 MCU_blocks;
    s32 MCU_sample_width;
    s32 last_col_width;
    s32 last_row_height;
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
    JpegComponent *cur_comp_info[4];
    u32 MCUs_per_row;
    u32 MCU_rows_in_scan;
    s32 blocks_in_MCU;
    s32 MCU_membership[10];
    u8 pad18C[0x1B0 - 0x18C];
    JpegInputController *inputctl;
};

extern s32 func_800631D8(s32 a, s32 b); /* jdiv_round_up */

void object_animation_state_update(JpegDecompress *cinfo) {
    s32 ci;
    s32 mcublks;
    s32 tmp;
    JpegComponent *compptr;

    if (cinfo->comps_in_scan == 1) {
        compptr = cinfo->cur_comp_info[0];
        cinfo->MCUs_per_row = compptr->width_in_blocks;
        cinfo->MCU_rows_in_scan = compptr->height_in_blocks;
        compptr->MCU_width = 1;
        compptr->MCU_height = 1;
        compptr->MCU_blocks = 1;
        compptr->MCU_sample_width = compptr->DCT_scaled_size;
        compptr->last_col_width = 1;
        tmp = (s32)(compptr->height_in_blocks % compptr->v_samp_factor);
        if (tmp == 0) {
            tmp = compptr->v_samp_factor;
        }
        compptr->last_row_height = tmp;
        cinfo->blocks_in_MCU = 1;
        cinfo->MCU_membership[0] = 0;
    } else {
        if (cinfo->comps_in_scan <= 0 || cinfo->comps_in_scan > 4) {
            (cinfo->err->msg_code = 0x18, cinfo->err->msg_parm[0] = cinfo->comps_in_scan, cinfo->err->msg_parm[1] = 4,
             (*cinfo->err->error_exit)(cinfo));
        }
        cinfo->MCUs_per_row = func_800631D8(cinfo->image_width, cinfo->max_h_samp_factor * 8);
        cinfo->MCU_rows_in_scan = func_800631D8(cinfo->image_height, cinfo->max_v_samp_factor * 8);
        cinfo->blocks_in_MCU = 0;
        for (ci = 0; ci < cinfo->comps_in_scan; ci++) {
            compptr = cinfo->cur_comp_info[ci];
            compptr->MCU_width = compptr->h_samp_factor;
            compptr->MCU_height = compptr->v_samp_factor;
            compptr->MCU_blocks = compptr->MCU_width * compptr->MCU_height;
            compptr->MCU_sample_width = compptr->MCU_width * compptr->DCT_scaled_size;
            tmp = (s32)(compptr->width_in_blocks % compptr->MCU_width);
            if (tmp == 0) {
                tmp = compptr->MCU_width;
            }
            compptr->last_col_width = tmp;
            tmp = (s32)(compptr->height_in_blocks % compptr->MCU_height);
            if (tmp == 0) {
                tmp = compptr->MCU_height;
            }
            compptr->last_row_height = tmp;
            mcublks = compptr->MCU_blocks;
            if (cinfo->blocks_in_MCU + mcublks > 10) {
                (cinfo->err->msg_code = 0xB, (*cinfo->err->error_exit)(cinfo));
            }
            while (mcublks-- > 0) {
                cinfo->MCU_membership[cinfo->blocks_in_MCU++] = ci;
            }
        }
    }
}
