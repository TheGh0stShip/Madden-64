#include "types.h"

extern u8 D_80080D78;
extern u16 D_80080CFC;
extern u16 D_800879B0;
extern u16 func_80023828(u16 group, u8 value, u16 selected);
extern void func_800227F8(u16 group, u16 value, u16 index);
extern void func_80022918(u16 group, u16 value, u16 index);

void roster_selection_apply(u32 group, u32 index)
{
    register u16 saved_index __asm__("$17") = index;
    register s32 record_offset __asm__("$3") = saved_index * 40;
    register u16 saved_group __asm__("$16") = group;
    register s32 group_offset __asm__("$2") = saved_group * 8524;
    register u8 *base __asm__("$4");
    register u8 value __asm__("$5");
    u16 selected;

    __asm__("" : "=r"(record_offset) : "0"(record_offset));
    __asm__("" : "=r"(group_offset) : "0"(group_offset), "r"(record_offset));
    record_offset += group_offset;
    value = *(u8 *)((u32)&D_80080D78 + record_offset);
    __asm__("" : "=r"(value) : "0"(value));
    base = (u8 *)&D_80080CFC;
    selected = *(u16 *)(base + group_offset + saved_index * 2);
    D_800879B0 = func_80023828(saved_group, value & 0x3F, selected);
    func_800227F8(saved_group, D_800879B0, saved_index);
    func_80022918(saved_group, D_800879B0, saved_index);
}
