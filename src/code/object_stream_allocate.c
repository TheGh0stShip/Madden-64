#include "types.h"

extern void func_800635A0(void *object, s32 code);
extern u8 *func_80064970(void *object, s32 size);

u8 *func_800637A4(u8 *object_arg, s32 mode_arg, u32 size_arg)
{
    register u8 *object __asm__("$16");
    register u8 *container __asm__("$19");
    register u8 *block __asm__("$17");
    register u32 size __asm__("$18");
    register s32 mode __asm__("$20");
    register u32 limit __asm__("$2");
    register u32 remainder __asm__("$3");
    register u32 rounded __asm__("$2");
    register u8 *slot __asm__("$3");
    register u8 *old __asm__("$4");

    object = object_arg;
    __asm__("" : "=r"(object) : "0"(object));
    size = size_arg;
    __asm__("" : "=r"(size) : "0"(size));
    container = *(u8 **)(object + 4);
    limit = 0x3B9AC9F0U;
    mode = mode_arg;
    if (limit < size) {
        func_800635A0(object_arg, 3);
    }

    remainder = size & 7;
    if (remainder != 0) {
        rounded = size + 8;
        size = rounded - remainder;
    }

    if ((u32)mode >= 2U) {
        register u8 *inner_v1 __asm__("$3");
        register u8 *inner_v0 __asm__("$2");
        inner_v1 = *(u8 **)object;
        *(s32 *)(inner_v1 + 0x14) = 0xC;
        inner_v0 = *(u8 **)object;
        *(s32 *)(inner_v0 + 0x18) = mode;
        inner_v0 = *(u8 **)object;
        (*(void (**)(void *))inner_v0)(object);
    }

    block = func_80064970(object, size + 0x10);
    __asm__("" : "=r"(block) : "0"(block));
    if (block == 0) {
        func_800635A0(object, 4);
    }

    *(u32 *)(container + 0x48) += size + 0x10;
    slot = (u8 *)(((u32)mode << 2) + (u32)container);
    old = *(u8 **)(slot + 0x38);
    *(u32 *)(block + 4) = size;
    *(u32 *)(block + 8) = 0;
    *(u8 **)block = old;
    *(u8 **)(slot + 0x38) = block;
    return block + 0x10;
}
