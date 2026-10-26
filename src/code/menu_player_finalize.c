#include "types.h"

extern u8 D_80080D6A[];
extern u8 D_80071728[];
extern s16 D_800692B2;
extern s8 D_800695F0;
extern s16 D_800692B0;
extern s32 D_80069308[];
extern u8 D_800784F4[];
extern void func_8001F488(u8 index, void *record, void *table);
extern void func_8001F0C4(u32 index);

void *menu_player_finalize(u32 index, u32 selection, u32 roster)
{
    register u32 saved_index __asm__("$18") = index;
    register u32 saved_selection __asm__("$17") = selection;
    register u8 *record __asm__("$16");
    register u32 count __asm__("$5") = 0;
    register u8 *record_base __asm__("$4");
    register u32 base_offset __asm__("$2");
    register u8 *record_table __asm__("$3");
    register u32 count16 __asm__("$3");
    register u32 record_delta __asm__("$2");
    u32 player = roster & 0xFF;
    u32 state_offset;
    register s32 current __asm__("$4");
    s32 current_value;
    register u32 player_index __asm__("$4");
    register u32 player_offset __asm__("$5");
    register u32 offset_work __asm__("$2");
    register s32 previous __asm__("$2");
    s32 requested;
    s32 *state;
    u64 stack_pad;

    __asm__("" : "=r"(saved_index) : "0"(saved_index));
    __asm__("" : "=r"(saved_selection) : "0"(saved_selection));
    base_offset = player * 0x214C;
    record_table = D_80080D6A;
    record_base = base_offset + record_table;
    record = record_base;
    while (record != 0 && record[0xE] != 0) {
        count++;
        count16 = (u16)count;
        record_delta = count16 * 0x28;
        record = record_base + record_delta;
    }
    __asm__ volatile("" : "=m"(stack_pad));
    func_8001F488(saved_index & 0xFF, record, D_80071728);
    if (D_800692B2 != 0) {
        requested = saved_selection & 0xFFFF;
        if (requested < D_800695F0) {
            D_800692B0--;
        } else if (requested > D_800695F0) {
            D_800692B0++;
        }
        D_800695F0 = saved_selection;
        current_value = D_800692B0;
        current = current_value;
        if (current_value < 0) {
            D_800692B0 = 0;
        } else if (D_80069308[current] == -1) {
            previous = current - 1;
            D_800692B0 = previous;
        }
        player_index = saved_index & 0xFF;
        offset_work = player_index * 0xF9;
        __asm__("" : "=r"(offset_work) : "0"(offset_work));
        player_offset = offset_work * 8;
        state_offset = player_offset;
        state = *(s32 **)(D_800784F4 + player_offset);
        if (state != 0) {
            state = *(s32 **)state;
            state[0] = D_80069308[D_800692B0];
            state = *(s32 **)((u8 *)*(s32 **)(D_800784F4 + player_offset) + 4);
            state[0] = 0x2000;
        }
        func_8001F0C4(player_index);
    }
    return record;
}
