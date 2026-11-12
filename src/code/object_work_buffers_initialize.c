#include "types.h"

typedef void *(*ObjectAllocateCallback)(u8 *object, u32 count, u32 size);

extern void func_80059A78(void);

void object_work_buffers_initialize(u8 *object)
{
    u8 *saved_object = object;
    ObjectAllocateCallback allocate;
    u8 *state;
    u8 *header;
    s32 index;
    s32 *values;
    s32 outer = 0;
    u32 allocation_count;
    volatile u64 unused;

    allocate = *(ObjectAllocateCallback *)(*(u8 **)(saved_object + 4));
    state = allocate(saved_object, 1, 0x40);
    *(u8 **)(saved_object + 0x1B8) = state;
    *(void **)state = func_80059A78;
    index = 3;
    header = state + 0xC;
    do {
        *(u32 *)(header + 0x2C) = 0;
        index--;
        header -= 4;
    } while (index >= 0);
    allocate = *(ObjectAllocateCallback *)(*(u8 **)(saved_object + 4));
    if (header) {
        allocation_count = 1;
    } else {
        allocation_count = 2 - 1;
    }
    values = allocate(saved_object, allocation_count,
                      *(u32 *)(saved_object + 0x20) << 8);
    outer = 0;
    *(s32 **)(saved_object + 0xA0) = values;
    if (*(s32 *)(saved_object + 0x20) > 0) {
        s32 fill = -1;
        do {
            index = 63;
            do {
                *values++ = fill;
                index--;
            } while (index >= 0);
            outer++;
        } while (outer < *(s32 *)(saved_object + 0x20));
    }
}
