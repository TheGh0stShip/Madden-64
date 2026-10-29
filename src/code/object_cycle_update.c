#include "types.h"

/* IJG libjpeg jdhuff.c jpeg_make_d_derived_tbl(): expand a Huffman table definition into decoding tables. */

typedef struct JpegDecompress JpegDecompress;

typedef struct {
    void *(*alloc_small)(JpegDecompress *cinfo, s32 pool_id, u32 sizeofobject);
} JpegMemory;

struct JpegDecompress {
    void *err;
    JpegMemory *mem;
};

typedef struct {
    u8 bits[17];
    u8 huffval[256];
    s32 sent_table;
} JpegHuffTable;

typedef struct {
    s32 mincode[17];
    s32 maxcode[18];
    s32 valptr[17];
    JpegHuffTable *pub;
    s32 look_nbits[256];
    u8 look_sym[256];
} JpegDerivedTable;

extern void *func_8002E58C(void *dst, s32 value, u32 size); /* memset (MEMZERO) */

void object_cycle_update(JpegDecompress *cinfo, JpegHuffTable *htbl, JpegDerivedTable **pdtbl) {
    JpegDerivedTable *dtbl;
    s32 p;
    s32 i;
    s32 l;
    s32 si;
    s32 lookbits;
    s32 ctr;
    u8 huffsize[257];
    u32 huffcode[257];
    u32 code;

    if (*pdtbl == 0) {
        *pdtbl = (*cinfo->mem->alloc_small)(cinfo, 1, sizeof(JpegDerivedTable));
    }
    dtbl = *pdtbl;
    dtbl->pub = htbl;
    p = 0;
    for (l = 1; l <= 16; l++) {
        for (i = 1; i <= (s32)htbl->bits[l]; i++) {
            huffsize[p++] = (u8)l;
        }
    }
    huffsize[p] = 0;
    code = 0;
    si = huffsize[0];
    p = 0;
    while (huffsize[p]) {
        while (((s32)huffsize[p]) == si) {
            huffcode[p++] = code;
            code++;
        }
        code <<= 1;
        si++;
    }
    p = 0;
    for (l = 1; l <= 16; l++) {
        if (htbl->bits[l]) {
            dtbl->valptr[l] = p;
            dtbl->mincode[l] = huffcode[p];
            p += htbl->bits[l];
            dtbl->maxcode[l] = huffcode[p - 1];
        } else {
            dtbl->maxcode[l] = -1;
        }
    }
    dtbl->maxcode[17] = 0xFFFFF;
    func_8002E58C(dtbl->look_nbits, 0, sizeof(dtbl->look_nbits));
    p = 0;
    for (l = 1; l <= 8; l++) {
        for (i = 1; i <= (s32)htbl->bits[l]; i++, p++) {
            lookbits = huffcode[p] << (8 - l);
            for (ctr = 1 << (8 - l); ctr > 0; ctr--) {
                dtbl->look_nbits[lookbits] = l;
                dtbl->look_sym[lookbits] = htbl->huffval[p];
                lookbits++;
            }
        }
    }
}
