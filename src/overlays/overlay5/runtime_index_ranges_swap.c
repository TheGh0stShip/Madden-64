#include "types.h"

typedef struct RuntimeIndexData {
    u8 pad00[0x20];
    u8 *flags;
    u8 pad24[8];
    u32 *values;
} RuntimeIndexData;

typedef struct RuntimeIndexOwner {
    u8 pad00[8];
    RuntimeIndexData *data;
} RuntimeIndexOwner;

void overlay5_runtime_index_ranges_swap(
    RuntimeIndexOwner *owner,
    s32 first,
    s32 second,
    u32 count,
    s32 stride
) {
    RuntimeIndexData *data;
    u32 value;
    u8 flag;
    u32 index;

    data = owner->data;
    for (index = 0; index < count; index++) {
        value = data->values[second];
        data->values[second] = data->values[first];
        data->values[first] = value;
        flag = data->flags[second];
        data->flags[second] = data->flags[first] | 0x40;
        data->flags[first] = flag | 0x40;
        second += stride;
        first += stride;
    }
}
