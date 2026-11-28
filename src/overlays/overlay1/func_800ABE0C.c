#include "types.h"

typedef struct {
    u8 pad0[0x28];
} PlayEntry;

typedef struct {
    u8 pad0[0x84];
} PlayData;

typedef struct {
    PlayEntry *entry;
    PlayData *data;
    u8 *play;
    s16 index;
    u8 padE[0x213E];
} TeamPlay;

typedef struct {
    s32 count;
    u8 *plays[1];
} PlayTable;

extern s16 D_8006B7AA;
extern s16 D_8006B7AC;
extern u16 D_8006B7AE;
extern u16 D_8006B7B4[];
extern s16 D_8006B7BC;
extern s16 D_8006B7BE;
extern u16 D_8007A11C[];
extern u16 *D_8007A120[];
extern u16 D_8007A128[];
extern u16 *D_8007A12C[];
extern u16 *D_8007A13C[];
extern u16 D_8007A148[];
extern u16 D_8007A14C[];
extern u16 D_8007A154[];
extern TeamPlay D_80082DB4[];
extern u16 D_80085280;
extern s16 D_80086BE6;
extern s16 D_80086C8C;
extern s8 D_80086DDC[];
extern s32 D_800878A8[];
extern PlayData *D_80087894;
extern s16 D_8008791C;
extern s16 D_80087946;
extern PlayEntry *D_80088094;
extern s16 D_800886E0;
extern s16 D_80089320;
extern s32 D_80089380[];
extern PlayTable *D_800895DC;

void func_80022354(u16);
void func_80091E2C(s32);
void func_800A84E0(u16, u16);
void func_800A9330(s32, s32);
void command_26_69_10(void);

/* recipe: --assembler=asn64 --symbol=func_80091E2C:0x80091E2C (func_80091E2C = catalogue func_80096550) */

/* Play-call menu input: B backs out a level; A/C buttons pick a play from the current page and commit it. */
void func_800ABE0C(s32 arg0, u32 buttons) {
    u16 choice;
    u16 row;
    u16 *cur;
    u16 index;
    s32 idx;

    choice = 0;
    if ((buttons & 2) && D_80089320 != -1) {
        idx = (u16)arg0;
        if (D_8006B7B4[idx] != 0) {
            D_8007A148[idx] = 0;
            D_8007A154[idx] = 1;
            D_8007A120[idx] = D_8007A12C[idx];
            func_800A9330(idx, 1);
        } else {
            D_8007A154[idx] = 0;
            D_8007A148[idx] = D_8007A14C[idx];
            D_8007A120[idx] = D_8007A13C[idx];
            func_800A9330(idx, 0);
        }
        func_800A84E0(D_8007A148[(u16)arg0], arg0);
    } else {
        row = D_8007A148[(u16)arg0];
        cur = D_8007A120[(u16)arg0];
        switch (D_8007A11C[(u16)arg0]) {
        case 0:
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
            if (buttons & 0x10) {
                if (row == 0) {
                    row = cur[0] - 1;
                } else {
                    row--;
                }
            } else if (buttons & 0x2020) {
                if (row + 1 < cur[0]) {
                    row++;
                } else {
                    row = 0;
                }
            }
            break;
        }
        if (choice == 0) {
            return;
        }
        {
            u16 *page = D_8007A120[(u16)arg0];

            choice = page[row * 3 + choice];
        }
        if ((u16)arg0 != 0) {
            D_8006B7AA = choice | D_8006B7AE;
            D_8006B7BC = D_8007A128[1];
            D_80087946 = choice | D_8006B7AE;
            D_80086C8C = D_8007A128[1];
        } else {
            D_8006B7AC = choice;
            D_8008791C = choice;
            D_8006B7BE = D_8007A128[0];
            D_80086BE6 = D_8007A128[0];
            if (D_80089320 != -1) {
                D_80082DB4[D_800886E0].play = D_800895DC->plays[choice & 0x1FFF];
                index = *D_80082DB4[D_800886E0].play & 0x1F;
                D_80082DB4[D_800886E0].index = index;
                D_80082DB4[D_800886E0].data = D_80087894 + index;
                D_80082DB4[D_800886E0].entry = D_80088094 + D_80082DB4[D_800886E0].index;
                func_80022354(D_800886E0);
                D_80086DDC[D_800886E0] = 0;
                D_80089380[(s16)(D_80085280 & 0xFF3F)] = D_800878A8[(s16)(D_80085280 & 0xFF3F)];
                func_80091E2C(D_800886E0);
            }
        }
        D_8007A11C[(u16)arg0] = 3;
    }
    command_26_69_10();
}
