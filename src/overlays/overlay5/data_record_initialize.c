#include "types.h"

typedef struct Overlay5DataRecord {
    u8 identifier[4];
    s32 size;
    s32 checksum;
    u8 data[1];
} Overlay5DataRecord;

s32 func_800E24A0(u8 *data, s32 size);

Overlay5DataRecord *overlay5_data_record_initialize(
    Overlay5DataRecord *record,
    void *identifier,
    s32 size
) {
    __builtin_memcpy(record->identifier, identifier, 4);
    record->size = size;
    record->checksum = func_800E24A0(record->data, size - 0xC);
    return record;
}
