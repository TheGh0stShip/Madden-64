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
    register u32 i __asm__("$5");
    register u32 offset __asm__("$6");
    register u32* first __asm__("$2");
    register u32 count __asm__("$3");
    volatile u64 unused;

    first = (u32*)owner->records;
    i = 0;
    count = owner->records->count;
    offset = owner->offset;
    first++;
    if (count != 0) {
        register u32* value __asm__("$3");

        value = first;
        do {
            *value += offset;
            i++;
            value++;
        } while (i < owner->records->count);
    }
}
