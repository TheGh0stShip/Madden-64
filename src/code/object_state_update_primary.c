#include "types.h"

/* IJG libjpeg jdphuff.c decode_mcu_DC_first(): progressive DC first scan. */

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
    u32 EOBRUN;
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
    DerivedTable *derived_tbls[4];
} PhuffEntropy;

typedef struct {
    u8 pad00[0x14];
    s32 dc_tbl_no;
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

extern s32 func_80059E14(JpegDecompress *cinfo); /* process_restart */
extern s32 func_80059154(BitreadWorkingState *state, s32 get_buffer, s32 bits_left, s32 nbits); /* jpeg_fill_bit_buffer */
extern s32 func_800592E8(BitreadWorkingState *state, s32 get_buffer, s32 bits_left, DerivedTable *htbl, s32 min_bits); /* jpeg_huff_decode */
extern const s32 D_800032B0[]; /* extend_test */
extern const s32 D_800032F0[]; /* extend_offset */

s32 object_state_update_primary(JpegDecompress *cinfo, JBlock **MCU_data) {
    PhuffEntropy *entropy = cinfo->entropy;
    s32 Al = cinfo->Al;
    s32 s;
    s32 r;
    s32 blkn;
    s32 ci;
    JBlock *block;
    s32 get_buffer;
    s32 bits_left;
    BitreadWorkingState br_state;
    SavableState state;
    DerivedTable *tbl;
    JpegComponent *compptr;

    if (cinfo->restart_interval) {
        if (entropy->restarts_to_go == 0) {
            if (!func_80059E14(cinfo)) {
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
        tbl = entropy->derived_tbls[compptr->dc_tbl_no];
        {
            s32 nb;
            s32 look;

            if (bits_left < 8) {
                if (!func_80059154(&br_state, get_buffer, bits_left, 0)) {
                    return 0;
                }
                get_buffer = br_state.get_buffer;
                bits_left = br_state.bits_left;
                if (bits_left < 8) {
                    nb = 1;
                    goto label1;
                }
            }
            look = ((s32)(get_buffer >> (bits_left - 8))) & 0xFF;
            if ((nb = tbl->look_nbits[look]) != 0) {
                bits_left -= nb;
                s = tbl->look_sym[look];
            } else {
                nb = 9;
label1:
                if ((s = func_800592E8(&br_state, get_buffer, bits_left, tbl, nb)) < 0) {
                    return 0;
                }
                get_buffer = br_state.get_buffer;
                bits_left = br_state.bits_left;
            }
        }
        if (s) {
            if (bits_left < s) {
                if (!func_80059154(&br_state, get_buffer, bits_left, s)) {
                    return 0;
                }
                get_buffer = br_state.get_buffer;
                bits_left = br_state.bits_left;
            }
            r = ((s32)(get_buffer >> (bits_left -= s))) & ((1 << s) - 1);
            s = (r < D_800032B0[s]) ? r + D_800032F0[s] : r;
        }
        s += state.last_dc_val[ci];
        state.last_dc_val[ci] = s;
        (*block)[0] = (s16)(s << Al);
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
