#include "types.h"

typedef struct {
    u8 unk_00;
    u8 pad[0x27];
} Player;

typedef struct {
    u8 unk_00;
    u8 pad_01[0x6B];
    u16 slots[55];
    u8 pad_DA[0xE];
    Player players[207];
    u8 pad_2140[0xC];
} Team;

extern Team D_80080C90[];
extern void *func_80037258(void);
extern void func_80037290(void *state);
extern u16 func_8003A21C(u16);
extern void menu_record_process(u16, u8, u16);
extern void memory_move_overlap(void *, void *, s32);
extern void roster_runtime_copy(u16 index);

void roster_team_update(u16 team, u16 slot) {
    s32 i;
    s32 index;
    s32 pos;
    u16 *slots;
    s32 offset;
    void *state;
    u16 *entry;

    index = 0;
    offset = team * sizeof(Team);
    pos = slot;
    slots = D_80080C90->slots;
    entry = (u16 *)(pos * 2 + (offset + (s32)slots));
    while (1) {
        if (func_8003A21C(index) == *entry) {
            break;
        }
        index++;
    }
    state = func_80037258();
    menu_record_process(*entry, 0xFF, index);
    func_80037290(state);
    for (i = pos; i < 54; i++) {
        if (D_80080C90[team].slots[i + 1] != 0xFFFF) {
            menu_record_process(D_80080C90[team].slots[i + 1], D_80080C90[team].unk_00, i);
            D_80080C90[team].players[i].unk_00 = D_80080C90[team].players[i + 1].unk_00;
        }
    }
    memory_move_overlap(&D_80080C90[team].slots[slot], &D_80080C90[team].slots[slot + 1], (54 - slot) * 2);
    D_80080C90[team].slots[54] = 0xFFFF;
    roster_runtime_copy(team);
}
