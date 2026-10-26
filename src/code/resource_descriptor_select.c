#include "types.h"

extern u8 *D_80088630;
extern u8 *D_80069AB8;
extern u8 *D_80069A88;
extern void func_80034E58(void *resource, s32 value);
extern void func_80034164(void *descriptor, void *owner);

void resource_descriptor_select(u8 *owner, u32 selector)
{
    u8 *descriptor;
    s32 type = (selector & 0xFF00) >> 8;

    switch (type) {
    case 0:
        descriptor = D_80088630;
        break;
    case 1:
        descriptor = D_80069AB8;
        break;
    case 2:
        descriptor = D_80069A88;
        break;
    default:
        return;
    }

    if (*(u8 **)owner != descriptor) {
        if (selector != 0xFE00) {
            func_80034E58(*(void **)owner, 0);
        }
        *(u32 *)(owner + 0x18) = *(u32 *)(descriptor + 0x0C);
        *(u32 *)(owner + 0x1C) = *(u32 *)(descriptor + 0x14);
        func_80034164(descriptor, owner);
        *(u16 *)(owner + 8) = 0;
        *(u16 *)(owner + 0x0E) = 0;
        *(u32 *)(owner + 4) = 0;
        *(u8 **)owner = descriptor;
    }
}
