#include "types.h"

extern s8 D_80086DE4;
extern u8 D_800880E8;
extern u16 D_8008B3B0;
extern u32 D_80087100;
extern void func_80030EF4(s16 index, u8 *first, u8 *second);

u32 controller_flags_resolve(s32 index, u32 *output)
{
    register u32 *saved_output __asm__("$17") = output;
    register s32 saved_index __asm__("$18") = index;
    register s32 lookup_offset __asm__("$2");
    u32 flags;
    u8 first;
    u8 second;

    if (saved_output != 0) {
        flags = *(u16 *)((u32)&D_8008B3B0 +
            *(s8 *)((u32)&D_80086DE4 + (s16)index) * 6);
        if (*(u8 *)((u32)&D_800880E8 + (s16)index) != 0) {
            func_80030EF4((s16)index, &first, &second);
            if (first < 10) flags |= 0x200;
            if (first >= 22) flags |= 0x100;
            if (second < 10) flags |= 0x800;
            if (second >= 22) flags |= 0x400;
        }
        *saved_output = flags & 0xFF3F;
    }
    lookup_offset = (s16)saved_index * 4;
    __asm__("" : "=r"(lookup_offset) : "0"(lookup_offset));
    return *(u32 *)((u32)&D_80087100 + lookup_offset);
}
