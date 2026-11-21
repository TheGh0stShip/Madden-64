#include "types.h"

typedef struct {
    u8 unk_00;
    u8 unk_01;
    u16 entries[1];
} EncodedStream;

u16 encoded_stream_weight_sum(EncodedStream *stream, u32 value) {
    u32 total = 0;
    s32 index = (u8)value >> 8;
    u16 entry;

    if (value == 0) {
        value = stream->unk_00;
    }
    while ((s16)index >= 0) {
        entry = stream->entries[(s16)index];
        switch (entry & 0xC000) {
        case 0x8000:
            switch (entry & 0xFF00) {
            case 0x8100:
            case 0x8400:
            case 0xBF00:
                index = -1;
                break;
            }
            break;
        case 0x4000:
            break;
        case 0xC000:
            value = entry & 0x3FFF;
            index++;
            break;
        default:
            index++;
            total += (u16)value;
            break;
        }
    }
    return total;
}
