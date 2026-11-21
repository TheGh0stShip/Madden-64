#include "types.h"

typedef struct {
    u8 unk_00[0x20];
    void *unk_20;
} MenuData;

typedef struct {
    u8 unk_00[0x24];
    MenuData *unk_24;
} MenuObject;

extern s16 D_800894FC;
extern u32 D_80080C10;
extern MenuObject *D_8008A058;
extern MenuData *D_80086178;
u16 func_80031A1C(s32 value);
s16 func_8001FA38(s32 value);
void menu_player_update(s32 mode, u8 *input, void *first, void *second);

void menu_input_activation_update(MenuObject *object, u8 *input) {
    s32 threshold;
    u32 limit;

    if (D_800894FC != 0) {
        return;
    }
    if (!(D_80080C10 & 0x4000)) {
        return;
    }
    if (object != D_8008A058) {
        return;
    }
    threshold = func_80031A1C(((input[0x18] * 3) >> 1) + 0x28);
    if ((func_8001FA38(3) / 2) - 1 < threshold) {
        return;
    }
    limit = input[0xE];
    if (func_80031A1C(0xC8) >= limit) {
        menu_player_update(0xD, input, object->unk_24->unk_20, D_80086178->unk_20);
    } else {
        menu_player_update(3, input, object->unk_24->unk_20, D_80086178->unk_20);
    }
}
