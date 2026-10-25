#include "types.h"

typedef void *(*ObjectAllocate)(u8 *object, u32 count, u32 size);

void object_children_allocate(u8 *object)
{
    register u8 *saved_object __asm__("$16");
    register s32 index __asm__("$17");
    register u8 *state __asm__("$18");
    register u32 size __asm__("$19");
    register u32 base_size __asm__("$2");
    register u8 *states __asm__("$4");
    register s32 count __asm__("$3");
    ObjectAllocate allocate;
    volatile u64 unused;

    saved_object = object;
    index = 0;
    __asm__ volatile("" : "=r"(saved_object), "=r"(index)
                     : "0"(saved_object), "1"(index));
    base_size = *(u32 *)(saved_object + 0x70);
    states = *(u8 **)(saved_object + 0x1C8);
    count = *(s32 *)(saved_object + 0x78);
    base_size += 2;
    size = base_size << 1;
    if (count <= 0) {
        return;
    }
    state = states;
    do {
        allocate = *(ObjectAllocate *)(*(u8 **)(saved_object + 4) + 4);
        *(void **)(state + 0x44) = allocate(saved_object, 1, size);
        index++;
        state += 4;
    } while (index < *(s32 *)(saved_object + 0x78));
}
