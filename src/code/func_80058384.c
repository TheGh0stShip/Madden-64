#include "types.h"

typedef struct DecodeObject DecodeObject;

typedef struct {
    s32 unk_00;
    void (*emit_message)(DecodeObject *cinfo, s32 msg_level);
    u8 unk_08[0xC];
    s32 msg_code;
    s32 msg_parm[2];
} ErrorManager;

typedef struct {
    u8 *next_input_byte;
    u32 bytes_in_buffer;
    void (*init_source)(DecodeObject *cinfo);
    s32 (*fill_input_buffer)(DecodeObject *cinfo);
    void (*skip_input_data)(DecodeObject *cinfo, s32 num_bytes);
} SourceManager;

struct DecodeObject {
    ErrorManager *err;
    u8 unk_04[0x10];
    SourceManager *src;
    u8 unk_18[0x184];
    s32 unread_marker;
};

s32 func_80058384(DecodeObject *cinfo)
{
    s32 length;
    SourceManager *datasrc = cinfo->src;
    u8 *next_input_byte = datasrc->next_input_byte;
    u32 bytes_in_buffer = datasrc->bytes_in_buffer;

    do {
        if (bytes_in_buffer == 0) {
            if (!datasrc->fill_input_buffer(cinfo)) {
                return 0;
            }
            next_input_byte = datasrc->next_input_byte;
            bytes_in_buffer = datasrc->bytes_in_buffer;
        }
        bytes_in_buffer--;
        length = ((u32)*next_input_byte++) << 8;
        if (bytes_in_buffer == 0) {
            if (!datasrc->fill_input_buffer(cinfo)) {
                return 0;
            }
            next_input_byte = datasrc->next_input_byte;
            bytes_in_buffer = datasrc->bytes_in_buffer;
        }
        bytes_in_buffer--;
        length += *next_input_byte++;
    } while (0);

    cinfo->err->msg_code = 0x5A;
    cinfo->err->msg_parm[0] = cinfo->unread_marker;
    cinfo->err->msg_parm[1] = length;
    cinfo->err->emit_message(cinfo, 1);

    datasrc->next_input_byte = next_input_byte;
    datasrc->bytes_in_buffer = bytes_in_buffer;
    cinfo->src->skip_input_data(cinfo, length - 2);
    return 1;
}
