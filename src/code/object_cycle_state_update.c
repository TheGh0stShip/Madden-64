#include "types.h"

/* IJG libjpeg jdmarker.c next_marker(): find the next JPEG marker, counting garbage bytes. */

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

s32 object_cycle_state_update(JpegDecompress *cinfo) {
    s32 c;
    JpegSource *datasrc = cinfo->src;
    u8 *next_input_byte = datasrc->next_input_byte;
    s32 bytes_in_buffer = datasrc->bytes_in_buffer;

    for (;;) {
        INPUT_BYTE(cinfo, c, return 0);
        while (c != 0xFF) {
            cinfo->marker->discarded_bytes++;
            INPUT_SYNC(cinfo);
            INPUT_BYTE(cinfo, c, return 0);
        }
        do {
            INPUT_BYTE(cinfo, c, return 0);
        } while (c == 0xFF);
        if (c != 0) {
            break;
        }
        cinfo->marker->discarded_bytes += 2;
        INPUT_SYNC(cinfo);
    }
    if (cinfo->marker->discarded_bytes != 0) {
        cinfo->err->msg_code = 0x70;
        cinfo->err->msg_parm[0] = cinfo->marker->discarded_bytes;
        cinfo->err->msg_parm[1] = c;
        (*cinfo->err->emit_message)(cinfo, -1);
        cinfo->marker->discarded_bytes = 0;
    }
    cinfo->unread_marker = c;
    INPUT_SYNC(cinfo);
    return 1;
}
