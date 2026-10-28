#include "types.h"

typedef struct Overlay5ExtentRecord {
    u8 pad00[0xA];
    u16 first_base;
    u8 pad0C;
    u8 first_extra;
    u8 pad0E[0xC];
    u16 second_base;
    u8 pad1C;
    u8 second_extra;
} Overlay5ExtentRecord;

void overlay5_record_extents_get(
    Overlay5ExtentRecord *record,
    s32 *first_extra,
    s32 *first_extent,
    s32 *second_extent
) {
    *first_extra = record->first_extra;
    *first_extent = record->first_base + record->first_extra;
    *second_extent = record->second_base + record->second_extra;
}
