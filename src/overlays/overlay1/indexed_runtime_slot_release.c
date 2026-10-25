#include "types.h"

extern s16 D_80089348[];
extern u16 D_800869D0[];
extern void func_800AADA8(s16 handle);

void indexed_runtime_slot_release(s32 index)
{
    u32 normalized = index & 0xFFFF;
    s16 *base = D_80089348;
    u32 offset = normalized << 1;
    s16 *slot = (s16 *)((u8 *)base + offset);

    if (*slot != -1) {
        func_800AADA8(*slot);
        *slot = -1;
    }
    *(u16 *)((u8 *)D_800869D0 + offset) = 0;
}
