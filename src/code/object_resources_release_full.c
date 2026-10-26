#include "types.h"

typedef struct ResourceState {
    u8 pad00[8];
    u8 type;
    u8 pad09[3];
    void *first;
    void *second;
} ResourceState;

typedef struct ObjectState {
    u8 pad00[8];
    ResourceState *resource;
} ObjectState;

extern void *D_80065460;
extern void *D_8006545C;
extern void func_80032F3C(s32 pool, void *allocation);

void object_resources_release_full(ObjectState *object)
{
    ResourceState *resource = object->resource;
    s32 type;

    func_80032F3C(0, resource->first);
    func_80032F3C(0, resource->second);
    type = resource->type & 0x7F;
    if (type != 0) {
        goto type_check;
    }
    if (D_80065460 == 0) {
        goto done;
    }
    func_80032F3C(0, D_80065460);
    D_80065460 = 0;
    goto done;
type_check:
    if (type < 0) {
        goto done;
    }
    if (type >= 3) {
        goto done;
    }
    if (D_8006545C != 0) {
        func_80032F3C(0, D_8006545C);
        D_8006545C = 0;
    }
done:
    return;
}
