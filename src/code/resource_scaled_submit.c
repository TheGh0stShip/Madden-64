#include "types.h"

typedef struct ResourceImage {
    u8 pad0[0x1A];
    s16 width;
    s16 height;
} ResourceImage;

typedef struct ResourceHandle {
    u8 pad0[8];
    ResourceImage* image;
} ResourceHandle;

extern void func_80033308(s32 first, s32 destination, s32 size, s32 fourth);

void func_8001A9E4(s32 destination, ResourceHandle* handle, s32 scale) {
    ResourceImage* image = handle->image;
    u16 size = (image->width * image->height) / 2;

    func_80033308(0, destination + size * scale, size, 0);
}
