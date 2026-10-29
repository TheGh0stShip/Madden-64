#include "types.h"

typedef u8 *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;

struct JDecomp;

typedef struct {
    u8 pad0[0xC];
    void (*upmethod)(struct JDecomp *, JSAMPIMAGE, u32, JSAMPARRAY);
    u8 pad10[0x10];
    JSAMPROW spare_row;
    s32 spare_full;
    u32 out_row_width;
    u32 rows_to_go;
} JMergedUpsampler;

typedef struct JDecomp {
    u8 pad0[0x1C0];
    JMergedUpsampler *upsample;
} JDecomp;

void func_80063250(JSAMPARRAY, s32, JSAMPARRAY, s32, s32, u32);

void func_80062B0C(JDecomp *cinfo, JSAMPIMAGE input_buf, u32 *in_row_group_ctr, u32 in_row_groups_avail,
                   JSAMPARRAY output_buf, u32 *out_row_ctr, u32 out_rows_avail) {
    JMergedUpsampler *upsample = cinfo->upsample;
    JSAMPROW work_ptrs[2];
    u32 num_rows;

    if (upsample->spare_full) {
        func_80063250(&upsample->spare_row, 0, output_buf + *out_row_ctr, 0, 1, upsample->out_row_width);
        num_rows = 1;
        upsample->spare_full = 0;
    } else {
        num_rows = 2;
        if (num_rows > upsample->rows_to_go) {
            num_rows = upsample->rows_to_go;
        }
        out_rows_avail -= *out_row_ctr;
        if (num_rows > out_rows_avail) {
            num_rows = out_rows_avail;
        }
        work_ptrs[0] = output_buf[*out_row_ctr];
        if (num_rows > 1) {
            work_ptrs[1] = output_buf[*out_row_ctr + 1];
        } else {
            work_ptrs[1] = upsample->spare_row;
            upsample->spare_full = 1;
        }
        (*upsample->upmethod)(cinfo, input_buf, *in_row_group_ctr, work_ptrs);
    }
    *out_row_ctr += num_rows;
    upsample->rows_to_go -= num_rows;
    if (!upsample->spare_full) {
        (*in_row_group_ctr)++;
    }
}
