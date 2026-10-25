#include "types.h"

typedef struct PackedRecord10 {
    s32 first;
    s32 second;
    s16 third;
} __attribute__((packed, aligned(2))) PackedRecord10;

typedef struct RecordOwner {
    u8 pad00[0x48];
    PackedRecord10 *records;
} RecordOwner;

extern void func_800B9758(RecordOwner *owner, s32 slot);

void record_slot_secondary_set(RecordOwner *owner, const PackedRecord10 *source_record)
{
    owner->records[1] = *source_record;
    func_800B9758(owner, 2);
}
