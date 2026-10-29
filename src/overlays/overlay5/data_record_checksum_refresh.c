#include "types.h"

typedef struct Overlay5DataRecord {
    u8 identifier[4];
    s32 size;
    s32 checksum;
    u8 data[1];
} Overlay5DataRecord;

Overlay5DataRecord *func_800E24EC(void *collection, void *identifier);
s32 func_800E24A0(u8 *data, s32 size);

s32 overlay5_data_record_checksum_refresh(
    void *collection,
    void *identifier
) {
    Overlay5DataRecord *record;

    record = func_800E24EC(collection, identifier);
    if (record != 0) {
        record->checksum = func_800E24A0(record->data, record->size - 0xC);
        return -1;
    }
    return 0;
}
