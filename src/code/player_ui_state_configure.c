#include "types.h"

typedef struct {
    void *unk_00;
    u8 unk_04;
    u8 pad_05[0x5B];
    u8 unk_60[0x50];
    u8 unk_B0;
    u8 pad_B1[7];
    u32 unk_B8;
    u8 pad_BC[0x70C];
} PlayerUiState;

extern s16 D_800692B2;
extern PlayerUiState D_800784F4[];

void menu_state_process(s32 index);
void func_80044F48(void *state, u8 a1, u8 a2);
void func_80044F6C(void *state, u32 index, u8 value, u8 *rec);

void player_ui_state_configure(u32 index, u8 *record, void *table) {
    u8 *rec = record;

    D_800784F4[(u8)index].unk_00 = table;
    if (D_800692B2 == 0) {
        D_800784F4[(u8)index].unk_04 = 0xFF;
    } else {
        D_800784F4[(u8)index].unk_04 = 0;
    }
    D_800784F4[(u8)index].unk_B0 = rec[0x21];
    D_800784F4[(u8)index].unk_B8 = 0;
    if ((u8)index == 1) {
        menu_state_process(1);
        menu_state_process(1);
    }
    menu_state_process((u8)index);
    func_80044F48(D_800784F4[(u8)index].unk_60, rec[0x10], rec[0xF]);
    func_80044F6C(D_800784F4[(u8)index].unk_60, (u8)index, rec[0xD], rec);
}
