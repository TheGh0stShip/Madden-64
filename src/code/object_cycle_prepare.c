#include "types.h"

/* IJG libjpeg jdmarker.c jpeg_resync_to_restart(): recover from a missing or out-of-order RSTn marker. */

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

extern s32 func_8005848C(JpegDecompress *cinfo); /* next_marker */

s32 object_cycle_prepare(JpegDecompress *cinfo, s32 desired) {
    s32 marker = cinfo->unread_marker;
    s32 action = 1;

    cinfo->err->msg_code = 0x75;
    cinfo->err->msg_parm[0] = marker;
    cinfo->err->msg_parm[1] = desired;
    (*cinfo->err->emit_message)(cinfo, -1);
    for (;;) {
        if (marker < 0xC0) {
            action = 2;
        } else if (marker < 0xD0 || marker > 0xD7) {
            action = 3;
        } else {
            if (marker == 0xD0 + ((desired + 1) & 7) || marker == 0xD0 + ((desired + 2) & 7)) {
                action = 3;
            } else if (marker == 0xD0 + ((desired - 1) & 7) || marker == 0xD0 + ((desired - 2) & 7)) {
                action = 2;
            } else {
                action = 1;
            }
        }
        cinfo->err->msg_code = 0x60;
        cinfo->err->msg_parm[0] = marker;
        cinfo->err->msg_parm[1] = action;
        (*cinfo->err->emit_message)(cinfo, 4);
        switch (action) {
        case 1:
            cinfo->unread_marker = 0;
            return 1;
        case 2:
            if (!func_8005848C(cinfo)) {
                return 0;
            }
            marker = cinfo->unread_marker;
            break;
        case 3:
            return 1;
        }
    }
}
