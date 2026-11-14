#include "types.h"

extern u16 D_80085D30[];
extern u8 D_8008A770[];
extern u8 D_8008A774[];
extern void func_80032F3C(s32 identifier, u32 resource);

void resource_slots_release(u32 group)
{
    u32 saved_group = (u16)group;
    u16 *base;
    u16 *counts;
    u32 initial;
    u32 cursor;
    u32 offset;
    u32 value;

    initial = D_80085D30[saved_group];
    base = D_80085D30;
    if (initial == 0) {
        return;
    }

    counts = base;
    cursor = (saved_group << 2) >> 1;
loop:
        cursor += (u32)counts;
        value = *(u16 *)cursor;
        base = (u16 *)(saved_group << 10);
        value--;
        *(u16 *)cursor = value;
        offset = (u16)value;
        offset <<= 3;
        offset += (u32)base;
        func_80032F3C(*(s16 *)(D_8008A770 + offset),
                      *(u32 *)(D_8008A774 + offset));
        value = *(u16 *)cursor;
        if (value != 0) {
            cursor = saved_group << 1;
            goto loop;
        }
}
