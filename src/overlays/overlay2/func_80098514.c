#include "types.h"

typedef struct {
    u8 unk_00[0x3C];
    s32 unk_3C;
    s32 unk_40;
    u8 unk_44[0x1C];
    s32 index;
    u8 unk_64[0xC];
    s32 unk_70;
    u8 unk_74[0x24];
    s32 unk_98[4];
    u8 *unk_A8;
} Menu;

typedef struct {
    s32 id;
    s16 unk_04;
    s8 unk_06;
    s8 unk_07;
} MenuMsg;

extern s32 D_80087938;
extern s8 D_800C4B3C[];
extern s8 D_800C4AD2;
extern s32 D_800C010C[];
extern u8 D_800BFEC8[];
extern s8 D_800C5CE8;
extern s16 D_800C507C;
extern s8 D_8007A288;
extern u8 *D_8007A28C;
extern void *D_8007A290;
extern void *D_8007A294;
extern s8 D_800BFF25;
extern s8 D_800BFF2D;

void func_800DD634(void);
s32 func_80030DF0(void);
void func_800A3FD4(s32, s32);
void func_80098CD4(Menu *, s32);
void func_800DF72C(void);
void func_800DF6EC(void);
void func_800DD514(u8 *);
void *func_80032E00(s32, s32);
void func_80033308(s32, void *, s32, s32);
void func_800DD7E8(MenuMsg *);
s32 func_80098B8C(s32);
s32 func_80098BD0(s32);
void func_8001EC20(s32, s32);
void func_80098C10(u8);

void func_80098514(void *arg0, s32 arg1, s16 event) {
    Menu *menu = arg0;
    MenuMsg msg;
    s32 first;
    s32 second;
    s32 buttons;
    u32 i;

    func_800DD634();
    first = menu->unk_3C;
    second = menu->unk_40;
    buttons = func_80030DF0();
    func_800A3FD4(0, D_80087938);
    if (event == 0xD) {
        func_80098CD4(menu, 0);
        menu->unk_70 = 0;
    }
    if ((menu->unk_70 == 1) | (event == 0xC)) {
        return;
    }
    if (D_800C4B3C[menu->index] == 0) {
        func_800DF72C();
        if (menu->index == 3) {
            func_800DD514(D_800BFEC8);
            D_800C5CE8 = 0;
            D_800C507C = 0;
            D_8007A288 = 0;
            D_8007A28C = func_80032E00(0, 0x17E5);
            D_8007A290 = func_80032E00(0, D_800C4AD2 * 0x58);
            D_8007A294 = func_80032E00(0, 0x84);
            func_80033308(0, D_8007A294, 0x84, 0);
            for (i = 0; i < 0x17E5; i++) {
                D_8007A28C[i] = 0;
            }
            msg.unk_04 = 0xF0;
            msg.unk_06 = 2;
            D_800BFF25 = 0;
            D_800BFF2D = 0;
            msg.unk_07 = 0xA;
            msg.id = first;
            func_800DD7E8(&msg);
            msg.id = second;
            func_800DD7E8(&msg);
        } else {
            menu->index++;
            D_800C4B3C[menu->index + 8] = func_80098B8C(0) + 0x7D;
            menu->unk_A8 = (u8 *)&D_800C4B3C[menu->index * 13 - 0x68];
            func_8001EC20(first, 0xD);
            menu->unk_98[menu->index] = D_800C010C[(u8)D_800C4B3C[menu->index + 8]];
            func_8001EC20(first, menu->index + 9);
            func_80098C10(D_800C4B3C[menu->index + 8]);
            func_80098CD4(menu, menu->index);
        }
    } else if (buttons & 0x9000) {
        func_800DF72C();
        if (menu->index == 3) {
            D_800C5CE8 = 0;
            D_800C507C = 0;
            func_800DD514(D_800BFEC8);
            D_800BFF25 = 0;
            D_800BFF2D = 0;
            D_8007A28C = func_80032E00(0, 0x17E5);
            D_8007A290 = func_80032E00(0, D_800C4AD2 * 0x58);
            D_8007A294 = func_80032E00(0, 0x84);
            func_80033308(0, D_8007A294, 0x84, 0);
            for (i = 0; i < 0x17E5; i++) {
                D_8007A28C[i] = 0;
            }
            msg.unk_04 = 0xF0;
            msg.unk_06 = 2;
            D_8007A288 = 0;
            msg.unk_07 = 0xA;
            msg.id = first;
            func_800DD7E8(&msg);
            msg.id = second;
            func_800DD7E8(&msg);
        } else {
            menu->index++;
            D_800C4B3C[menu->index + 8] = func_80098B8C(0) + 0x7D;
            menu->unk_A8 = (u8 *)&D_800C4B3C[menu->index * 13 - 0x68];
            func_8001EC20(first, 0xD);
            menu->unk_98[menu->index] = D_800C010C[(u8)D_800C4B3C[menu->index + 8]];
            func_8001EC20(first, menu->index + 9);
            func_80098C10(D_800C4B3C[menu->index + 8]);
            func_80098CD4(menu, menu->index);
        }
    }
    if (buttons & 0x200) {
        func_800DF6EC();
        D_800C4B3C[menu->index + 8] = func_80098BD0((u8)D_800C4B3C[menu->index + 8] - 0x7D) + 0x7D;
        menu->unk_98[menu->index] = D_800C010C[(u8)D_800C4B3C[menu->index + 8]];
        func_8001EC20(first, menu->index + 9);
        func_80098C10(D_800C4B3C[menu->index + 8]);
    }
    if (buttons & 0x100) {
        func_800DF6EC();
        D_800C4B3C[menu->index + 8] = func_80098B8C((u8)D_800C4B3C[menu->index + 8] - 0x7D) + 0x7D;
        menu->unk_98[menu->index] = D_800C010C[(u8)D_800C4B3C[menu->index + 8]];
        func_8001EC20(first, menu->index + 9);
        func_80098C10(D_800C4B3C[menu->index + 8]);
    }
    if (event == 0x11) {
        msg.unk_04 = 0xF0;
        msg.unk_06 = 2;
        msg.unk_07 = 0xA;
        msg.id = first;
        func_800DD7E8(&msg);
        msg.id = second;
        func_800DD7E8(&msg);
    }
}
