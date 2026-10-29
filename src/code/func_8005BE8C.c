#include "types.h"

/* IJG libjpeg jdcoefct.c smoothing_ok(): decide whether block smoothing is possible and useful. */

typedef struct JpegDecompress JpegDecompress;

typedef struct {
    void *(*alloc_small)(JpegDecompress *cinfo, s32 pool_id, u32 sizeofobject);
} JpegMemory;

typedef struct {
    u16 quantval[64];
} JpegQuantTable;

typedef struct {
    u8 pad00[0x4C];
    JpegQuantTable *quant_table;
    u8 pad50[0x54 - 0x50];
} JpegComponent;

typedef struct {
    u8 pad00[0x70];
    s32 *coef_bits_latch;
} CoefController;

struct JpegDecompress {
    void *err;
    JpegMemory *mem;
    u8 pad08[0x20 - 0x8];
    s32 num_components;
    u8 pad24[0xA0 - 0x24];
    s32 (*coef_bits)[64];
    u8 padA4[0xD8 - 0xA4];
    JpegComponent *comp_info;
    s32 progressive_mode;
    u8 padE0[0x1A8 - 0xE0];
    CoefController *coef;
};

s32 func_8005BE8C(JpegDecompress *cinfo) {
    CoefController *coef = cinfo->coef;
    s32 smoothing_useful = 0;
    s32 ci;
    s32 coefi;
    JpegComponent *compptr;
    JpegQuantTable *qtable;
    s32 *coef_bits;
    s32 *coef_bits_latch;

    if (!cinfo->progressive_mode || cinfo->coef_bits == 0) {
        return 0;
    }
    if (coef->coef_bits_latch == 0) {
        coef->coef_bits_latch = (*cinfo->mem->alloc_small)(cinfo, 1, cinfo->num_components * (6 * sizeof(s32)));
    }
    coef_bits_latch = coef->coef_bits_latch;
    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        if ((qtable = compptr->quant_table) == 0) {
            return 0;
        }
        if (qtable->quantval[0] == 0 || qtable->quantval[1] == 0 || qtable->quantval[8] == 0 ||
            qtable->quantval[16] == 0 || qtable->quantval[9] == 0 || qtable->quantval[2] == 0) {
            return 0;
        }
        coef_bits = cinfo->coef_bits[ci];
        if (coef_bits[0] < 0) {
            return 0;
        }
        for (coefi = 1; coefi <= 5; coefi++) {
            coef_bits_latch[coefi] = coef_bits[coefi];
            if (coef_bits[coefi] != 0) {
                smoothing_useful = 1;
            }
        }
        coef_bits_latch += 6;
    }
    return smoothing_useful;
}
