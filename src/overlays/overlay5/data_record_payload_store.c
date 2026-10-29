#include "types.h"

typedef struct Overlay5DataRecord {
    u8 identifier[4];
    s32 size;
    s32 checksum;
    u8 data[1];
} Overlay5DataRecord;

extern void *D_80084F28;

Overlay5DataRecord *func_800E24EC(void *collection, void *identifier);
void func_8004DF68(void *destination, void *source, s32 size);
s32 func_800E24A0(u8 *data, s32 size);

s32 overlay5_data_record_payload_store(
    void *identifier,
    void *source
) {
    Overlay5DataRecord *record;
    u8 *data;
    s32 size;

    record = func_800E24EC(D_80084F28, identifier);
    if (record != 0) {
        data = record->data;
        size = record->size - 0xC;
        func_8004DF68(data, source, size);
        record->checksum = func_800E24A0(data, size);
        return -1;
    }
    return 0;
}
