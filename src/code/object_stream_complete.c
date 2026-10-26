#include "types.h"

extern void func_80064990(void *object, void *block, s32 size);
extern void func_80064950(void *object, void *block, s32 size);

void object_stream_complete(u8 *object_arg, s32 mode_arg)
{
    register u8 *object __asm__("$19") = object_arg;
    register s32 mode __asm__("$20") = mode_arg;
    register u8 *container __asm__("$18");
    register u8 *node __asm__("$16");
    register u8 *next __asm__("$16");
    register u8 *block __asm__("$5");
    register s32 size __asm__("$17");
    register u8 *slot __asm__("$2");
    register u32 used __asm__("$2");
    register u32 remaining __asm__("$3");
    register u8 *call_object __asm__("$4");

    container = *(u8 **)(object + 4);
    if ((u32)mode >= 2U) {
        register u8 *inner_v1 __asm__("$3");
        register u8 *inner_v0 __asm__("$2");
        __asm__("" : "=r"(object) : "0"(object));
        inner_v1 = *(u8 **)object;
        *(s32 *)(inner_v1 + 0x14) = 0xC;
        inner_v0 = *(u8 **)object;
        *(s32 *)(inner_v0 + 0x18) = mode;
        inner_v0 = *(u8 **)object;
        (*(void (**)(void))inner_v0)();
    }

    if (mode == 1) {
        node = *(u8 **)(container + 0x40);
        while (node != 0) {
            if (*(s32 *)(node + 0x28) != 0) {
                (*(void (**)(void *, void *))(node + 0x38))(object, node + 0x30);
                *(s32 *)(node + 0x28) = 0;
            }
            node = *(u8 **)(node + 0x2C);
        }
        *(u32 *)(container + 0x40) = 0;

        node = *(u8 **)(container + 0x44);
        while (node != 0) {
            if (*(s32 *)(node + 0x28) != 0) {
                (*(void (**)(void *, void *))(node + 0x38))(object, node + 0x30);
                *(s32 *)(node + 0x28) = 0;
            }
            node = *(u8 **)(node + 0x2C);
        }
        *(u32 *)(container + 0x44) = 0;
    }

    slot = (u8 *)(((u32)mode << 2) + (u32)container);
    block = *(u8 **)(slot + 0x38);
    *(u32 *)(slot + 0x38) = 0;
    while (block != 0) {
        used = *(u32 *)(block + 4);
        remaining = *(u32 *)(block + 8);
        call_object = object;
        next = *(u8 **)block;
        used += remaining;
        size = used + 0x10;
        func_80064990(call_object, block, size);
        *(u32 *)(container + 0x48) -= size;
        block = next;
    }

    slot = (u8 *)(((u32)mode << 2) + (u32)container);
    block = *(u8 **)(slot + 0x30);
    *(u32 *)(slot + 0x30) = 0;
    while (block != 0) {
        used = *(u32 *)(block + 4);
        remaining = *(u32 *)(block + 8);
        call_object = object;
        next = *(u8 **)block;
        used += remaining;
        size = used + 0x10;
        func_80064950(call_object, block, size);
        *(u32 *)(container + 0x48) -= size;
        block = next;
    }
}
