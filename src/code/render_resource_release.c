#include "types.h"

typedef struct RenderResourceHeader {
    u8 pad0[4];
    u16 flags;
} RenderResourceHeader;

typedef struct RenderResource {
    u16 owner;
    u16 index;
    RenderResourceHeader* header;
    u8 pad8[4];
    void* allocation;
    u8 pad10[0x98];
    u16 flags;
} RenderResource;

typedef struct RenderResourceOwner {
    u8 pad0[8];
    RenderResource* resource;
} RenderResourceOwner;

extern void func_80032F3C(s32 type, void* allocation);
extern void func_80035F88(u16 owner, u16 index);

void func_8000E788(RenderResourceOwner* owner) {
    RenderResource* resource = owner->resource;

    if (resource->header->flags & 8) {
        func_80032F3C(0, resource->allocation);
    }
    if (!(resource->flags & 2)) {
        func_80035F88(resource->owner, resource->index);
    }
}
