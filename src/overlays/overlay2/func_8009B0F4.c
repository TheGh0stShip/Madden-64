#include "types.h"
typedef struct { u8 pad00[0xE]; u8 group; } Player;
typedef struct { u8 pad00[4]; u8 text; u8 kind; u8 pad06[2]; } StatFormat;
typedef struct { u8 pad00[0x320]; u16 x320; } Roster;
typedef struct { u8 pad00[8]; u16 x08; } Panel;
typedef struct { u8 pad00[0xC]; Panel *panel; } Group;
typedef struct { u8 pad00[0x24]; Group *group; } Obj;
typedef struct { s32 *title; s32 *text; s32 *yes; s32 *no; s32 pad10[2]; s32 mode; s32 pad1C; } Dialog;
extern s8 D_8007A288;
extern u8 *D_8007A28C;
extern s8 D_800C0160[];
extern s8 D_800C0161[];
extern u16 D_800C4B5C[][49];
extern Roster *D_8008B2B0[];
extern StatFormat D_800BFFE0[];
extern Roster *D_800C5094;
extern s16 D_800C507C;
extern u8 D_800C5CE8;
extern s32 D_800BDFB0;
extern s32 D_800BDFAC;
extern s32 D_8006BCAC;
extern s32 D_8006BCC4;
extern s32 D_8006BCD8;
extern s32 D_8006BCE4;
Player *func_8003AA28(u16);
void func_800D67B8(Dialog *);
s16 func_800D6454(Dialog *);
void func_80032F3C(s32, Roster *);
Roster *func_800D40A4(s32, s32, u8 *, u8, s32, u8 *, s32);
void func_800DB0AC(Panel *, s32, s32);
void func_800DB478(Panel *);

s32 func_8009B0F4(s32 id, Obj *obj) {
    Dialog dialog;
    s32 group;
    u32 i;
    s32 found;
    Panel *panel;

    group = func_8003AA28(id)->group & 0x3F;
    found = -1;
    for (i = D_800C0160[group]; i < D_800C0161[group]; i++) {
        if (D_800C4B5C[D_8007A288][i] == 0xFFFF) {
            found = i;
            break;
        }
    }
    if (found == -1) {
        func_800D67B8(&dialog);
        dialog.title = &D_8006BCAC;
        dialog.text = &D_8006BCC4;
        dialog.yes = &D_8006BCD8;
        dialog.no = &D_8006BCE4;
        dialog.mode = 0;
        func_800D6454(&dialog);
        return 0;
    }
    D_800C4B5C[D_8007A288][found] = id;
    D_8007A28C[id] = 0xFF;
    func_80032F3C(0, D_8008B2B0[group]);
    D_8008B2B0[group] = func_800D40A4(0x1C100014, 0x63, &D_800BFFE0[0].text, D_800BFFE0[0].kind, 0, D_8007A28C, group);
    if (group == D_800C5CE8) {
        panel = obj->group->panel;
        func_80032F3C(0, D_800C5094);
        D_800C5094 = func_800D40A4(0x1C100014, 0x63, &D_800BFFE0[D_800C507C].text, D_800BFFE0[D_800C507C].kind, 0, D_8007A28C, D_800C5CE8);
        func_800DB0AC(panel, 0, 0);
        panel->x08 = D_800C5094->x320;
        func_800DB478(panel);
        D_800BDFB0 = 0xFFFF;
        D_800BDFAC = 0xFFFF;
    }
    return 1;
}
