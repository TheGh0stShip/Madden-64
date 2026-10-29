#include "types.h"

typedef struct Overlay5DataRecord {
    u8 identifier[4];
    s32 size;
    s32 checksum;
    u8 data[1];
} Overlay5DataRecord;

extern void *D_80084F28;

Overlay5DataRecord *func_800E24EC(void *collection, void *identifier);
s32 func_800E24A0(u8 *data, s32 size);
void func_8002E58C(void *data, s32 value, s32 size);
void func_8004DF68(void *destination, void *source, s32 size);

s32 overlay5_data_record_copy_verified(
    void *identifier,
    void *destination
) {
    Overlay5DataRecord *record;
    u8 *data;
    s32 size;
    s32 checksum;
    s32 result;

    record = func_800E24EC(D_80084F28, identifier);
    if (record != 0) {
        data = record->data;
        checksum = record->checksum;
        size = record->size - 0xC;
        if (checksum != func_800E24A0(data, size)) {
            func_8002E58C(data, 0, size);
            record->checksum = func_800E24A0(data, size);
        }
        func_8004DF68(destination, data, size);
        result = -1;
    } else {
        result = 0;
    }
    return result;
}
