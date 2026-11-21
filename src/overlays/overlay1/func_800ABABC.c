#include "types.h"

extern u16 *D_8006B634[];
extern u16 D_8007A11C[];
extern u16 *D_8007A120[];
extern u16 D_8007A128[];
extern u16 *D_8007A13C[];
extern u16 D_8007A148[];
extern u16 D_8007A14C[];
extern u16 D_8007A154[];

void func_800A84E0(u16, u16);
void func_800A9330(u16, s32);
void command_26_69_10(void);

void func_800A7398(u16 idx, u16 buttons) {
    u16 choice;
    u16 **table;
    u16 *row;
    u16 value;
    u16 *cur;
    u16 **base;
    u16 *rows;

    choice = 0;
    if (buttons & 2) {
        D_8007A148[idx] = D_8007A14C[idx];
        D_8007A154[idx] = 0;
        D_8007A120[idx] = D_8007A13C[idx];
        func_800A84E0(D_8007A148[idx], idx);
        func_800A9330(idx, 0);
    } else {
        switch (D_8007A11C[idx]) {
            case 0:
            case 1:
                if (buttons & 0x4000) {
                    choice = 1;
                }
                if (buttons & 0x8000) {
                    choice = 2;
                }
                if (buttons & 4) {
                    choice = 3;
                }
                break;
        }
        if (choice == 0) {
            return;
        }
        base = D_8007A120;
        table = &base[idx];
        rows = D_8007A148;
        row = &rows[idx];
        cur = *table;
        D_8007A128[idx] = value = cur[*row * 3 + choice];
        *row = 0;
        *table = D_8006B634[value];
        D_8007A154[idx] = 2;
        func_800A84E0(0, idx);
        func_800A9330(idx, 2);
    }
    command_26_69_10();
}
