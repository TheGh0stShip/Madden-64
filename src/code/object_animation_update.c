#include "types.h"

/* IJG libjpeg jdmarker.c get_dht(): process a DHT (define Huffman table) marker. */

typedef struct JpegDecompress JpegDecompress;

typedef struct {
    void (*error_exit)(JpegDecompress *cinfo);
    void (*emit_message)(JpegDecompress *cinfo, s32 level);
    u8 pad08[0x14 - 0x8];
    s32 msg_code;
    s32 msg_parm[8];
    u8 pad38[0x68 - 0x38];
    s32 trace_level;
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

typedef struct {
    u16 quantval[64];
} JpegQuantTable;

typedef struct {
    u8 bits[17];
    u8 huffval[256];
    s32 sent_table;
} JpegHuffTable;

struct JpegDecompress {
    JpegError *err;
    u8 pad04[0x14 - 0x4];
    JpegSource *src;
    u8 pad18[0xA4 - 0x18];
    JpegQuantTable *quant_tbl_ptrs[4];
    JpegHuffTable *dc_huff_tbl_ptrs[4];
    JpegHuffTable *ac_huff_tbl_ptrs[4];
    u8 padD4[0x114 - 0xD4];
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

extern void *memcpy(void *dst, const void *src, u32 size);
extern JpegHuffTable *func_800633EC(JpegDecompress *cinfo); /* jpeg_alloc_huff_table */

s32 object_animation_update(JpegDecompress *cinfo) {
    s32 length;
    u8 bits[17];
    u8 huffval[256];
    s32 i;
    s32 index;
    s32 count;
    JpegHuffTable **htblptr;
    JpegSource *datasrc = cinfo->src;
    u8 *next_input_byte = datasrc->next_input_byte;
    s32 bytes_in_buffer = datasrc->bytes_in_buffer;

    INPUT_2BYTES(cinfo, length, return 0);
    length -= 2;
    while (length > 0) {
        INPUT_BYTE(cinfo, index, return 0);
        cinfo->err->msg_code = 0x4F;
        cinfo->err->msg_parm[0] = index;
        (*cinfo->err->emit_message)(cinfo, 1);
        bits[0] = 0;
        count = 0;
        for (i = 1; i <= 16; i++) {
            INPUT_BYTE(cinfo, bits[i], return 0);
            count += bits[i];
        }
        length -= 1 + 16;
        do {
            s32 *mp = cinfo->err->msg_parm;

            mp[0] = bits[1];
            mp[1] = bits[2];
            mp[2] = bits[3];
            mp[3] = bits[4];
            mp[4] = bits[5];
            mp[5] = bits[6];
            mp[6] = bits[7];
            mp[7] = bits[8];
            cinfo->err->msg_code = 0x55;
            (*cinfo->err->emit_message)(cinfo, 2);
        } while (0);
        do {
            s32 *mp = cinfo->err->msg_parm;

            mp[0] = bits[9];
            mp[1] = bits[10];
            mp[2] = bits[11];
            mp[3] = bits[12];
            mp[4] = bits[13];
            mp[5] = bits[14];
            mp[6] = bits[15];
            mp[7] = bits[16];
            cinfo->err->msg_code = 0x55;
            (*cinfo->err->emit_message)(cinfo, 2);
        } while (0);
        if (count > 256 || count > length) {
            cinfo->err->msg_code = 0x1C;
            (*cinfo->err->error_exit)(cinfo);
        }
        for (i = 0; i < count; i++) {
            INPUT_BYTE(cinfo, huffval[i], return 0);
        }
        length -= count;
        if (index & 0x10) {
            index -= 0x10;
            htblptr = &cinfo->ac_huff_tbl_ptrs[index];
        } else {
            htblptr = &cinfo->dc_huff_tbl_ptrs[index];
        }
        if (index < 0 || index >= 4) {
            cinfo->err->msg_code = 0x1D;
            cinfo->err->msg_parm[0] = index;
            (*cinfo->err->error_exit)(cinfo);
        }
        if (*htblptr == 0) {
            *htblptr = func_800633EC(cinfo);
        }
        memcpy((*htblptr)->bits, bits, sizeof((*htblptr)->bits));
        memcpy((*htblptr)->huffval, huffval, sizeof((*htblptr)->huffval));
    }
    INPUT_SYNC(cinfo);
    return 1;
}
