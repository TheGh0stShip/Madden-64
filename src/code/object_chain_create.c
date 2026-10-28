#include "types.h"

typedef void *(*ObjectChainAllocate)(void *pool);
typedef void (*ObjectChainInitialize)(u8 *node, void *argument);

extern void *D_800782F4;
extern u32 *D_800782F8;
extern u8 *D_800782FC;
extern void *func_80033298(void *pool);

u8 *object_chain_create(s32 type, void *argument)
{
    s32 saved_type = type;
    void *saved_argument = argument;
    u8 *node;
    u32 index;
    u32 *sizes;
    void *child;
    u8 *descriptors;
    ObjectChainInitialize initialize;

    node = func_80033298(D_800782F4);
    sizes = D_800782F8;
    *(s16 *)(node + 0x54) = saved_type;
    index = (u16)saved_type;
    *(u32 *)(node + 0x14) = 1;
    *(u32 *)(node + 0xC) = 0;
    *(u32 *)(node + 0x10) = 0;
    *(u32 *)(node + 0) = 0;
    *(u32 *)(node + 4) = 0;
    child = func_80033298((void *)sizes[index]);
    descriptors = D_800782FC;
    *(void **)(node + 8) = child;
    descriptors += index * 24;
    initialize = *(ObjectChainInitialize *)(descriptors + 0x10);
    initialize(node, saved_argument);
    *(u32 *)(node + 0x4C) = 0;
    *(u32 *)(node + 0x50) = 0;
    return node;
}
