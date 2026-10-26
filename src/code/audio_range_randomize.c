#include "types.h"

typedef struct AudioRangeEntry {
    u8 lower;
    u8 upper;
    u8 random_lower;
    u8 random_upper;
} AudioRangeEntry;

typedef struct AudioRangeTarget {
    u8 unused[2];
    u8 value;
    u8 result;
} AudioRangeTarget;

extern AudioRangeEntry D_800740A4[];
extern u32 func_80031A1C(u16 range);

void audio_range_randomize(AudioRangeTarget *target)
{
    s16 i = 0;
    u8 value = target->value;

    while (i < 6) {
        if (value >= D_800740A4[i].lower && value <= D_800740A4[i].upper) {
            break;
        }
        i++;
    }

    if (D_800740A4[i].random_lower == D_800740A4[i].random_upper) {
        target->result = D_800740A4[i].random_lower;
    } else {
        target->result = D_800740A4[i].random_lower +
                         func_80031A1C(D_800740A4[i].random_upper -
                                      D_800740A4[i].random_lower);
    }
}
