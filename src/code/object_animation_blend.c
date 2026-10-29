#include "types.h"

/* IJG libjpeg jdmarker.c get_sos(): process an SOS (start of scan) marker. */

typedef struct JpegDecompress JpegDecompress;

typedef struct {
    void (*error_exit)(JpegDecompress *cinfo);
    void (*emit_message)(JpegDecompress *cinfo, s32 level);
    u8 pad08[0x14 - 0x8];
    s32 msg_code;
    s32 msg_parm[8];
} JpegError;

typedef struct {
    u8 *next_input_byte;
    s32 bytes_in_buffer;
    u8 pad08[0xC - 0x8];
    s32 (*fill_input_buffer)(JpegDecompress *cinfo);
} JpegSource;

typedef struct {
    u8 pad00[0x54];
    s32 saw_SOF;
    s32 next_restart_num;
    s32 discarded_bytes;
} JpegMarker;

typedef struct {
    s32 component_id;
    u8 pad04[0x14 - 0x4];
    s32 dc_tbl_no;
    s32 ac_tbl_no;
    u8 pad1C[0x54 - 0x1C];
} JpegComponent;

struct JpegDecompress {
    JpegError *err;
    u8 pad04[0x14 - 0x4];
    JpegSource *src;
    u8 pad18[0x20 - 0x18];
    s32 num_components;
    u8 pad24[0x90 - 0x24];
    s32 input_scan_number;
    u8 pad94[0xD8 - 0x94];
    JpegComponent *comp_info;
    u8 padDC[0x114 - 0xDC];
    u32 restart_interval;
    u8 pad118[0x144 - 0x118];
    s32 comps_in_scan;
    JpegComponent *cur_comp_info[4];
    u8 pad158[0x18C - 0x158];
    s32 Ss;
    s32 Se;
    s32 Ah;
    s32 Al;
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

s32 object_animation_blend(JpegDecompress *cinfo) {
    s32 length;
    s32 i;
    s32 ci;
    s32 n;
    s32 c;
    s32 cc;
    JpegComponent *compptr;
    JpegSource *datasrc = cinfo->src;
    u8 *next_input_byte = datasrc->next_input_byte;
    s32 bytes_in_buffer = datasrc->bytes_in_buffer;

    if (!cinfo->marker->saw_SOF) {
        cinfo->err->msg_code = 0x3D;
        (*cinfo->err->error_exit)(cinfo);
    }
    INPUT_2BYTES(cinfo, length, return 0);
    INPUT_BYTE(cinfo, n, return 0);
    if (length != (n * 2 + 6) || n < 1 || n > 4) {
        cinfo->err->msg_code = 9;
        (*cinfo->err->error_exit)(cinfo);
    }
    cinfo->err->msg_code = 0x66;
    cinfo->err->msg_parm[0] = n;
    (*cinfo->err->emit_message)(cinfo, 1);
    cinfo->comps_in_scan = n;
    for (i = 0; i < n; i++) {
        INPUT_BYTE(cinfo, cc, return 0);
        INPUT_BYTE(cinfo, c, return 0);
        for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
            if (cc == compptr->component_id) {
                goto id_found;
            }
        }
        cinfo->err->msg_code = 5;
        cinfo->err->msg_parm[0] = cc;
        (*cinfo->err->error_exit)(cinfo);
id_found:
        cinfo->cur_comp_info[i] = compptr;
        compptr->dc_tbl_no = (c >> 4) & 15;
        compptr->ac_tbl_no = c & 15;
        do {
            s32 *mp = cinfo->err->msg_parm;

            mp[0] = cc;
            mp[1] = compptr->dc_tbl_no;
            mp[2] = compptr->ac_tbl_no;
            cinfo->err->msg_code = 0x67;
            (*cinfo->err->emit_message)(cinfo, 1);
        } while (0);
    }
    INPUT_BYTE(cinfo, c, return 0);
    cinfo->Ss = c;
    INPUT_BYTE(cinfo, c, return 0);
    cinfo->Se = c;
    INPUT_BYTE(cinfo, c, return 0);
    cinfo->Ah = (c >> 4) & 15;
    cinfo->Al = c & 15;
    do {
        s32 *mp = cinfo->err->msg_parm;

        mp[0] = cinfo->Ss;
        mp[1] = cinfo->Se;
        mp[2] = cinfo->Ah;
        mp[3] = cinfo->Al;
        cinfo->err->msg_code = 0x68;
        (*cinfo->err->emit_message)(cinfo, 1);
    } while (0);
    cinfo->marker->next_restart_num = 0;
    cinfo->input_scan_number++;
    INPUT_SYNC(cinfo);
    return 1;
}
