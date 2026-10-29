#include "types.h"

typedef u8 *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;

typedef struct {
    u8 pad0[0xC];
    s32 v_samp_factor;
    u8 pad10[0x14];
    s32 DCT_scaled_size;
    u8 pad28[4];
    u32 downsampled_height;
    u8 pad30[0x24];
} JCompInfo;

typedef struct {
    u8 pad0[0x38];
    JSAMPIMAGE xbuffer[2];
    s32 whichptr;
    s32 context_state;
    u32 iMCU_row_ctr;
} JMainController;

typedef struct {
    u8 pad0[0x20];
    s32 num_components;
    u8 pad24[0xB4];
    JCompInfo *comp_info;
    u8 padDC[0x5C];
    s32 min_DCT_scaled_size;
    u8 pad13C[0x68];
    JMainController *main;
} JDecomp;

void func_8005AFD0(JDecomp *cinfo) {
    JMainController *main = cinfo->main;
    s32 ci, i, rgroup, iMCUheight, rows_left;
    JCompInfo *compptr;
    JSAMPARRAY xbuf;

    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        iMCUheight = compptr->v_samp_factor * compptr->DCT_scaled_size;
        rgroup = iMCUheight / cinfo->min_DCT_scaled_size;
        rows_left = (s32)(compptr->downsampled_height % (u32)iMCUheight);
        if (rows_left == 0) {
            rows_left = iMCUheight;
        }
        if (ci == 0) {
            main->iMCU_row_ctr = (u32)((rows_left - 1) / rgroup + 1);
        }
        xbuf = main->xbuffer[main->whichptr][ci];
        for (i = 0; i < rgroup * 2; i++) {
            xbuf[rows_left + i] = xbuf[rows_left - 1];
        }
    }
}
