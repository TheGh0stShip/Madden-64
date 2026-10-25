#include "types.h"

typedef struct LinkedObject {
    u8 pad00[0x14];
    u32 flags;
    u8 pad18[0x30];
    void *resource;
    struct LinkedObject *next;
    struct LinkedObject *previous;
} LinkedObject;

typedef struct Resource {
    u8 pad00[0x14];
    s16 state;
} Resource;

extern LinkedObject *D_80087940;
extern void *D_800726D0;
extern Resource *func_80033298(void *pool);

void linked_object_prepend(LinkedObject *object)
{
    Resource *resource;

    object->next = 0;
    object->flags |= 0x100;
    if (D_80087940 != 0) {
        D_80087940->next = object;
    }
    object->previous = D_80087940;
    D_80087940 = object;
    resource = func_80033298(D_800726D0);
    object->resource = resource;
    resource->state = 0;
}
