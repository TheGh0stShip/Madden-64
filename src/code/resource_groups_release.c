#include "types.h"

extern u32 D_80082DC8;
extern void func_8000BE80(void);
extern void func_8000DA98(u32 resource);

void resource_groups_release(void)
{
    register s32 group __asm__("$17");
    register u32 offset __asm__("$16");
    register s32 next __asm__("$2");

    func_8000BE80();
    group = 0;
loop:
        offset = (s16)group * 8524;
        func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8));
        __asm__ volatile("" : "=r"(offset) : "0"(offset));
        func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8 + 4));
        __asm__ volatile("" : "=r"(offset) : "0"(offset));
        func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8 + 8));
        __asm__ volatile("" : "=r"(offset) : "0"(offset));
        func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8 + 12));
        __asm__ volatile("" : "=r"(offset) : "0"(offset));
    next = group + 1;
    group = next;
    __asm__("" : "=r"(next) : "0"(next));
    next = (next << 16) >> 16;
    if (next < 2) {
        goto loop;
    }
}
