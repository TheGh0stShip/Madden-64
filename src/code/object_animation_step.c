#include "types.h"

/* IJG libjpeg jdmarker.c get_dac(): process a DAC (define arithmetic coding conditioning) marker. */

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
    u8 pad18[0xE4 - 0x18];
    u8 arith_dc_L[16];
    u8 arith_dc_U[16];
    u8 arith_ac_K[16];
    u32 restart_interval;
    u8 pad118[0x19C - 0x118];
    s32 unread_marker;
    u8 pad1A0[0x1B4 - 0x1A0];
    JpegMarker *marker;
};

#define INPUT_BYTE(cinfo, V, action) \
    do { \
        if (bytes_in_buffer == 0) { \
            if (!(*datasrc->fill_input_buffer)(cinfo)) { action; } \
            next_input_byte = datasrc->next_input_byte; \
            bytes_in_buffer = datasrc->bytes_in_buffer; \
        } \
        bytes_in_buffer--; \
        V = *next_input_byte++; \
    } while (0)

#define INPUT_2BYTES(cinfo, V, action) \
    do { \
        if (bytes_in_buffer == 0) { \
            if (!(*datasrc->fill_input_buffer)(cinfo)) { action; } \
            next_input_byte = datasrc->next_input_byte; \
            bytes_in_buffer = datasrc->bytes_in_buffer; \
        } \
        bytes_in_buffer--; \
        V = ((u32)(*next_input_byte++)) << 8; \
        if (bytes_in_buffer == 0) { \
            if (!(*datasrc->fill_input_buffer)(cinfo)) { action; } \
            next_input_byte = datasrc->next_input_byte; \
            bytes_in_buffer = datasrc->bytes_in_buffer; \
        } \
        bytes_in_buffer--; \
        V += *next_input_byte++; \
    } while (0)

#define INPUT_SYNC(cinfo) \
    (datasrc->next_input_byte = next_input_byte, datasrc->bytes_in_buffer = bytes_in_buffer)

s32 object_animation_step(JpegDecompress *cinfo) {
    s32 length;
    s32 index;
    s32 val;
    JpegSource *datasrc = cinfo->src;
    u8 *next_input_byte = datasrc->next_input_byte;
    s32 bytes_in_buffer = datasrc->bytes_in_buffer;

    INPUT_2BYTES(cinfo, length, return 0);
    length -= 2;
    while (length > 0) {
        INPUT_BYTE(cinfo, index, return 0);
        INPUT_BYTE(cinfo, val, return 0);
        length -= 2;
        cinfo->err->msg_code = 0x4E;
        cinfo->err->msg_parm[0] = index;
        cinfo->err->msg_parm[1] = val;
        (*cinfo->err->emit_message)(cinfo, 1);
        if (index < 0 || index >= 32) {
            cinfo->err->msg_code = 0x1A;
            cinfo->err->msg_parm[0] = index;
            (*cinfo->err->error_exit)(cinfo);
        }
        if (index >= 16) {
            cinfo->arith_ac_K[index - 16] = val;
        } else {
            cinfo->arith_dc_L[index] = val & 0x0F;
            cinfo->arith_dc_U[index] = val >> 4;
            if (cinfo->arith_dc_L[index] > cinfo->arith_dc_U[index]) {
                cinfo->err->msg_code = 0x1B;
                cinfo->err->msg_parm[0] = val;
                (*cinfo->err->error_exit)(cinfo);
            }
        }
    }
    INPUT_SYNC(cinfo);
    return 1;
}
