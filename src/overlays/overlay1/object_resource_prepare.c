#include "types.h"

typedef struct PreparedResource {
    u8 pad00[0x14];
    u32 flags;
} PreparedResource;

typedef struct PreparedOwner {
    u8 pad00[0x24];
    PreparedResource *resource;
    u8 pad28[4];
    s32 value2C;
} PreparedOwner;

extern void func_80034388(PreparedResource *resource);

s32 object_resource_prepare(PreparedOwner *owner, s32 value)
{
    if (owner->resource->flags & 0x10000) {
        return 0;
    }
    owner->resource->flags &= 0xFFC3FFFF;
    owner->value2C = value;
    func_80034388(owner->resource);
    owner->resource->flags &= 0xFFFDFFFF;
    return 1;
}
