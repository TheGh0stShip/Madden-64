#include "types.h"

extern u16 D_80085D30[];
extern u8 D_8008A770[];
extern u8 D_8008A774[];
extern void func_80032F3C(s32 identifier, u32 resource);

void resource_slots_release(u32 group)
{
    register u32 saved_group __asm__("$17") = (u16)group;
    register u16 *base __asm__("$3");
    register u16 *counts __asm__("$18");
    register u32 initial __asm__("$2");
    register u32 cursor __asm__("$16");
    register u32 group_offset __asm__("$3");
    register u32 offset __asm__("$2");
    register u32 value __asm__("$2");

    initial = D_80085D30[saved_group];
    base = D_80085D30;
    __asm__ volatile("" : "=r"(base) : "0"(base));
    counts = base;
    if (initial == 0) {
        return;
    }

    __asm__ volatile("" : "=r"(saved_group) : "0"(saved_group));
    cursor = saved_group << 1;
loop:
        cursor += (u32)counts;
        value = *(u16 *)cursor;
        group_offset = saved_group << 10;
        value--;
        *(u16 *)cursor = value;
        offset = (u16)value;
        offset <<= 3;
        offset += group_offset;
        func_80032F3C(*(s16 *)(D_8008A770 + offset),
                      *(u32 *)(D_8008A774 + offset));
        value = *(u16 *)cursor;
        if (value != 0) {
            cursor = saved_group << 1;
            goto loop;
        }
}
