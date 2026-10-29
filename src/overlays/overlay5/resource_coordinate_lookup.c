#include "types.h"

typedef struct Overlay5LookupConfig {
    u8 pad00[4];
    void *coordinate_owner;
    u8 pad08;
    u8 first_index;
} Overlay5LookupConfig;

typedef struct Overlay5LookupResource {
    u8 pad00[4];
    Overlay5LookupConfig *config;
    u8 pad08[0x14];
    u8 state;
} Overlay5LookupResource;

typedef struct Overlay5LookupOwner {
    u8 pad00[0xC];
    Overlay5LookupResource *resource;
} Overlay5LookupOwner;

void func_800DB44C(u8 *state, s32 *first, s32 *second, s32 *third);
void func_8001F070(void *owner, s32 index, void *output);

void overlay5_resource_coordinate_lookup(
    Overlay5LookupOwner *owner,
    void *output
) {
    Overlay5LookupResource *resource;
    s32 first;
    s32 second;

    resource = owner->resource;
    func_800DB44C(&resource->state, &first, &second, &second);
    func_8001F070(
        resource->config->coordinate_owner,
        resource->config->first_index + first,
        output
    );
}
