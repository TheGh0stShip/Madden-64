#include "types.h"

/* IJG libjpeg jdmarker.c read_markers(): read JPEG markers until SOS or EOI. */

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

typedef struct JpegDecompress JpegDecompress_;

typedef struct {
    u8 pad00[0xC];
    s32 (*process_COM)(struct JpegDecompress *cinfo);
    s32 (*process_APPn[16])(struct JpegDecompress *cinfo);
    s32 saw_SOI;
    u8 pad54[0x5C - 0x54];
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

extern s32 func_80058624(JpegDecompress *cinfo); /* first_marker */
extern s32 func_8005848C(JpegDecompress *cinfo); /* next_marker */
extern s32 func_80056A88(JpegDecompress *cinfo); /* get_soi */
extern s32 func_80056B50(JpegDecompress *cinfo, s32 is_prog, s32 is_arith); /* get_sof */
extern s32 func_80056F8C(JpegDecompress *cinfo); /* get_sos */
extern s32 func_800578B8(JpegDecompress *cinfo); /* get_dac */
extern s32 func_80057AB0(JpegDecompress *cinfo); /* get_dht */
extern s32 func_80057EF0(JpegDecompress *cinfo); /* get_dqt */
extern s32 func_80058210(JpegDecompress *cinfo); /* get_dri */
extern s32 func_80058384(JpegDecompress *cinfo); /* skip_variable */

s32 object_cycle_process(JpegDecompress *cinfo) {
    for (;;) {
        if (cinfo->unread_marker == 0) {
            if (!cinfo->marker->saw_SOI) {
                if (!func_80058624(cinfo)) {
                    return 0;
                }
            } else {
                if (!func_8005848C(cinfo)) {
                    return 0;
                }
            }
        }
        switch (cinfo->unread_marker) {
        case 0xD8:
            if (!func_80056A88(cinfo)) {
                return 0;
            }
            break;
        case 0xC0:
        case 0xC1:
            if (!func_80056B50(cinfo, 0, 0)) {
                return 0;
            }
            break;
        case 0xC2:
            if (!func_80056B50(cinfo, 1, 0)) {
                return 0;
            }
            break;
        case 0xC9:
            if (!func_80056B50(cinfo, 0, 1)) {
                return 0;
            }
            break;
        case 0xCA:
            if (!func_80056B50(cinfo, 1, 1)) {
                return 0;
            }
            break;
        case 0xC3:
        case 0xC5:
        case 0xC6:
        case 0xC7:
        case 0xC8:
        case 0xCB:
        case 0xCD:
        case 0xCE:
        case 0xCF:
            cinfo->err->msg_code = 0x3B;
            cinfo->err->msg_parm[0] = cinfo->unread_marker;
            (*cinfo->err->error_exit)(cinfo);
            break;
        case 0xDA:
            if (!func_80056F8C(cinfo)) {
                return 0;
            }
            cinfo->unread_marker = 0;
            return 1;
        case 0xD9:
            cinfo->err->msg_code = 0x54;
            (*cinfo->err->emit_message)(cinfo, 1);
            cinfo->unread_marker = 0;
            return 2;
        case 0xCC:
            if (!func_800578B8(cinfo)) {
                return 0;
            }
            break;
        case 0xC4:
            if (!func_80057AB0(cinfo)) {
                return 0;
            }
            break;
        case 0xDB:
            if (!func_80057EF0(cinfo)) {
                return 0;
            }
            break;
        case 0xDD:
            if (!func_80058210(cinfo)) {
                return 0;
            }
            break;
        case 0xE0:
        case 0xE1:
        case 0xE2:
        case 0xE3:
        case 0xE4:
        case 0xE5:
        case 0xE6:
        case 0xE7:
        case 0xE8:
        case 0xE9:
        case 0xEA:
        case 0xEB:
        case 0xEC:
        case 0xED:
        case 0xEE:
        case 0xEF:
            if (!(*cinfo->marker->process_APPn[cinfo->unread_marker - 0xE0])(cinfo)) {
                return 0;
            }
            break;
        case 0xFE:
            if (!(*cinfo->marker->process_COM)(cinfo)) {
                return 0;
            }
            break;
        case 0xD0:
        case 0xD1:
        case 0xD2:
        case 0xD3:
        case 0xD4:
        case 0xD5:
        case 0xD6:
        case 0xD7:
        case 0x01:
            cinfo->err->msg_code = 0x5B;
            cinfo->err->msg_parm[0] = cinfo->unread_marker;
            (*cinfo->err->emit_message)(cinfo, 1);
            break;
        case 0xDC:
            if (!func_80058384(cinfo)) {
                return 0;
            }
            break;
        default:
            cinfo->err->msg_code = 0x43;
            cinfo->err->msg_parm[0] = cinfo->unread_marker;
            (*cinfo->err->error_exit)(cinfo);
            break;
        }
        cinfo->unread_marker = 0;
    }
}
