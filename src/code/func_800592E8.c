#include "types.h"

typedef struct JpegErrMgr {
    void *error_exit;
    void (*emit_message)(void *cinfo, s32 msg_level);
    u8 pad8[0xC];
    s32 msg_code;
} JpegErrMgr;

typedef struct {
    JpegErrMgr *err;
} JpegCinfo;

typedef struct {
    u8 *next_input_byte;
    s32 bytes_in_buffer;
    s32 unread_marker;
    s32 get_buffer;
    s32 bits_left;
    JpegCinfo *cinfo;
} BitreadState;

typedef struct {
    u8 bits[17];
    u8 huffval[256];
} JHuffTbl;

typedef struct {
    s32 mincode[17];
    s32 maxcode[18];
    s32 valptr[17];
    JHuffTbl *pub;
} DerivedTbl;

s32 func_80059154(BitreadState *, s32, s32, s32);

s32 func_800592E8(BitreadState *state, s32 get_buffer, s32 bits_left, DerivedTbl *htbl, s32 min_bits) {
    s32 l = min_bits;
    s32 code;

    if (bits_left < l) {
        if (!func_80059154(state, get_buffer, bits_left, l)) {
            return -1;
        }
        get_buffer = state->get_buffer;
        bits_left = state->bits_left;
    }
    code = (get_buffer >> (bits_left -= l)) & ((1 << l) - 1);

    while (code > htbl->maxcode[l]) {
        code <<= 1;
        if (bits_left < 1) {
            if (!func_80059154(state, get_buffer, bits_left, 1)) {
                return -1;
            }
            get_buffer = state->get_buffer;
            bits_left = state->bits_left;
        }
        code |= (get_buffer >> (bits_left -= 1)) & 1;
        l++;
    }

    state->get_buffer = get_buffer;
    state->bits_left = bits_left;

    if (l > 16) {
        state->cinfo->err->msg_code = 0x72;
        (*state->cinfo->err->emit_message)(state->cinfo, -1);
        return 0;
    }

    return htbl->pub->huffval[htbl->valptr[l] + (s32)(code - htbl->mincode[l])];
}
