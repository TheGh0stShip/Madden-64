#include "types.h"

typedef struct {
    s32 **unk0;
    u8 pad04[0x7C4];
} MenuPlayer;

extern u8 D_80080D6A[];
extern u8 D_80071728[];
extern s16 D_800692B2;
extern s8 D_800695F0;
extern s16 D_800692B0;
extern s32 D_80069308[];
extern MenuPlayer D_800784F4[];
extern void func_8001F488(u8 index, void *record, void *table);
extern void func_8001F0C4(u32 index);

void *menu_player_finalize(u32 index, u32 selection, u32 roster) {
    u8 *base;
    u8 *record;
    u32 count;
    s32 **state;

    base = D_80080D6A + (u8)roster * 0x214C;
    for (count = 0; (record = base + (u16)count * 0x28) != 0 && record[0xE] != 0; count++) {
    }
    func_8001F488(index & 0xFF, record, D_80071728);
    if (D_800692B2 != 0) {
        if ((u16)selection < D_800695F0) {
            D_800692B0--;
        } else if ((u16)selection > D_800695F0) {
            D_800692B0++;
        }
        D_800695F0 = selection;
        if (D_800692B0 < 0) {
            D_800692B0 = 0;
        } else if (D_80069308[D_800692B0] == -1) {
            D_800692B0--;
        }
        state = D_800784F4[(u8)index].unk0;
        if (state != 0) {
            *state[0] = D_80069308[D_800692B0];
            *D_800784F4[(u8)index].unk0[1] = 0x2000;
        }
        func_8001F0C4((u8)index);
    }
    return record;
}
