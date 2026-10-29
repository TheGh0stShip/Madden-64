#include "types.h"

typedef struct Overlay5DataRecord {
    u8 identifier[4];
    s32 size;
    s32 checksum;
    u8 data[1];
} Overlay5DataRecord;

s32 func_8002E108(void *left, void *right, s32 size);

Overlay5DataRecord *overlay5_data_record_find(
    Overlay5DataRecord *collection,
    void *identifier
) {
    Overlay5DataRecord *record;
    Overlay5DataRecord *end;
    Overlay5DataRecord *result;
    s32 size;

    record = (Overlay5DataRecord *)((u8 *)collection + 0xC);
    size = collection->size - 0xC;
    end = (Overlay5DataRecord *)((u8 *)collection + size);
    result = 0;
    while ((result == 0) && (record < end)) {
        if (func_8002E108(record, identifier, 4) == 0) {
            result = record;
        } else {
            record = (Overlay5DataRecord *)((u8 *)record + record->size);
        }
    }
    return result;
}
