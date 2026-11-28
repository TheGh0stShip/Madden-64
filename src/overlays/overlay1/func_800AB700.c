#include "types.h"

extern s16 D_8006B7A8;
extern s16 D_8006B7AC;
extern s16 D_8006B7AA[];
extern u16 D_8007A11C[];
extern u16 *D_8007A120[];
extern u16 D_8007A128[];
extern u16 D_8007A148[];
extern u16 D_8007A154[];
extern u16 D_8007A164;
extern s32 D_80080C10;
extern u16 D_8008A5B4;

s32 func_80030B54(s32);
s16 func_800393E0(u8);
void func_800A7398(s32, s32);
void func_800A84E0(u16, u16);
void func_800A8CC0(s32);
void func_800A9004(s32);
void func_800A7514(s32, s32);
void func_800A76E8(s32, s32);
void func_800A9F48(void);
void command_26_69_10(void);

/* recipe: --assembler=asn64 --symbol=func_800A7514:0x800A7514 --symbol=func_800A76E8:0x800A76E8 --symbol=func_800A9F48:0x800A9F48
   (func_800A7514 = catalogue func_800ABC38, func_800A76E8 = func_800ABE0C, func_800A9F48 = func_800AE66C) */

/* Per-side play-call menu update: reads the pad, runs the side's menu state, scrolls the page and dispatches the active menu handler. */
void func_800AB700(s32 side, u32 pad) {
    u16 *cur;
    s32 buttons;
    u16 state;
    s32 row;

    cur = D_8007A120[(u16)side];
    if (pad & 0xC0) {
        buttons = func_80030B54((s16)(pad & 0xFF3F));
    } else {
        buttons = 0;
    }
    if ((u16)side != 0 && (buttons & 8) && D_8007A154[(u16)side] == 2) {
        if (func_800393E0(D_8007A128[(u16)side]) != 0) {
            D_8006B7AA[2] ^= 0x2000;
            func_800A84E0(D_8007A148[(u16)side], (u16)side);
            command_26_69_10();
        }
    }
    state = D_8007A11C[(u16)side];
    switch (state) {
    case 1:
        break;
    case 0:
        break;
    case 2:
        if ((u16)side != 0) {
            func_800A9004((u16)side);
            if (D_8006B7AC != -1 && D_8007A11C[(u16)(side ^ 1)] != state && (D_80080C10 & 0x1200) != 0x1200) {
                D_8006B7A8 = 4;
            }
            D_8007A164 -= D_8008A5B4;
            if ((s16)D_8007A164 < 0) {
                if (D_8007A11C[(u16)(side ^ 1)] == 2) {
                    D_8006B7A8 = 4;
                } else {
                    D_8007A11C[(u16)side] = 3;
                }
            }
        } else {
            func_800A9004(0);
        }
        break;
    case 3:
        if (D_8007A11C[(u16)(side ^ 1)] == state) {
            D_8006B7A8 = 4;
        } else {
            func_800A8CC0((u16)side);
        }
        return;
    }
    if (buttons & 0x800) {
        u16 *rows = D_8007A148;
        u16 *p = rows + (u16)side;

        if ((row = *p) != 0) {
            func_800A84E0(--*p, (u16)side);
        } else {
            func_800A84E0(*p = *cur - 1, (u16)side);
        }
        if (row != D_8007A148[(u16)side]) {
            func_800A9F48();
        }
    }
    if (buttons & 0x400) {
        u16 *rows = D_8007A148;
        u16 *p = rows + (u16)side;

        if ((row = *p) + 1 < *cur) {
            func_800A84E0(++*p, (u16)side);
        } else {
            func_800A84E0(*p = 0, (u16)side);
        }
        if (row != D_8007A148[(u16)side]) {
            func_800A9F48();
        }
    }
    switch (D_8007A154[(u16)side]) {
    case 0:
        func_800A7514((u16)side, buttons);
        break;
    case 1:
        func_800A7398((u16)side, buttons);
        break;
    case 2:
        func_800A76E8((u16)side, buttons);
        break;
    }
}
