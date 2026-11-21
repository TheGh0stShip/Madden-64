#include "types.h"

typedef struct {
    u32 **unk_00;
    u8 unk_04;
    u8 unk_05[3];
    u8 unk_08[0xB0];
    s32 unk_B8;
    u8 unk_BC[0x70C];
} MenuState;

extern s16 D_800692B2;
extern MenuState D_800784F4[];
extern void *D_80086DD8;
extern u8 D_800908B8[];
extern void func_800353B0(void);
extern u16 func_80034D30(u32 value, s32 arg1, s32 arg2);
extern u8 func_80035380(u32 value);
extern u32 resource_selection_update(void *state, u32 value, u16 arg2);
extern void func_80034388(void *state, u32 value);

void menu_state_process(s32 index) {
    u32 value;

    if (D_800692B2 == 0) {
        D_800784F4[index].unk_04++;
    }
    value = (*D_800784F4[index].unk_00)[D_800784F4[index].unk_04];
    if (value == 0) {
        D_800784F4[index].unk_04 = 0;
        value = (*D_800784F4[index].unk_00)[0];
    }
    D_800784F4[index].unk_B8 = 0;
    if ((value & 0xFF00) > 0x200) {
        if (D_80086DD8 != D_800908B8) {
            func_80034388(D_800784F4[index].unk_08, 0x60045);
        } else {
            func_800353B0();
            if (func_80034D30(value, 2, 0) != 0) {
                while (func_80035380(value) == 0) {
                }
                resource_selection_update(D_800784F4[index].unk_08, value, 0);
            }
        }
    } else {
        func_80034388(D_800784F4[index].unk_08, value);
    }
}
