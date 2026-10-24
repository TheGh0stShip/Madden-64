#include "types.h"

typedef struct ResourceImage {
    u8 pad0[4];
    void* data;
    u8 pad8[0x12];
    u16 width;
    s16 height;
} ResourceImage;

typedef struct ResourceHandle {
    u8 pad0[8];
    ResourceImage* image;
} ResourceHandle;

extern void func_8002E17C(void* source, void* destination, s32 size);

void func_8001A998(void* destination, ResourceHandle* handle, s32 scale) {
    ResourceImage* image = handle->image;
    u16 size = image->width * image->height;

    size >>= 1;

    func_8002E17C(image->data, (u8*)destination + size * scale, size);
}
