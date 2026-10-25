#include "types.h"

extern u8 D_800816A7[];

s32 roster_attribute_find(u32 roster, u32 value, u32 attribute)
{
    register u32 index __asm__("$7") = 0;
    register u32 roster_value __asm__("$4") = roster & 0xFFFF;
    register u32 roster_offset __asm__("$2");
    register u32 attribute_value __asm__("$6");
    register u32 row_offset __asm__("$3");
    register u32 key __asm__("$5");
    register u8 *row __asm__("$3");

    roster_offset = roster_value << 5;
    roster_offset += roster_value;
    roster_offset <<= 2;
    roster_offset += roster_value;
    roster_offset <<= 2;
    roster_offset += roster_value;
    roster_offset <<= 2;
    roster_offset -= roster_value;
    roster_offset <<= 2;
    attribute_value = attribute & 0xFFFF;
    __asm__ volatile ("" : "=r" (attribute_value) : "0" (attribute_value));
    roster_value = (u32)D_800816A7;
    row_offset = attribute_value << 1;
    row_offset += attribute_value;
    row_offset <<= 2;
    row_offset -= attribute_value;
    roster_offset += roster_value;
    row = (u8 *)(row_offset + roster_offset);
    key = value & 0xFFFF;
    do {
        if (row[(u16)index] != key) {
            index++;
            continue;
        }
        return (s16)index;
    } while ((u16)index < 11);
    return -1;
}
