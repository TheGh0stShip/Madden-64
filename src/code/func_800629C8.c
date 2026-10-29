#include "types.h"

#define SCALEBITS 16
#define ONE_HALF ((s32)1 << (SCALEBITS - 1))
#define FIX(x) ((s32)((x) * (1L << SCALEBITS) + 0.5))

struct JDecomp;

typedef struct {
    void *(*alloc_small)(struct JDecomp *, s32, u32);
} JMemMgr;

typedef struct {
    u8 pad0[0x10];
    s32 *Cr_r_tab;
    s32 *Cb_b_tab;
    s32 *Cr_g_tab;
    s32 *Cb_g_tab;
} JColorDeconverter;

typedef struct JDecomp {
    void *err;
    JMemMgr *mem;
    u8 pad8[0x1B8];
    JColorDeconverter *cconvert;
} JDecomp;

void func_800629C8(JDecomp *cinfo) {
    JColorDeconverter *cconvert = cinfo->cconvert;
    s32 i;
    s32 x;

    cconvert->Cr_r_tab = (s32 *)(*cinfo->mem->alloc_small)(cinfo, 1, 256 * sizeof(s32));
    cconvert->Cb_b_tab = (s32 *)(*cinfo->mem->alloc_small)(cinfo, 1, 256 * sizeof(s32));
    cconvert->Cr_g_tab = (s32 *)(*cinfo->mem->alloc_small)(cinfo, 1, 256 * sizeof(s32));
    cconvert->Cb_g_tab = (s32 *)(*cinfo->mem->alloc_small)(cinfo, 1, 256 * sizeof(s32));

    for (i = 0, x = -128; i <= 255; i++, x++) {
        cconvert->Cr_r_tab[i] = (s32)((FIX(1.40200) * x + ONE_HALF) >> SCALEBITS);
        cconvert->Cb_b_tab[i] = (s32)((FIX(1.77200) * x + ONE_HALF) >> SCALEBITS);
        cconvert->Cr_g_tab[i] = (-FIX(0.71414)) * x;
        cconvert->Cb_g_tab[i] = (-FIX(0.34414)) * x + ONE_HALF;
    }
}
