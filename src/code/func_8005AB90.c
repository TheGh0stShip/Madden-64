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

struct JDecomp;

typedef struct {
    void *(*alloc_small)(struct JDecomp *, s32, u32);
} JMemMgr;

typedef struct JDecomp {
    void *err;
    JMemMgr *mem;
    u8 pad8[0x18];
    s32 num_components;
    u8 pad24[0xB4];
    JCompInfo *comp_info;
    u8 padDC[0x5C];
    s32 min_DCT_scaled_size;
    u8 pad13C[0x68];
    JMainController *main;
} JDecomp;

void func_8005AB90(JDecomp *cinfo) {
    JMainController *main = cinfo->main;
    s32 ci, rgroup;
    s32 M = cinfo->min_DCT_scaled_size;
    JCompInfo *compptr;
    JSAMPARRAY xbuf;

    main->xbuffer[0] = (JSAMPIMAGE)(*cinfo->mem->alloc_small)(cinfo, 1, cinfo->num_components * 2 * sizeof(JSAMPARRAY));
    main->xbuffer[1] = main->xbuffer[0] + cinfo->num_components;

    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        rgroup = (compptr->v_samp_factor * compptr->DCT_scaled_size) / cinfo->min_DCT_scaled_size;
        xbuf = (JSAMPARRAY)(*cinfo->mem->alloc_small)(cinfo, 1, 2 * (rgroup * (M + 4)) * sizeof(JSAMPROW));
        xbuf += rgroup;
        main->xbuffer[0][ci] = xbuf;
        xbuf += rgroup * (M + 4);
        main->xbuffer[1][ci] = xbuf;
    }
}
