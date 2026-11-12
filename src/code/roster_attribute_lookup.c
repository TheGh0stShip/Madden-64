#include "types.h"

extern u8 D_800816A7[];
extern u8 *D_80088094;

u8 roster_attribute_lookup(u32 group, u32 index, u32 attribute)
{
    u32 group_offset;
    u32 row_offset;
    u32 lookup_offset;
    u8 *table;
    u8 *records;
    u8 *row;
    u32 mapped;

    group = (u16)group;
    group_offset = group << 5;
    group_offset += group;
    group_offset <<= 2;
    group_offset += group;
    group_offset <<= 2;
    group_offset += group;
    group_offset <<= 2;
    group_offset -= group;
    group_offset <<= 2;

    index = (u16)index;
    do {
        table = D_800816A7;
    } while (0);
    row_offset = index << 1;
    row_offset += index;
    row_offset <<= 2;
    do {
        records = D_80088094;
    } while (0);
    lookup_offset = index << 2;
    lookup_offset += index;
    lookup_offset <<= 3;
    row = (u8 *)(lookup_offset + (u32)records);
    row = *(u8 **)(row + 0x10);
    row_offset -= index;
    attribute = (u16)attribute;
    mapped = row[attribute];
    group_offset += (u32)table;
    row_offset += group_offset;
    row_offset += mapped;
    return *(u8 *)row_offset;
}
