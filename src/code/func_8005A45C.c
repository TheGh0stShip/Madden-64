#include "types.h"

/* IJG libjpeg jdphuff.c decode_mcu_DC_refine(): progressive DC successive-approximation refinement scan. */

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
    u8 pad00[0x8];
    BitreadPermState bitstate;
    u8 pad14[0x28 - 0x14];
    u32 restarts_to_go;
} PhuffEntropy;

struct JpegDecompress {
    u8 pad00[0x14];
    JpegSource *src;
    u8 pad18[0x114 - 0x18];
    u32 restart_interval;
    u8 pad118[0x160 - 0x118];
    s32 blocks_in_MCU;
    u8 pad164[0x198 - 0x164];
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

s32 func_8005A45C(JpegDecompress *cinfo, JBlock **MCU_data) {
    PhuffEntropy *entropy = cinfo->entropy;
    s32 p1 = 1 << cinfo->Al;
    s32 blkn;
    JBlock *block;
    s32 get_buffer;
    s32 bits_left;
    BitreadWorkingState br_state;

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
    for (blkn = 0; blkn < cinfo->blocks_in_MCU; blkn++) {
        block = MCU_data[blkn];
        {
            if (bits_left < 1) {
                if (!func_80059154(&br_state, get_buffer, bits_left, 1)) {
                    return 0;
                }
                get_buffer = br_state.get_buffer;
                bits_left = br_state.bits_left;
            }
        }
        if (((s32)(get_buffer >> (bits_left -= 1))) & 1) {
            (*block)[0] |= p1;
        }
    }
    cinfo->src->next_input_byte = br_state.next_input_byte;
    cinfo->src->bytes_in_buffer = br_state.bytes_in_buffer;
    cinfo->unread_marker = br_state.unread_marker;
    entropy->bitstate.get_buffer = get_buffer;
    entropy->bitstate.bits_left = bits_left;
    entropy->restarts_to_go--;
    return 1;
}
