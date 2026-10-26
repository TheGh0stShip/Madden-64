#include "types.h"

extern s8 *D_80073470[];

s8 audio_range_value_get(s16 group, s16 value)
{
    s8 *first = D_80073470[group];
    s16 offset = 0;

    if (first[0] != 0) {
        s8 *table = first;
        do {
            s8 *entry = table + offset;
            if (value >= entry[0] && value <= entry[1]) {
                break;
            }
            offset += 2;
        } while (table[offset] != 0);
    }
    return D_80073470[group][offset];
}
