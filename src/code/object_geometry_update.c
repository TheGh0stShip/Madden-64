#include "types.h"

/* IJG libjpeg jdcoefct.c decompress_data(): inverse-DCT one iMCU row from the full-image coefficient buffer. */

typedef struct JpegDecompress JpegDecompress;
typedef s16 JBlock[64];
typedef JBlock *JBlockRow;
typedef JBlockRow *JBlockArray;
typedef u8 *JSampRow;
typedef JSampRow *JSampArray;
typedef JSampArray *JSampImage;

typedef struct {
    u8 pad00[0x20];
    JBlockArray (*access_virt_barray)(JpegDecompress *cinfo, void *ptr, u32 start_row, u32 num_rows, s32 writable);
} JpegMemory;

typedef struct JpegComponent JpegComponent;
struct JpegComponent {
    s32 component_id;
    s32 component_index;
    s32 h_samp_factor;
    s32 v_samp_factor;
    u8 pad10[0x1C - 0x10];
    u32 width_in_blocks;
    u32 height_in_blocks;
    s32 DCT_scaled_size;
    u8 pad28[0x30 - 0x28];
    s32 component_needed;
    u8 pad34[0x54 - 0x34];
};

typedef void (*InverseDCT)(JpegDecompress *cinfo, JpegComponent *compptr, s16 *coef_block, JSampArray output_buf, u32 output_col);

typedef struct {
    u8 pad00[0x4];
    InverseDCT inverse_DCT[10];
} JpegIDCT;

typedef struct {
    u8 pad00[0x48];
    void *whole_image[10];
} CoefController;

typedef struct {
    s32 (*consume_input)(JpegDecompress *cinfo);
} JpegInputController;

struct JpegDecompress {
    void *err;
    JpegMemory *mem;
    u8 pad08[0x20 - 0x8];
    s32 num_components;
    u8 pad24[0x90 - 0x24];
    s32 input_scan_number;
    u32 input_iMCU_row;
    s32 output_scan_number;
    u32 output_iMCU_row;
    u8 padA0[0xD8 - 0xA0];
    JpegComponent *comp_info;
    u8 padDC[0x13C - 0xDC];
    u32 total_iMCU_rows;
    u8 pad140[0x1A8 - 0x140];
    CoefController *coef;
    u8 pad1AC[0x1B0 - 0x1AC];
    JpegInputController *inputctl;
    u8 pad1B4[0x1BC - 0x1B4];
    JpegIDCT *idct;
};

s32 object_geometry_update(JpegDecompress *cinfo, JSampImage output_buf) {
    CoefController *coef = cinfo->coef;
    u32 last_iMCU_row = cinfo->total_iMCU_rows - 1;
    u32 block_num;
    s32 ci;
    s32 block_row;
    s32 block_rows;
    JBlockArray buffer;
    JBlockRow buffer_ptr;
    JSampArray output_ptr;
    u32 output_col;
    JpegComponent *compptr;
    InverseDCT inverse_DCT;

    while (cinfo->input_scan_number < cinfo->output_scan_number ||
           (cinfo->input_scan_number == cinfo->output_scan_number && cinfo->input_iMCU_row <= cinfo->output_iMCU_row)) {
        if ((*cinfo->inputctl->consume_input)(cinfo) == 0) {
            return 0;
        }
    }
    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        if (!compptr->component_needed) {
            continue;
        }
        buffer = (*cinfo->mem->access_virt_barray)(cinfo, coef->whole_image[ci],
                                                  cinfo->output_iMCU_row * compptr->v_samp_factor,
                                                  compptr->v_samp_factor, 0);
        if (cinfo->output_iMCU_row < last_iMCU_row) {
            block_rows = compptr->v_samp_factor;
        } else {
            block_rows = (s32)(compptr->height_in_blocks % compptr->v_samp_factor);
            if (block_rows == 0) {
                block_rows = compptr->v_samp_factor;
            }
        }
        inverse_DCT = cinfo->idct->inverse_DCT[ci];
        output_ptr = output_buf[ci];
        for (block_row = 0; block_row < block_rows; block_row++) {
            buffer_ptr = buffer[block_row];
            output_col = 0;
            for (block_num = 0; block_num < compptr->width_in_blocks; block_num++) {
                (*inverse_DCT)(cinfo, compptr, (s16 *)buffer_ptr, output_ptr, output_col);
                buffer_ptr++;
                output_col += compptr->DCT_scaled_size;
            }
            output_ptr += compptr->DCT_scaled_size;
        }
    }
    if (++(cinfo->output_iMCU_row) < cinfo->total_iMCU_rows) {
        return 3;
    }
    return 4;
}
