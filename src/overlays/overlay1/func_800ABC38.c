#include "types.h"

typedef struct {
    s32 sound;
    u8 pad04[0x24];
} MenuEntry;

extern u16 *D_8006B634[];
extern u16 *D_8006B6C4[];
extern u16 D_8006B7B4[];
extern s32 D_8006B7E0;
extern MenuEntry D_80072E04[];
extern s32 D_8007A100;
extern u16 D_8007A11C[];
extern u16 *D_8007A120[];
extern u16 D_8007A128[];
extern u16 *D_8007A12C[];
extern u16 D_8007A148[];
extern u16 D_8007A14C[];
extern u16 D_8007A154[];
extern u16 D_800857B2;

void func_8001EC20(s32 a, s32 b);
void func_800A84E0(u16 a, u16 idx);
void func_800A9330(u16 idx, s32 mode);
void func_800A9F70(void);

void func_800ABC38(s32 arg0, u32 buttons) {
    u16 choice;
    s32 idx;
    u16 **table;
    u16 **base;
    u16 *row;
    u16 *prev;
    u16 value;
    u16 *cur;
    u16 *next;

    choice = 0;
    switch (D_8007A11C[(u16)arg0]) {
        case 0:
        case 1:
            choice = (buttons >> 14) & 1;
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
    idx = (u16)arg0;
    base = D_8007A120;
    table = base + idx;
    cur = *table;
    row = &D_8007A148[idx];
    prev = &D_8007A14C[idx];
    *prev = *row;
    *row = 0;
    value = cur[*prev * 3 + choice];
    if (D_8006B7B4[idx] != 0) {
        next = D_8006B6C4[value];
        *table = next;
        D_8007A12C[idx] = next;
        D_8007A154[idx] = 1;
        D_8007A128[idx] = value;
        func_800A9330(idx, 1);
        if ((D_800857B2 & 0xC0) == 0x40) {
            D_8006B7E0 = D_80072E04[value].sound;
            func_8001EC20(D_8007A100, 6);
        }
    } else {
        D_8007A128[idx] = value;
        *table = D_8006B634[value];
        D_8007A154[idx] = 2;
        func_800A9330(idx, 2);
    }
    func_800A84E0(0, (u16)arg0);
    func_800A9F70();
}
