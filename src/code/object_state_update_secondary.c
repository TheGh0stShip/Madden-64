#include "types.h"

/* IJG libjpeg jdphuff.c decode_mcu_AC_first(): progressive AC first scan. */

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
    DerivedTable *ac_derived_tbl;
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
    s32 Ss;
    s32 Se;
    s32 Ah;
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
extern const s32 D_80003528[]; /* jpeg_natural_order */

s32 object_state_update_secondary(JpegDecompress *cinfo, JBlock **MCU_data) {
    PhuffEntropy *entropy = cinfo->entropy;
    s32 Se = cinfo->Se;
    s32 Al = cinfo->Al;
    s32 s;
    s32 k;
    s32 r;
    u32 EOBRUN;
    JBlock *block;
    s32 get_buffer;
    s32 bits_left;
    BitreadWorkingState br_state;
    DerivedTable *tbl;

    if (cinfo->restart_interval) {
        if (entropy->restarts_to_go == 0) {
            if (!func_80059E14(cinfo)) {
                return 0;
            }
        }
    }
    EOBRUN = entropy->saved.EOBRUN;
    if (EOBRUN > 0) {
        EOBRUN--;
    } else {
        br_state.cinfo = cinfo;
        br_state.next_input_byte = cinfo->src->next_input_byte;
        br_state.bytes_in_buffer = cinfo->src->bytes_in_buffer;
        br_state.unread_marker = cinfo->unread_marker;
        get_buffer = entropy->bitstate.get_buffer;
        bits_left = entropy->bitstate.bits_left;
        br_state.printed_eod_ptr = &entropy->bitstate.printed_eod;
        block = MCU_data[0];
        tbl = entropy->ac_derived_tbl;
        for (k = cinfo->Ss; k <= Se; k++) {
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
                        goto label2;
                    }
                }
                look = ((s32)(get_buffer >> (bits_left - 8))) & 0xFF;
                if ((nb = tbl->look_nbits[look]) != 0) {
                    bits_left -= nb;
                    s = tbl->look_sym[look];
                } else {
                    nb = 9;
label2:
                    if ((s = func_800592E8(&br_state, get_buffer, bits_left, tbl, nb)) < 0) {
                        return 0;
                    }
                    get_buffer = br_state.get_buffer;
                    bits_left = br_state.bits_left;
                }
            }
            r = s >> 4;
            s &= 15;
            if (s) {
                k += r;
                if (bits_left < s) {
                    if (!func_80059154(&br_state, get_buffer, bits_left, s)) {
                        return 0;
                    }
                    get_buffer = br_state.get_buffer;
                    bits_left = br_state.bits_left;
                }
                r = ((s32)(get_buffer >> (bits_left -= s))) & ((1 << s) - 1);
                s = (r < D_800032B0[s]) ? r + D_800032F0[s] : r;
                (*block)[D_80003528[k]] = (s16)(s << Al);
            } else {
                if (r == 15) {
                    k += 15;
                } else {
                    EOBRUN = 1 << r;
                    if (r) {
                        if (bits_left < r) {
                            if (!func_80059154(&br_state, get_buffer, bits_left, r)) {
                                return 0;
                            }
                            get_buffer = br_state.get_buffer;
                            bits_left = br_state.bits_left;
                        }
                        r = ((s32)(get_buffer >> (bits_left -= r))) & ((1 << r) - 1);
                        EOBRUN += r;
                    }
                    EOBRUN--;
                    break;
                }
            }
        }
        cinfo->src->next_input_byte = br_state.next_input_byte;
        cinfo->src->bytes_in_buffer = br_state.bytes_in_buffer;
        cinfo->unread_marker = br_state.unread_marker;
        entropy->bitstate.get_buffer = get_buffer;
        entropy->bitstate.bits_left = bits_left;
    }
    entropy->saved.EOBRUN = EOBRUN;
    entropy->restarts_to_go--;
    return 1;
}
