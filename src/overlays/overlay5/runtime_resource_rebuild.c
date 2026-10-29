#include "types.h"

typedef struct RuntimeNodeSource {
    u32 value;
    u16 type;
    u8 first;
    u8 second;
} RuntimeNodeSource;

typedef struct RuntimeListNode {
    u8 pad00[0x14];
    u16 type;
    u8 first;
    u8 second;
} RuntimeListNode;

typedef struct RuntimeState {
    u8 pad00[0x84];
    u32 value;
    u8 pad88[0x10];
    RuntimeListNode *resource;
} RuntimeState;

extern RuntimeState *D_80072380;

void func_800E0D30(RuntimeListNode *resource);
void *func_800E0BB4(void *context);
RuntimeListNode *func_800E0C60(RuntimeNodeSource *source, void *owner);

void overlay5_runtime_resource_rebuild(void *context) {
    RuntimeNodeSource source;
    void *owner;

    if (D_80072380->resource != 0) {
        source.value = D_80072380->value;
        source.type = D_80072380->resource->type;
        source.first = D_80072380->resource->first;
        source.second = D_80072380->resource->second;
        func_800E0D30(D_80072380->resource);
        owner = func_800E0BB4(context);
        D_80072380->resource = func_800E0C60(&source, owner);
    } else {
        func_800E0BB4(context);
    }
}
