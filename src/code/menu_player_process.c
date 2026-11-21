#include "types.h"

typedef struct {
    void *unk_00;
    u8 unk_04;
    u8 pad05[0x60 - 0x05];
    u8 unk_60[0xB0 - 0x60];
    u8 unk_B0;
    u8 padB1[0xB8 - 0xB1];
    s32 unk_B8;
    u8 padBC[0x7C8 - 0xBC];
} MenuPlayer;

extern u8 D_80071730[];
extern u8 D_80071738[];
extern s16 D_800692B2;
extern MenuPlayer D_800784F4[];
extern void menu_state_process(s32 index);
extern void func_80044F48(void *state, u8 a1, u8 a2);
extern void func_80044F6C(void *state, u32 index, u8 value, void *record);

void menu_player_process(u32 index, u8 *record) {
    s32 sel = record[0xE] & 0x3F;
    MenuPlayer *p;

    if (sel == 0) {
        if (record[0x20] == 0) {
            D_800784F4[(u8)index].unk_00 = D_80071730;
        } else {
            D_800784F4[(u8)index].unk_00 = D_80071738;
        }
    } else {
        D_800784F4[(u8)index].unk_00 = D_80071738 + sel * 8;
    }
    if (D_800692B2 == 0) {
        D_800784F4[(u8)index].unk_04 = 0xFF;
    } else {
        D_800784F4[(u8)index].unk_04 = 0;
    }
    D_800784F4[(u8)index].unk_B0 = record[0x21];
    D_800784F4[(u8)index].unk_B8 = 0;
    if ((u8)index == 1) {
        menu_state_process(1);
        menu_state_process(1);
    }
    menu_state_process((u8)index);
    p = &D_800784F4[(u8)index];
    func_80044F48(p->unk_60, record[0x10], record[0xF]);
    func_80044F6C(p->unk_60, (u8)index, record[0xD], record);
}
