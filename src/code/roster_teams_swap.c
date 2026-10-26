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
    u16 first_index;
    u16 second_index;
    register u16 temp_index __asm__("$6");
    register u16 other_index __asm__("$2");
    u16 first_value;
    u16 second_value;
    u32 first_offset;
    u32 second_offset;
    u8 temp_value;
    u8 *table_base;
    u16 *first_entry;
    u16 *second_entry;

    state = func_80037258(first);
    first_index = first;
    table_base = D_80080CFC;
    first_entry = (u16 *)&table_base[first_index * 2];
    first_value = *first_entry;
    second_index = second;
    table_base += 0x214C;
    second_entry = (u16 *)&table_base[second_index * 2];
    second_value = *second_entry;
    func_80029E88(first_value, second_value);
    func_80037290(state);

    temp_index = *first_entry;
    other_index = *second_entry;
    __asm__("" : "=r"(temp_index), "=r"(other_index)
             : "0"(temp_index), "1"(other_index));
    first_offset = first_index * 40;
    *first_entry = other_index;
    *second_entry = temp_index;

    temp_value = *(u8 *)((u8 *)D_80080D78 + first_offset);
    second_offset = second_index * 40;
    *(u8 *)((u8 *)D_80080D78 + first_offset) =
        *(u8 *)((u8 *)D_80082EC4 + second_offset);
    *(u8 *)((u8 *)D_80082EC4 + second_offset) = temp_value;

    roster_runtime_copy(0);
    roster_runtime_copy(1);
}
