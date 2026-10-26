#include "types.h"

extern u32 D_800049E0[];
extern u32 D_800049E8[];
extern void func_800635A0(void *object, s32 code);
extern u8 *func_80064930(void *object, u32 size);

u8 *object_stream_initialize(u8 *object_arg, s32 mode_arg, u32 size_arg)
{
    register u8 *object __asm__("$17");
    register s32 mode __asm__("$21");
    register u32 size __asm__("$18");
    register u8 *container __asm__("$22");
    register u8 *previous __asm__("$20");
    register u32 request __asm__("$19");
    register u32 reserve __asm__("$16");
    register u32 limit __asm__("$2");
    register u32 remainder __asm__("$3");
    register u32 rounded __asm__("$2");
    register u8 *node __asm__("$5");
    register u8 *result __asm__("$2");
    register u32 capacity __asm__("$3");
    register u32 total __asm__("$3");
    register u32 block_size __asm__("$2");
    register u8 *slot __asm__("$2");
    register u32 used __asm__("$3");
    register u32 available __asm__("$4");
    register u32 accumulated __asm__("$2");

    object = object_arg;
    __asm__("" : "=r"(object) : "0"(object));
    size = size_arg;
    __asm__("" : "=r"(size) : "0"(size));
    container = *(u8 **)(object + 4);
    limit = 0x3B9AC9F0U;
    mode = mode_arg;
    if (limit < size) {
        func_800635A0(object_arg, 1);
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

    node = *(u8 **)(container + 0x30 + ((u32)mode << 2));
    previous = 0;
    if (node != 0) {
list_loop:
        if (*(u32 *)(node + 8) < size) {
            previous = node;
            node = *(u8 **)node;
            if (node != 0) {
                goto list_loop;
            }
        }
    }

    if (node == 0) {
        request = size + 0x10;
        if (previous == 0) {
            reserve = D_800049E0[mode];
        } else {
            reserve = D_800049E8[mode];
        }
        limit = 0x3B9ACA00U;
        capacity = limit - request;
        if (capacity < reserve) {
            reserve = capacity;
        }
        for (;;) {
            result = func_80064930(object, request + reserve);
            node = result;
            __asm__("" : "=r"(node) : "0"(node));
            __asm__("" : "=r"(reserve) : "0"(reserve));
            if (node != 0) {
                break;
            }
            reserve >>= 1;
            if (reserve < 50U) {
                func_800635A0(object, 2);
            }
        }

        total = request + reserve;
        accumulated = *(u32 *)(container + 0x48);
        accumulated += total;
        *(u32 *)(container + 0x48) = accumulated;
        block_size = size + reserve;
        *(u32 *)(node + 0) = 0;
        *(u32 *)(node + 4) = 0;
        *(u32 *)(node + 8) = block_size;
        if (previous == 0) {
            slot = (u8 *)(((u32)mode << 2) + (u32)container);
            *(u8 **)(slot + 0x30) = node;
        } else {
            *(u8 **)previous = node;
        }
    }

    used = *(u32 *)(node + 4);
    result = node + 0x10;
    available = *(u32 *)(node + 8);
    result += used;
    used += size;
    available -= size;
    *(u32 *)(node + 4) = used;
    *(u32 *)(node + 8) = available;
    return result;
}
