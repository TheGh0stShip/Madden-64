#include "types.h"

extern s16 D_800740CA;
extern u16 D_80080CFC[];
extern u8 D_80082D84[];
extern u8 D_80087AFC;
extern u8 D_800876F4;
extern u8 D_8008B628;
extern s32 func_8003FE94(u16 value);

s32 func_8003F060(s32 first, u32 second, u32 value)
{
    register s32 original __asm__("$16") = first;
    register s32 saved_first __asm__("$17") = original;
    register u32 saved_second __asm__("$18") = second;
    register u32 saved_value __asm__("$19") = value;
    register u32 slot_raw __asm__("$7");
    register u32 slot __asm__("$6");
    register s32 shift __asm__("$2");
    register s32 row __asm__("$4");
    register u32 row_offset __asm__("$3");
    register u32 output_offset __asm__("$4");
    register u32 a1_work __asm__("$5");
    register u8 *table __asm__("$4");

    if (D_800740CA == 0) return 0;
    slot_raw = func_8003FE94((u16)saved_first);
    __asm__("" : "=r"(slot_raw) : "0"(slot_raw));
    shift = slot_raw << 16;
    __asm__("" : "=r"(slot_raw), "=r"(shift) : "0"(slot_raw), "1"(shift));
    slot = shift >> 16;
    __asm__("" : "=r"(slot_raw) : "0"(slot_raw));
    if ((s16)slot == -1) return 0;
    row = (s16)original;
    row_offset = row * 0x214C;
    __asm__("" : "=r"(row_offset) : "0"(row_offset));
    a1_work = (u16)saved_second;
    table = (u8 *)D_80080CFC;
    a1_work <<= 1;
    table += row_offset;
    a1_work += (u32)table;
    __asm__("" : "=r"(a1_work) : "0"(a1_work));
    a1_work = *(u16 *)a1_work;
    output_offset = slot * 4;
    output_offset += row_offset;
    D_80082D84[output_offset + 2] = saved_value;
    D_80082D84[output_offset + 3] = 0xE0;
    D_80087AFC = saved_first;
    __asm__("" : "=r"(slot_raw) : "0"(slot_raw));
    D_800876F4 = slot_raw;
    D_8008B628 = saved_second;
    *(u16 *)&D_80082D84[output_offset] = a1_work;
    return 1;
}
