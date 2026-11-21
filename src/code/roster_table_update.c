#include "types.h"

typedef struct {
    u8 unk_00;
    u8 pad_01[0x27];
} RosterPlayer;

typedef struct {
    u8 unk_00;
    u8 pad_01[0x6B];
    u16 slot[55];
    u8 pad_DA[0xE];
    RosterPlayer players[55];
    u8 pad_980[0x214C - 0x980];
} RosterTeam;

typedef struct {
    u32 kind : 2;
    u32 pad : 30;
    u32 unk_04;
    u32 unk_08;
} RosterRecord;

extern RosterTeam D_80080C90[];
extern RosterRecord *D_8006B9DC;

u8 *roster_selection_update(u16);
s32 func_80037258(void);
void func_80037290(s32);
void menu_record_process(u16, u8, u16);
u16 func_80028224(void);
u16 frame_identifier_find(u8);
void func_80033308(s32, RosterRecord *, s32, s32);
void roster_runtime_copy(u16);
u16 func_8003A21C(u16);
void memory_move_overlap(void *, void *, s32);
void frame_halfword_remove(u16);

s32 roster_table_update(u16 team, u16 id, u16 notify) {
    u32 i;
    s32 j;
    s32 k;
    u32 pos;
    u8 *info;
    RosterRecord *rec;
    s32 saved;
    u8 *base;

    for (i = 0; i < 55; i++) {
        if (D_80080C90[team].slot[i] == 0xFFFF) {
            info = roster_selection_update(id);
            if (notify) {
                saved = func_80037258();
                menu_record_process(id, D_80080C90[team].unk_00, i);
                func_80037290(saved);
            } else if (func_80028224() == 1) {
                rec = &D_8006B9DC[frame_identifier_find(D_80080C90[team].unk_00) * 55 + i];
                func_80033308(0, rec, 0xC, 0);
                pos = info[0xE] & 0x3F;
                if (pos < 10) {
                    if (pos == 0) {
                        rec->kind = 0;
                    } else {
                        rec->kind = 1;
                    }
                } else if (pos < 21) {
                    rec->kind = 2;
                } else {
                    rec->kind = 3;
                }
            }
            D_80080C90[team].slot[i] = id;
            D_80080C90[team].players[i].unk_00 = info[0xE];
            roster_runtime_copy(team);
            if (notify) {
                k = 0;
                if (func_80028224() == 1) {
                    for (; func_8003A21C(k) != id; k++) {
                    }
                    for (j = k; func_8003A21C(j) != 0xFFFF; j++) {
                    }
                    j--;
                    if (j != k) {
                        base = (u8 *)D_8006B9DC;
                        memory_move_overlap(base + (k + 0x672) * 12, base + (k + 0x673) * 12, (j - k) * 12);
                    }
                }
                frame_halfword_remove(id);
            }
            return 1;
        }
    }
    return 0;
}
