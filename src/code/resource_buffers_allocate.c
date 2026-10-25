#include "types.h"

extern void func_8001C6B8(void *resource, u16 *sizes);
extern void *func_800337CC(s32 zero, s32 size, s32 alignment);
extern void func_80033308(s32 zero, void *buffer, s32 size, s32 value);

void resource_buffers_allocate(void *unused, u8 *context)
{
    u16 sizes[8];
    u32 count;
    u8 *buffer;

    *(void **)(context + 0x30) = 0;
    *(void **)(context + 0x34) = 0;
    func_8001C6B8(*(void **)(context + 0x10), sizes);
    count = sizes[1] + sizes[0] + sizes[2];
    *(s32 *)(context + 0x38) = count;
    if (count != 0) {
        count <<= 7;
        buffer = func_800337CC(0, count, 0x10);
        *(u8 **)(context + 0x30) = buffer;
        func_80033308(0, buffer, count, 0);
        count >>= 1;
        *(u8 **)(context + 0x34) = buffer + count;
    }
}
