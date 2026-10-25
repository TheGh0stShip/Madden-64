#include "types.h"

typedef struct RangeStatistics {
    u8 count;
    u8 indices[11];
    u16 values[11];
    u8 pad22[2];
    u16 total;
} RangeStatistics;

void range_statistics_update(RangeStatistics *statistics)
{
    u32 i;
    u16 total = 0;
    u16 minimum = 0xFF;
    u16 maximum = 0;
    u8 minimum_index = statistics->indices[0];
    u8 maximum_index = statistics->indices[0];

    for (i = 0; i < statistics->count; i++) {
        u16 value = statistics->values[i];
        total += value;
        if (minimum >= value) {
            minimum = value;
            maximum_index = statistics->indices[i];
        }
        if (value >= maximum) {
            maximum = value;
            minimum_index = statistics->indices[i];
        }
    }
    statistics->total = total;
    statistics->indices[0x21] = minimum_index;
    statistics->indices[0x22] = maximum_index;
}
