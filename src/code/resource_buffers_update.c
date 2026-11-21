#include "types.h"

typedef struct ResourceInput {
    volatile u16 flags;
    u16 pad2;
    u32 first;
    u32 second;
    u8 padC[4];
    u16 count;
} ResourceInput;

typedef struct ResourceData {
    void *first;
    void *second;
    u16 flags;
    u16 fieldA;
    u16 fieldC;
    u16 fieldE;
    void *record;
    s32 index;
    void *handle;
    u16 count;
    u16 pad1E;
    void *first_copy;
    void *global_copy;
    void *global_words;
    void *first_words;
} ResourceData;

typedef struct Resource {
    u8 pad0[8];
    ResourceData *data;
    u8 padC[8];
    s32 active;
    u8 pad18[4];
    void *field1C;
    void *field20;
    void *field24;
} Resource;

extern u8 *volatile D_80069294;
extern s32 D_800692AC;
extern s32 *D_80069298;
extern Resource *D_8007947C[];

void *object_children_create();
void resource_buffers_allocate(Resource *, ResourceData *);
void *memory_pool_range_take(s32, u32);
void func_80033308(s32, void *, u32, s32);

static inline u8 *resolve(u32 offset) {
    return (u8 *)(*(u32 *)((offset & 0xFFFC) + (u32)D_80069294) + (u32)D_80069294);
}

void resource_buffers_update(Resource *resource, ResourceInput *input) {
    ResourceData *data = resource->data;
    u32 size;
    s32 count;

    data->flags = input->flags;
    data->first = (void *)input->first;
    data->second = (void *)input->second;
    data->record = resolve(input->flags);
    data->index = D_800692AC;
    D_8007947C[D_800692AC++] = resource;
    resource->active = 1;
    data->fieldA = 0;
    data->handle = object_children_create(0, 0, 0);
    data->count = input->count + 2;
    resource_buffers_allocate(resource, data);
    if (D_80069298 ) {
        count = *D_80069298;
        size = count + 1;
        data->global_copy = memory_pool_range_take(0, size);
        func_80033308(0, data->global_copy, size, 0);
        size *= 4;
        data->global_words = memory_pool_range_take(0, size);
        func_80033308(0, data->global_words, size, 0);
        *(s32 *)data->global_words = count;
    } else {
        data->global_copy = 0;
        data->global_words = 0;
    }
    if (data->first ) {
        count = *(s32 *)data->first;
        size = count + 1;
        data->first_copy = memory_pool_range_take(0, size);
        func_80033308(0, data->first_copy, size, 0);
        size *= 4;
        data->first_words = memory_pool_range_take(0, size);
        func_80033308(0, data->first_words, size, 0);
        *(s32 *)data->first_words = count;
    } else {
        data->first_copy = 0;
        data->first_words = 0;
    }
    resource->field24 = 0;
    resource->field20 = 0;
    resource->field1C = 0;
    data->fieldE = 0;
    data->fieldC = 0;
}
