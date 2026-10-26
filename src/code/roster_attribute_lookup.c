#include "types.h"

extern u8 D_800816A7[];
extern u8 *D_80088094;

u8 roster_attribute_lookup(u32 group, u32 index, u32 attribute)
{
    register u32 group_offset __asm__("$3");
    register u32 row_offset __asm__("$4");
    register u32 lookup_offset __asm__("$2");
    register u8 *table __asm__("$8");
    register u8 *records __asm__("$7");
    register u8 *row __asm__("$2");
    register u32 mapped __asm__("$2");

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
    __asm__ volatile("" : "=r"(index) : "0"(index));
    table = D_800816A7;
    __asm__ volatile("" : "=r"(table) : "0"(table));
    row_offset = index << 1;
    row_offset += index;
    row_offset <<= 2;
    records = D_80088094;
    __asm__ volatile("" : "=r"(records) : "0"(records));
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
    __asm__("" : "=r"(row_offset) : "0"(row_offset));
    return *(u8 *)row_offset;
}
