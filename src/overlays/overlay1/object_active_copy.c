#include "types.h"

extern u8 *D_8008794C;
extern u8 *D_8008A5EC;
extern s16 D_800718EC;

void func_800BAA9C(u8 *object)
{
    u8 *active;
    u32 position;
    u32 flags;

    active = D_8008794C;
    D_8008A5EC = object;
    do {
        *(u32 *)(active + 0x1C) = *(u32 *)(object + 0x1C);
        position = *(u32 *)(object + 0x20);
    } while (0);
    flags = *(u32 *)(active + 0x14);
    D_800718EC = 20;
    flags &= ~1;
    *(u32 *)(active + 0x20) = position;
    *(u32 *)(active + 0x14) = flags;
}
