#include "types.h"

typedef struct ResourceItem {
    u8 pad00[8];
    u16 offset;
    u8 pad0A[6];
    u32 resolved;
} ResourceItem;

typedef struct ResourceEntry {
    u8 pad00[8];
    ResourceItem *item;
} ResourceEntry;

typedef struct ResourceContext {
    ResourceEntry **entries;
    u32 count;
    u32 value8;
    u32 valueC;
} ResourceContext;

typedef struct ResourceTable {
    ResourceEntry *entries[32];
} ResourceTable;

typedef struct ResourceState {
    u32 base;
    u32 value8;
    u32 valueC;
} ResourceState;

extern ResourceTable D_8007947C;
extern ResourceState D_80069294;
extern u32 D_800692AC;
extern void func_80032F3C(s32 zero, void *source);

void resource_context_load(ResourceContext *context)
{
    s32 i;
    ResourceItem *item;

    D_8007947C = *(ResourceTable *)context->entries;
    D_800692AC = context->count;
    D_80069294.value8 = context->value8;
    D_80069294.valueC = context->valueC;
    func_80032F3C(0, context->entries);
    func_80032F3C(0, context);
    if (D_800692AC != 0) {
        i = D_800692AC - 1;
        do {
            item = D_8007947C.entries[i]->item;
            item->resolved = *(u32 *)((item->offset & 0xFFFC) + D_80069294.base) + D_80069294.base;
        } while (i-- != 0);
    }
}
