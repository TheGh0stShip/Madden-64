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

void func_8005AE90(JDecomp *cinfo) {
    JMainController *main = cinfo->main;
    s32 ci, i, rgroup;
    s32 M = cinfo->min_DCT_scaled_size;
    JCompInfo *compptr;
    JSAMPARRAY xbuf0, xbuf1;

    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        rgroup = (compptr->v_samp_factor * compptr->DCT_scaled_size) / cinfo->min_DCT_scaled_size;
        xbuf0 = main->xbuffer[0][ci];
        xbuf1 = main->xbuffer[1][ci];
        for (i = 0; i < rgroup; i++) {
            xbuf0[i - rgroup] = xbuf0[rgroup * (M + 1) + i];
            xbuf1[i - rgroup] = xbuf1[rgroup * (M + 1) + i];
            xbuf0[rgroup * (M + 2) + i] = xbuf0[i];
            xbuf1[rgroup * (M + 2) + i] = xbuf1[i];
        }
    }
}
