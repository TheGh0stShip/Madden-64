#include "types.h"

extern u8 D_800816A7[];

s32 roster_attribute_find(u32 roster, u32 value, u32 attribute)
{
    u32 index = 0;
    u32 roster_value = roster & 0xFFFF;
    u32 roster_offset;
    u32 attribute_value;
    u32 row_offset;
    u32 key;
    u8 *row;

    do {
        roster_offset = roster_value << 5;
        roster_offset += roster_value;
        roster_offset <<= 2;
        roster_offset += roster_value;
        roster_offset <<= 2;
        roster_offset += roster_value;
        roster_offset <<= 2;
        roster_offset -= roster_value;
        roster_offset <<= 2;
    } while (0);
    attribute_value = attribute & 0xFFFF;
    do {
        roster_value = (u32)D_800816A7;
    } while (0);
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
