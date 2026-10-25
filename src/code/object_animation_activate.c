#include "types.h"

typedef void (*ObjectCall)(void *owner);

void object_animation_activate(u8 *owner)
{
    u8 *state = *(u8 **)(owner + 0x1A0);

    if (*(s32 *)(owner + 0x10) != 0xCF) {
        u32 *methods = *(u32 **)owner;

        methods[5] = 0x12;
        (*(u32 **)owner)[6] = *(u32 *)(owner + 0x10);
        ((ObjectCall)(*(u32 **)owner)[0])(owner);
    }
    if (*(u32 *)(owner + 0x54) != 0 && *(u32 *)(owner + 0x68) != 0 &&
        *(u32 *)(owner + 0x88) != 0) {
        u8 *animation = *(u8 **)(state + 0x18);

        *(u8 **)(owner + 0x1C8) = animation;
        (*(ObjectCall *)(animation + 0x0C))(owner);
        *(u32 *)(state + 8) = 0;
    } else {
        (*(u32 **)owner)[5] = 0x2D;
        ((ObjectCall)(*(u32 **)owner)[0])(owner);
    }
}
