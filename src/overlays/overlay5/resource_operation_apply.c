#include "types.h"

typedef struct Overlay5OperationNested {
    u8 pad00[0xB];
    u8 count;
} Overlay5OperationNested;

typedef struct Overlay5OperationResource {
    u8 pad00[4];
    Overlay5OperationNested *nested;
    u8 pad08[0x14];
    u8 state;
} Overlay5OperationResource;

typedef struct Overlay5OperationOwner {
    u8 pad00[0xC];
    Overlay5OperationResource *resource;
} Overlay5OperationOwner;

void func_800DFF4C(Overlay5OperationOwner *owner);
s32 func_800DFB98(Overlay5OperationOwner *owner, void *argument);
void func_800DB478(u8 *state);

s32 overlay5_resource_operation_apply(
    Overlay5OperationOwner *owner,
    void *argument,
    s32 flags
) {
    Overlay5OperationResource *resource;
    s32 result;

    resource = owner->resource;
    if (flags & 1) {
        resource->nested->count++;
    }
    func_800DFF4C(owner);
    result = func_800DFB98(owner, argument);
    func_800DB478(&resource->state);
    return result;
}
