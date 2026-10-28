#include "types.h"

typedef struct OffsetRecords {
    u32 count;
    u32 values[1];
} OffsetRecords;

typedef struct OffsetRecordOwner {
    u8 pad[0x18];
    OffsetRecords* records;
    u32 offset;
} OffsetRecordOwner;

void func_800347B4(OffsetRecordOwner* owner) {
    u32 i;
    u32 offset;
    u32* first;
    u32 count;
    volatile u64 unused;

    i = 0;
    count = owner->records->count;
    first = (u32*)owner->records;
    offset = owner->offset;
    first++;
    if (count != 0) {
        u32* value;

        value = first;
        do {
            *value += offset;
            i++;
            value++;
        } while (i < owner->records->count);
    }
}
