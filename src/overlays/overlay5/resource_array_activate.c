#include "types.h"

typedef struct ResourceArrayMeta {
    u8 pad00[0xB];
    u8 count;
} ResourceArrayMeta;

typedef struct ResourceArrayParent {
    u8 pad00[0xC];
    void *callback_data;
} ResourceArrayParent;

typedef struct ResourceArrayObject ResourceArrayObject;
typedef void (*ResourceArrayCallback)(
    ResourceArrayObject *object,
    void *callback_data,
    u8 index,
    void *context
);

struct ResourceArrayObject {
    u8 pad00[4];
    ResourceArrayMeta *meta;
    u8 pad08[4];
    ResourceArrayParent *parent;
    u8 pad10[8];
    ResourceArrayCallback callback;
    u8 pad1C[0x58];
    void **resources;
};

void func_8000DC08(void *resource);
void func_8000DC18(void *resource);

void overlay5_resource_array_activate(
    void *context,
    s32 index,
    ResourceArrayObject *object
) {
    ResourceArrayParent *parent;
    u8 i;

    parent = object->parent;
    if (object->resources != 0) {
        i = 0;
        if (object->meta->count != 0) {
            do {
                func_8000DC08(object->resources[i]);
                i++;
            } while (i < object->meta->count);
        }
        {
            u8 resource_index;

            resource_index = index;
            func_8000DC18(object->resources[resource_index]);
        }
    }
    if (object->callback != 0) {
        object->callback(
            object,
            parent->callback_data,
            (u8)index,
            context
        );
    }
}
