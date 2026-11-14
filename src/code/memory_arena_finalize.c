#include "types.h"

typedef struct ArenaStream {
    u8 pad00[4];
    u16 *codes;
    u16 index;
} ArenaStream;

s16 memory_arena_finalize(ArenaStream *stream)
{
    s32 result = -1;
    s16 index;

    if (stream->codes == 0) {
        return -1;
    }
    index = stream->index;
    do {
        s32 code = stream->codes[index + 1];
        s32 kind = code & 0xC000;
        switch (kind) {
        case 0x4000:
            goto handled;
        case 0x8000:
            goto handle_8000;
        case 0xC000:
            goto increment;
        default:
            result = code;
            goto handled;
        }
handle_8000:
        switch (code & 0xFF00) {
            case 0x8100:
                index = code & 0xFF;
                goto handled;
            case 0x8200:
            case 0x8400:
            case 0x8500:
            case 0x8600:
            case 0x8700:
            case 0x9200:
                goto increment;
            case 0x9100:
                index++;
                goto increment;
            case 0xBE00:
            case 0xBF00:
                index = -1;
                goto handled;
        }
        goto handled;
increment:
        index++;
handled:
        ;
    } while (index != -1 && (s16)result == -1);
    return result;
}
