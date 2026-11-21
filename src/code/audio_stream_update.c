#include "types.h"

typedef struct StreamEntry {
    u8 pad0[0xD];
    u8 unkD;
    u8 padE[0x28 - 0xE];
} StreamEntry;

s16 audio_range_value_get(s16, s16);

s16 audio_stream_update(u16 *ids, StreamEntry *entries, s16 range, s16 start) {
    s16 v;
    s16 i;

    v = start + 1;
    do {
        if (audio_range_value_get(range, v) != 0) {
            if (ids != 0) {
                for (i = 0; i < 0x37; i++) {
                    if (ids[i] != 0xFFFF && entries[i].unkD == v) {
                        break;
                    }
                }
                if (i == 0x37) {
                    return v;
                }
            } else {
                return v;
            }
        }
        v++;
        if (v >= 100) {
            v = 1;
        }
    } while (v != start + 1);
    v++;
    if (v >= 100) {
        v = 1;
    }
    do {
        for (i = 0; i < 0x37; i++) {
            if (ids[i] != 0xFFFF && entries[i].unkD == v) {
                break;
            }
        }
        if (i == 0x37) {
            return v;
        }
        v++;
        if (v >= 100) {
            v = 1;
        }
    } while (v != start + 1);
    return v;
}
