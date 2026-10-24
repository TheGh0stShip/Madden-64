#include "types.h"

typedef struct Dimensions {
    u8 pad0[0xC];
    u16 width;
    u16 height;
} Dimensions;

typedef struct Resource {
    u8 pad0[4];
    void* destination;
    u8 pad8[4];
    Dimensions* dimensions;
} Resource;

typedef struct Source {
    u8 pad0[8];
    void** object;
} Source;

extern void func_8002E17C(void* object, void* destination, s32 size);

void func_8001A914(Resource* resource, Source* source) {
    s32 size = resource->dimensions->width * resource->dimensions->height;

    func_8002E17C(source->object[1], resource->destination, size);
}
