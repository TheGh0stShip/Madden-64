#include "types.h"

/* IJG libjpeg jdmarker.c get_app0(): process an APP0 (JFIF) marker. */

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
    void (*skip_input_data)(JpegDecompress *cinfo, s32 num_bytes);
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
    s32 saw_JFIF_marker;
    u8 density_unit;
    u8 pad11D;
    u16 X_density;
    u16 Y_density;
    u8 pad122[0x124 - 0x122];
    s32 saw_Adobe_marker;
    u8 Adobe_transform;
    u8 pad129[0x144 - 0x129];
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

s32 object_animation_advance(JpegDecompress *cinfo) {
    s32 length;
    u8 b[14];
    s32 buffp;
    JpegSource *datasrc = cinfo->src;
    u8 *next_input_byte = datasrc->next_input_byte;
    s32 bytes_in_buffer = datasrc->bytes_in_buffer;

    INPUT_2BYTES(cinfo, length, return 0);
    length -= 2;
    if (length >= 14) {
        for (buffp = 0; buffp < 14; buffp++) {
            INPUT_BYTE(cinfo, b[buffp], return 0);
        }
        length -= 14;
        if (b[0] == 0x4A && b[1] == 0x46 && b[2] == 0x49 && b[3] == 0x46 && b[4] == 0) {
            if (b[5] != 1) {
                (cinfo->err->msg_code = 0x73, cinfo->err->msg_parm[0] = b[5], cinfo->err->msg_parm[1] = b[6],
                 (*cinfo->err->emit_message)(cinfo, -1));
            } else if (b[6] > 2) {
                (cinfo->err->msg_code = 0x58, cinfo->err->msg_parm[0] = b[5], cinfo->err->msg_parm[1] = b[6],
                 (*cinfo->err->emit_message)(cinfo, 1));
            }
            cinfo->saw_JFIF_marker = 1;
            cinfo->density_unit = b[7];
            cinfo->X_density = (b[8] << 8) + b[9];
            cinfo->Y_density = (b[10] << 8) + b[11];
            do {
                s32 *mp = cinfo->err->msg_parm;

                mp[0] = cinfo->X_density;
                mp[1] = cinfo->Y_density;
                mp[2] = cinfo->density_unit;
                cinfo->err->msg_code = 0x56;
                (*cinfo->err->emit_message)(cinfo, 1);
            } while (0);
            if (b[12] | b[13]) {
                (cinfo->err->msg_code = 0x59, cinfo->err->msg_parm[0] = b[12], cinfo->err->msg_parm[1] = b[13],
                 (*cinfo->err->emit_message)(cinfo, 1));
            }
            if (length != (s32)b[12] * (s32)b[13] * 3) {
                (cinfo->err->msg_code = 0x57, cinfo->err->msg_parm[0] = length, (*cinfo->err->emit_message)(cinfo, 1));
            }
        } else {
            (cinfo->err->msg_code = 0x4C, cinfo->err->msg_parm[0] = length + 14, (*cinfo->err->emit_message)(cinfo, 1));
        }
    } else {
        (cinfo->err->msg_code = 0x4C, cinfo->err->msg_parm[0] = length, (*cinfo->err->emit_message)(cinfo, 1));
    }
    INPUT_SYNC(cinfo);
    if (length > 0) {
        (*cinfo->src->skip_input_data)(cinfo, length);
    }
    return 1;
}
