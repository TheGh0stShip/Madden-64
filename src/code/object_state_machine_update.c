#include "types.h"

/* IJG libjpeg jdhuff.c decode_mcu(): decode one MCU of a baseline (sequential) Huffman scan. */

typedef struct JpegDecompress JpegDecompress;

typedef struct {
    u8 *next_input_byte;
    s32 bytes_in_buffer;
} JpegSource;

typedef struct {
    s32 get_buffer;
    s32 bits_left;
    s32 printed_eod;
} BitreadPermState;

typedef struct {
    s32 last_dc_val[4];
} SavableState;

typedef struct {
    u8 look_pad[0xD4];
    s32 look_nbits[256];
    u8 look_sym[256];
} DerivedTable;

typedef struct {
    u8 pad00[0x8];
    BitreadPermState bitstate;
    SavableState saved;
    u32 restarts_to_go;
    DerivedTable *dc_derived_tbls[4];
    DerivedTable *ac_derived_tbls[4];
} PhuffEntropy;

typedef struct {
    u8 pad00[0x14];
    s32 dc_tbl_no;
    s32 ac_tbl_no;
    u8 pad1C[0x24 - 0x1C];
    s32 DCT_scaled_size;
    u8 pad28[0x30 - 0x28];
    s32 component_needed;
} JpegComponent;

struct JpegDecompress {
    u8 pad00[0x14];
    JpegSource *src;
    u8 pad18[0x114 - 0x18];
    u32 restart_interval;
    u8 pad118[0x148 - 0x118];
    JpegComponent *cur_comp_info[4];
    u8 pad158[0x160 - 0x158];
    s32 blocks_in_MCU;
    s32 MCU_membership[10];
    u8 pad18C[0x198 - 0x18C];
    s32 Al;
    s32 unread_marker;
    u8 pad1A0[0x1B8 - 0x1A0];
    PhuffEntropy *entropy;
};

typedef struct {
    u8 *next_input_byte;
    s32 bytes_in_buffer;
    s32 unread_marker;
    s32 get_buffer;
    s32 bits_left;
    JpegDecompress *cinfo;
    s32 *printed_eod_ptr;
} BitreadWorkingState;

typedef s16 JBlock[64];

extern s32 func_80059434(JpegDecompress *cinfo); /* process_restart */
extern s32 func_80059154(BitreadWorkingState *state, s32 get_buffer, s32 bits_left, s32 nbits); /* jpeg_fill_bit_buffer */
extern s32 func_800592E8(BitreadWorkingState *state, s32 get_buffer, s32 bits_left, DerivedTable *htbl, s32 min_bits); /* jpeg_huff_decode */
extern const s32 D_80003230[]; /* extend_test */
extern const s32 D_80003270[]; /* extend_offset */
extern const s32 D_80003528[]; /* jpeg_natural_order */

#define HUFF_DECODE(result, htbl, slowlabel) \
    { \
        s32 nb; \
        s32 look; \
        if (bits_left < 8) { \
            if (!func_80059154(&br_state, get_buffer, bits_left, 0)) { \
                return 0; \
            } \
            get_buffer = br_state.get_buffer; \
            bits_left = br_state.bits_left; \
            if (bits_left < 8) { \
                nb = 1; \
                goto slowlabel; \
            } \
        } \
        look = ((s32)(get_buffer >> (bits_left - 8))) & 0xFF; \
        if ((nb = htbl->look_nbits[look]) != 0) { \
            bits_left -= nb; \
            result = htbl->look_sym[look]; \
        } else { \
            nb = 9; \
slowlabel: \
            if ((result = func_800592E8(&br_state, get_buffer, bits_left, htbl, nb)) < 0) { \
                return 0; \
            } \
            get_buffer = br_state.get_buffer; \
            bits_left = br_state.bits_left; \
        } \
    }

#define CHECK_BIT_BUFFER(nbits) \
    { \
        if (bits_left < (nbits)) { \
            if (!func_80059154(&br_state, get_buffer, bits_left, nbits)) { \
                return 0; \
            } \
            get_buffer = br_state.get_buffer; \
            bits_left = br_state.bits_left; \
        } \
    }

#define GET_BITS(nbits) (((s32)(get_buffer >> (bits_left -= (nbits)))) & ((1 << (nbits)) - 1))
#define HUFF_EXTEND(x, s) ((x) < D_80003230[s] ? (x) + D_80003270[s] : (x))

s32 object_state_machine_update(JpegDecompress *cinfo, JBlock **MCU_data) {
    PhuffEntropy *entropy = cinfo->entropy;
    s32 s;
    s32 k;
    s32 r;
    s32 blkn;
    s32 ci;
    JBlock *block;
    s32 get_buffer;
    s32 bits_left;
    BitreadWorkingState br_state;
    SavableState state;
    DerivedTable *dctbl;
    DerivedTable *actbl;
    JpegComponent *compptr;

    if (cinfo->restart_interval) {
        if (entropy->restarts_to_go == 0) {
            if (!func_80059434(cinfo)) {
                return 0;
            }
        }
    }
    br_state.cinfo = cinfo;
    br_state.next_input_byte = cinfo->src->next_input_byte;
    br_state.bytes_in_buffer = cinfo->src->bytes_in_buffer;
    br_state.unread_marker = cinfo->unread_marker;
    get_buffer = entropy->bitstate.get_buffer;
    bits_left = entropy->bitstate.bits_left;
    br_state.printed_eod_ptr = &entropy->bitstate.printed_eod;
    state = entropy->saved;
    for (blkn = 0; blkn < cinfo->blocks_in_MCU; blkn++) {
        block = MCU_data[blkn];
        ci = cinfo->MCU_membership[blkn];
        compptr = cinfo->cur_comp_info[ci];
        dctbl = entropy->dc_derived_tbls[compptr->dc_tbl_no];
        actbl = entropy->ac_derived_tbls[compptr->ac_tbl_no];
        HUFF_DECODE(s, dctbl, label1);
        if (s) {
            CHECK_BIT_BUFFER(s);
            r = GET_BITS(s);
            s = HUFF_EXTEND(r, s);
        }
        if (compptr->component_needed) {
            s += state.last_dc_val[ci];
            state.last_dc_val[ci] = s;
            (*block)[0] = (s16)s;
            if (compptr->DCT_scaled_size > 1) {
                for (k = 1; k < 64; k++) {
                    HUFF_DECODE(s, actbl, label2);
                    r = s >> 4;
                    s &= 15;
                    if (s) {
                        k += r;
                        CHECK_BIT_BUFFER(s);
                        r = GET_BITS(s);
                        s = HUFF_EXTEND(r, s);
                        (*block)[D_80003528[k]] = (s16)s;
                    } else {
                        if (r != 15) {
                            break;
                        }
                        k += 15;
                    }
                }
                continue;
            }
        }
        for (k = 1; k < 64; k++) {
            HUFF_DECODE(s, actbl, label3);
            r = s >> 4;
            s &= 15;
            if (s) {
                k += r;
                CHECK_BIT_BUFFER(s);
                bits_left -= s;
            } else {
                if (r != 15) {
                    break;
                }
                k += 15;
            }
        }
    }
    cinfo->src->next_input_byte = br_state.next_input_byte;
    cinfo->src->bytes_in_buffer = br_state.bytes_in_buffer;
    cinfo->unread_marker = br_state.unread_marker;
    entropy->bitstate.get_buffer = get_buffer;
    entropy->bitstate.bits_left = bits_left;
    entropy->saved = state;
    entropy->restarts_to_go--;
    return 1;
}
