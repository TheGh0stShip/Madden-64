#include "types.h"

typedef struct AudioFieldEntry {
    u32 value;
    s8 field4;
    u8 pad5[3];
} AudioFieldEntry;

extern AudioFieldEntry D_80073E24[];
typedef struct AudioRangeEntry {
    u8 minimum;
    u8 maximum;
    u8 pad2[2];
} AudioRangeEntry;
extern AudioRangeEntry D_800740A4[];

s32 audio_record_field_get(u8 *record, u16 selector)
{
    s32 result = 11;
    s16 index;
    u32 value;

    switch (selector) {
    case 0:
        result = D_80073E24[record[2]].field4;
        break;
    case 1:
        result = D_80073E24[record[2]].value;
        break;
    case 2:
        result = *(u16 *)record;
        break;
    case 3:
        result = record[3];
        break;
    case 4:
        index = 0;
        value = record[2];
        while (index < 6) {
            if (value >= D_800740A4[index].minimum &&
                value <= D_800740A4[index].maximum) {
                break;
            }
            index++;
        }
        result = index;
        break;
    }
    return result;
}
