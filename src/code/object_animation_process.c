#include "types.h"

/* IJG libjpeg jdmarker.c get_sof(): process a SOFn (start of frame) marker. */

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
    s32 component_index;
    s32 h_samp_factor;
    s32 v_samp_factor;
    s32 quant_tbl_no;
    s32 dc_tbl_no;
    s32 ac_tbl_no;
    u8 pad1C[0x54 - 0x1C];
} JpegComponent;

typedef struct {
    void *(*alloc_small)(JpegDecompress *cinfo, s32 pool_id, u32 sizeofobject);
} JpegMemory;

struct JpegDecompress {
    JpegError *err;
    JpegMemory *mem;
    u8 pad08[0x14 - 0x8];
    JpegSource *src;
    u32 image_width;
    u32 image_height;
    s32 num_components;
    u8 pad24[0x90 - 0x24];
    s32 input_scan_number;
    u8 pad94[0xD4 - 0x94];
    s32 data_precision;
    JpegComponent *comp_info;
    s32 progressive_mode;
    s32 arith_code;
    u8 padE4[0x114 - 0xE4];
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

s32 object_animation_process(JpegDecompress *cinfo, s32 is_prog, s32 is_arith) {
    s32 length;
    s32 c;
    s32 ci;
    JpegComponent *compptr;
    JpegSource *datasrc = cinfo->src;
    u8 *next_input_byte = datasrc->next_input_byte;
    s32 bytes_in_buffer = datasrc->bytes_in_buffer;

    cinfo->progressive_mode = is_prog;
    cinfo->arith_code = is_arith;
    INPUT_2BYTES(cinfo, length, return 0);
    INPUT_BYTE(cinfo, cinfo->data_precision, return 0);
    INPUT_2BYTES(cinfo, cinfo->image_height, return 0);
    INPUT_2BYTES(cinfo, cinfo->image_width, return 0);
    INPUT_BYTE(cinfo, cinfo->num_components, return 0);
    length -= 8;
    do {
        s32 *mp = cinfo->err->msg_parm;

        mp[0] = cinfo->unread_marker;
        mp[1] = cinfo->image_width;
        mp[2] = cinfo->image_height;
        mp[3] = cinfo->num_components;
        cinfo->err->msg_code = 0x63;
        (*cinfo->err->emit_message)(cinfo, 1);
    } while (0);
    if (cinfo->marker->saw_SOF) {
        cinfo->err->msg_code = 0x39;
        (*cinfo->err->error_exit)(cinfo);
    }
    if (cinfo->image_height <= 0 || cinfo->image_width <= 0 || cinfo->num_components <= 0) {
        cinfo->err->msg_code = 0x1F;
        (*cinfo->err->error_exit)(cinfo);
    }
    if (length != cinfo->num_components * 3) {
        cinfo->err->msg_code = 9;
        (*cinfo->err->error_exit)(cinfo);
    }
    if (cinfo->comp_info == 0) {
        cinfo->comp_info = (*cinfo->mem->alloc_small)(cinfo, 1, cinfo->num_components * sizeof(JpegComponent));
    }
    for (ci = 0, compptr = cinfo->comp_info; ci < cinfo->num_components; ci++, compptr++) {
        compptr->component_index = ci;
        INPUT_BYTE(cinfo, compptr->component_id, return 0);
        INPUT_BYTE(cinfo, c, return 0);
        compptr->h_samp_factor = (c >> 4) & 15;
        compptr->v_samp_factor = c & 15;
        INPUT_BYTE(cinfo, compptr->quant_tbl_no, return 0);
        do {
            s32 *mp = cinfo->err->msg_parm;

            mp[0] = compptr->component_id;
            mp[1] = compptr->h_samp_factor;
            mp[2] = compptr->v_samp_factor;
            mp[3] = compptr->quant_tbl_no;
            cinfo->err->msg_code = 0x64;
            (*cinfo->err->emit_message)(cinfo, 1);
        } while (0);
    }
    cinfo->marker->saw_SOF = 1;
    INPUT_SYNC(cinfo);
    return 1;
}
