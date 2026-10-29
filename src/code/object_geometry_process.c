#include "types.h"

/* IJG libjpeg jdcoefct.c consume_data(): read one iMCU row of a multi-scan image into the coefficient buffer. */

typedef struct JpegDecompress JpegDecompress;
typedef s16 JBlock[64];
typedef JBlock *JBlockRow;
typedef JBlockRow *JBlockArray;

typedef struct {
    u8 pad00[0x20];
    JBlockArray (*access_virt_barray)(JpegDecompress *cinfo, void *ptr, u32 start_row, u32 num_rows, s32 writable);
} JpegMemory;

typedef struct {
    s32 component_id;
    s32 component_index;
    s32 h_samp_factor;
    s32 v_samp_factor;
    u8 pad10[0x34 - 0x10];
    s32 MCU_width;
    s32 MCU_height;
} JpegComponent;

typedef struct {
    u8 pad00[0x14];
    u32 MCU_ctr;
    s32 MCU_vert_offset;
    s32 MCU_rows_per_iMCU_row;
    JBlockRow MCU_buffer[10];
    void *whole_image[10];
} CoefController;

typedef struct {
    u8 pad00[0x4];
    s32 (*decode_mcu)(JpegDecompress *cinfo, JBlockRow *MCU_data);
} JpegEntropy;

typedef struct {
    u8 pad00[0xC];
    void (*finish_input_pass)(JpegDecompress *cinfo);
} JpegInputController;

struct JpegDecompress {
    void *err;
    JpegMemory *mem;
    u8 pad08[0x94 - 0x8];
    u32 input_iMCU_row;
    u8 pad98[0x13C - 0x98];
    u32 total_iMCU_rows;
    u8 pad140[0x144 - 0x140];
    s32 comps_in_scan;
    JpegComponent *cur_comp_info[4];
    u32 MCUs_per_row;
    u8 pad15C[0x1A8 - 0x15C];
    CoefController *coef;
    u8 pad1AC[0x1B0 - 0x1AC];
    JpegInputController *inputctl;
    u8 pad1B4[0x1B8 - 0x1B4];
    JpegEntropy *entropy;
};

extern void func_8005B618(JpegDecompress *cinfo); /* start_iMCU_row */

s32 object_geometry_process(JpegDecompress *cinfo) {
    CoefController *coef = cinfo->coef;
    u32 MCU_col_num;
    s32 blkn;
    s32 ci;
    s32 xindex;
    s32 yindex;
    s32 yoffset;
    u32 start_col;
    JBlockArray buffer[4];
    JBlockRow buffer_ptr;
    JpegComponent *compptr;

    for (ci = 0; ci < cinfo->comps_in_scan; ci++) {
        compptr = cinfo->cur_comp_info[ci];
        buffer[ci] = (*cinfo->mem->access_virt_barray)(cinfo, coef->whole_image[compptr->component_index],
                                                      cinfo->input_iMCU_row * compptr->v_samp_factor,
                                                      compptr->v_samp_factor, 1);
    }
    for (yoffset = coef->MCU_vert_offset; yoffset < coef->MCU_rows_per_iMCU_row; yoffset++) {
        for (MCU_col_num = coef->MCU_ctr; MCU_col_num < cinfo->MCUs_per_row; MCU_col_num++) {
            blkn = 0;
            for (ci = 0; ci < cinfo->comps_in_scan; ci++) {
                compptr = cinfo->cur_comp_info[ci];
                start_col = MCU_col_num * compptr->MCU_width;
                for (yindex = 0; yindex < compptr->MCU_height; yindex++) {
                    buffer_ptr = buffer[ci][yindex + yoffset] + start_col;
                    for (xindex = 0; xindex < compptr->MCU_width; xindex++) {
                        coef->MCU_buffer[blkn++] = buffer_ptr++;
                    }
                }
            }
            if (!(*cinfo->entropy->decode_mcu)(cinfo, coef->MCU_buffer)) {
                coef->MCU_vert_offset = yoffset;
                coef->MCU_ctr = MCU_col_num;
                return 0;
            }
        }
        coef->MCU_ctr = 0;
    }
    if (++(cinfo->input_iMCU_row) < cinfo->total_iMCU_rows) {
        func_8005B618(cinfo);
        return 3;
    }
    (*cinfo->inputctl->finish_input_pass)(cinfo);
    return 4;
}
