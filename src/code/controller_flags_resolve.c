#include "types.h"

extern s8 D_80086DE4;
extern u8 D_800880E8;
extern u16 D_8008B3B0;
extern u32 D_80087100;
extern void func_80030EF4(s16 index, u8 *first, u8 *second);

u32 controller_flags_resolve(s16 index, u32 *output)
{
    u32 flags;
    u8 first;
    u8 second;

    if (output != 0) {
        flags = *(u16 *)((u32)&D_8008B3B0 +
            *(s8 *)((u32)&D_80086DE4 + index) * 6);
        if (*(u8 *)((u32)&D_800880E8 + index) != 0) {
            func_80030EF4(index, &first, &second);
            if (first < 10) flags |= 0x200;
            if (first >= 22) flags |= 0x100;
            if (second < 10) flags |= 0x800;
            if (second >= 22) flags |= 0x400;
        }
        *output = flags & 0xFF3F;
    }
    return *(u32 *)((u32)&D_80087100 + index * 4);
}
