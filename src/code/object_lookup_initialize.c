#include "types.h"

typedef struct {
    s32 unk_00;
    s32 unk_04;
    s32 unk_08;
    s32 unk_0C;
    s32 unk_10;
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C;
} LookupRecord;

typedef struct {
    s32 unk_00;
    void (*emit)(void *object, s32 level);
    u8 unk_08[0xC];
    s32 code;
    s32 param;
} ErrorManager;

typedef struct {
    void *(*alloc)(void *object, s32 pool, s32 size);
} MemoryManager;

typedef struct {
    ErrorManager *err;
    MemoryManager *mem;
    u8 unk_08[0x7C];
    s32 count;
} LookupObject;

extern void object_index_stream_decode(LookupObject *object, LookupRecord *records);
extern s32 object_lookup_finalize(LookupObject *object, LookupRecord *records, s32 first, s32 count);
extern void object_lookup_process(LookupObject *object, LookupRecord *record, s32 index);

void object_lookup_initialize(LookupObject *object, s32 count)
{
    LookupRecord *records;
    s32 i;
    s32 n;

    records = object->mem->alloc(object, 1, count * sizeof(LookupRecord));
    records[0].unk_00 = 0;
    records[0].unk_04 = 0x1F;
    records[0].unk_08 = 0;
    records[0].unk_0C = 0x3F;
    records[0].unk_10 = 0;
    records[0].unk_14 = 0x1F;
    object_index_stream_decode(object, records);
    n = object_lookup_finalize(object, records, 1, count);
    for (i = 0; i < n; i++) {
        object_lookup_process(object, &records[i], i);
    }
    object->count = n;
    object->err->code = 0x5F;
    object->err->param = n;
    object->err->emit(object, 1);
}
