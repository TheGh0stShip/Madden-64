#include "types.h"

typedef struct {
    u8 pad0[0x1E];
    u8 unk1E;
} AudioStream;

typedef struct {
    u8 unk0[2840][3];
    u8 pad[4];
} AudioTable;

extern u8 D_80074808;
extern AudioTable D_80081602[];

s16 audio_stream_configure(AudioStream *stream, u16 index, u16 mode, s16 value) {
    s32 level;

    if (D_80074808 == 1) {
        level = D_80081602[stream->unk1E].unk0[index][0];
        switch (mode) {
        case 4:
            level = 100 - level / 2;
            return value * level / 100;
        case 16:
            if (level >= 51) {
                return value / 2;
            }
            break;
        case 2:
            level = 100 - level * 3 / 2;
            if (level < 0) {
                level = 0;
            }
            return value * level / 100;
        case 3:
            return value - level * 3 / 2;
        default:
            level = 100 - level;
            return value * level / 100;
        case 13:
            break;
        }
    }
    return value;
}
