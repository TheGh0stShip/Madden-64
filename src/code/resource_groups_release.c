#include "types.h"

extern u32 D_80082DC8;
extern void func_8000BE80(void);
extern void func_8000DA98(u32 resource);

void resource_groups_release(void)
{
    s32 group;
    u32 offset;
    s32 next;

    func_8000BE80();
    group = 0;
loop:
    offset = (s16)group * 8524;
    func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8));
    func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8 + 4));
    func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8 + 8));
    func_8000DA98(*(u32 *)(offset + (u32)&D_80082DC8 + 12));
    next = group + 1;
    group = next;
    for (;;) {
        if (group == next) {
            break;
        }
    }
    next = (next << 16) >> 16;
    if (next < 2) {
        goto loop;
    }
}
