#include "types.h"

typedef struct Overlay5ProcessResource {
    void *storage;
    u8 pad04[0x18];
    u8 state;
} Overlay5ProcessResource;

typedef struct Overlay5ProcessOwner {
    u8 pad00[0xC];
    Overlay5ProcessResource *resource;
} Overlay5ProcessOwner;

typedef struct Overlay5ProcessRecord {
    u8 pad00[0xC];
    u8 kind;
} Overlay5ProcessRecord;

void func_80033258(void *storage);
void func_800DF19C(
    Overlay5ProcessOwner *owner,
    Overlay5ProcessRecord *record,
    u8 kind,
    u8 kind_copy,
    s32 flags
);
void func_800DB478(u8 *state);

void overlay5_resource_record_process(
    Overlay5ProcessOwner *owner,
    Overlay5ProcessRecord *record
) {
    Overlay5ProcessResource *resource;
    u8 kind;

    resource = owner->resource;
    func_80033258(resource->storage);
    kind = record->kind;
    func_800DF19C(owner, record, kind, kind, 0);
    func_800DB478(&resource->state);
}
