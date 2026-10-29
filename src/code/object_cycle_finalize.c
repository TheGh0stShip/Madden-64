#include "types.h"

/* IJG libjpeg jdhuff.c jpeg_fill_bit_buffer(): load bytes into the Huffman bit buffer, stopping at markers. */

typedef struct JpegDecompress JpegDecompress;

typedef struct {
    void (*error_exit)(JpegDecompress *cinfo);
    void (*emit_message)(JpegDecompress *cinfo, s32 level);
    u8 pad08[0x14 - 0x8];
    s32 msg_code;
    s32 msg_parm[2];
} JpegError;

typedef struct {
    u8 *next_input_byte;
    s32 bytes_in_buffer;
    u8 pad08[0xC - 0x8];
    s32 (*fill_input_buffer)(JpegDecompress *cinfo);
} JpegSource;

typedef struct {
    u8 pad00[0x5C];
    s32 discarded_bytes;
} JpegMarker;

struct JpegDecompress {
    JpegError *err;
    u8 pad04[0x14 - 0x4];
    JpegSource *src;
    u8 pad18[0x114 - 0x18];
    u32 restart_interval;
    u8 pad118[0x19C - 0x118];
    s32 unread_marker;
    u8 pad1A0[0x1B4 - 0x1A0];
    JpegMarker *marker;
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

s32 object_cycle_finalize(BitreadWorkingState *state, s32 get_buffer, s32 bits_left, s32 nbits) {
    u8 *next_input_byte = state->next_input_byte;
    s32 bytes_in_buffer = state->bytes_in_buffer;
    s32 c;

    while (bits_left < 25) {
        if (state->unread_marker == 0) {
            if (bytes_in_buffer == 0) {
                if (!(*state->cinfo->src->fill_input_buffer)(state->cinfo)) {
                    return 0;
                }
                next_input_byte = state->cinfo->src->next_input_byte;
                bytes_in_buffer = state->cinfo->src->bytes_in_buffer;
            }
            bytes_in_buffer--;
            c = *next_input_byte++;
            if (c == 0xFF) {
                do {
                    if (bytes_in_buffer == 0) {
                        if (!(*state->cinfo->src->fill_input_buffer)(state->cinfo)) {
                            return 0;
                        }
                        next_input_byte = state->cinfo->src->next_input_byte;
                        bytes_in_buffer = state->cinfo->src->bytes_in_buffer;
                    }
                    bytes_in_buffer--;
                    c = *next_input_byte++;
                } while (c == 0xFF);
                if (c == 0) {
                    c = 0xFF;
                } else {
                    state->unread_marker = c;
                    goto no_more_data;
                }
            }
        } else {
no_more_data:
            if (nbits > bits_left) {
                if (!*state->printed_eod_ptr) {
                    state->cinfo->err->msg_code = 0x71;
                    (*state->cinfo->err->emit_message)(state->cinfo, -1);
                    *state->printed_eod_ptr = 1;
                }
                c = 0;
            } else {
                break;
            }
        }
        get_buffer = (get_buffer << 8) | c;
        bits_left += 8;
    }
    state->next_input_byte = next_input_byte;
    state->bytes_in_buffer = bytes_in_buffer;
    state->get_buffer = get_buffer;
    state->bits_left = bits_left;
    return 1;
}
