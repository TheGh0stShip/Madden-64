#include "types.h"

extern u8 D_80080CFC[];
extern u8 D_80080D78[][40];
extern u8 D_80082EC4[][40];
extern void *func_80037258(u32 value);
extern void func_80037290(void *state);
extern void func_80029E88(u16 first, u16 second);
extern void roster_runtime_copy(s32 index);

void roster_teams_swap(u32 first, u32 second)
{
    void *state;
    u32 first_index;
    u32 second_index;
    u16 temp_index;
    u16 first_value;
    u16 second_value;
    u32 first_offset;
    u32 second_offset;
    u16 *table_base;
    u16 *second_base;
    u8 byte_value;
    u16 *first_entry;
    u16 *second_entry;

    state = func_80037258(first);
    first_index = first & 0xFFFF;
    table_base = (u16 *)D_80080CFC;
    first_entry = &table_base[first_index];
    first_value = *first_entry;
    second_index = second & 0xFFFF;
    second_base = table_base + 0x10A6;
    second_entry = &second_base[second_index];
    second_value = *second_entry;
    func_80029E88(first_value, second_value);
    func_80037290(state);

    temp_index = *first_entry;
    second_value = *second_entry;
    first_offset = first_index * 40;
    *first_entry = second_value;
    *second_entry = temp_index;

    temp_index = *(u8 *)((u8 *)D_80080D78 + first_offset);
    second_offset = second_index * 40;
    byte_value = *(u8 *)((u8 *)D_80082EC4 + second_offset);
    *(u8 *)((u8 *)D_80080D78 + first_offset) = byte_value;
    *(u8 *)((u8 *)D_80082EC4 + second_offset) = temp_index;

    roster_runtime_copy(0);
    roster_runtime_copy(1);
}
