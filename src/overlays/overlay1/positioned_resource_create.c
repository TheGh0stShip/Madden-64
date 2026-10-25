#include "types.h"

typedef struct ResourceDescriptor {
    u32 value10;
    u16 value14;
    u16 value16;
    u16 value18;
    u8 pad1A[2];
    u32 value1C;
    u32 value20;
    u8 pad24[4];
    u32 value28;
    u8 pad2C[8];
} ResourceDescriptor;

typedef struct PositionedResource {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} PositionedResource;

extern void *D_80087A64;
extern PositionedResource *func_8000D740(void *pool, s32 type, ResourceDescriptor *descriptor);
extern void func_80016FE4(PositionedResource *resource);

PositionedResource *positioned_resource_create(u16 x, u16 y, u16 value)
{
    ResourceDescriptor descriptor;
    PositionedResource *resource;

    descriptor.value1C = 0;
    descriptor.value14 = 1;
    descriptor.value10 = value;
    descriptor.value16 = 0;
    descriptor.value18 = 0;
    descriptor.value20 = 0;
    descriptor.value28 = 0;
    resource = func_8000D740(D_80087A64, 0, &descriptor);
    func_80016FE4(resource);
    resource->x = x + 0xC;
    resource->y = y + 0xC;
    return resource;
}
