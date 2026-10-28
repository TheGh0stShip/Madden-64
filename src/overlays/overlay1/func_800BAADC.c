#include "types.h"

typedef struct {
    u8 unk00[0xD];
    u8 portrait;
    u8 kind;
    u8 unk0F[0x28 - 0xF];
} Player;

typedef struct {
    u16 slot[55];
    Player players[55];
    u8 status[55][3];
    u8 pad9AB[0xB64 - 0x9AB];
    s16 depth[(0x214C - 0xB64) / 2];
} Team;

typedef struct {
    u8 unk00[4];
    s32 shown;
    u8 unk08[8];
    s32 current;
} Panel;

typedef struct {
    u8 unk00[8];
    Panel *panel;
} Widget;

extern Widget *D_800718F4;
extern Team D_80080CFC[];
extern void *D_8006D560[];
extern s32 D_80086178;
extern u16 D_80086BE0;
extern s32 D_8008794C;
extern u16 D_80087988;
extern s16 D_80087AC2;
extern s32 D_8008A5EC;

void func_800167FC(u8, s32 *);
void func_80097D28(Widget *, void *, s32);
void func_80098158(Widget *, s32);

void func_800BAADC(void) {
    s32 buffer[2];
    Panel *panel;

    panel = D_800718F4->panel;
    if (D_8008A5EC == D_8008794C) {
    hide:
        if (panel->shown != 0) {
            func_80097D28(D_800718F4, 0, 0);
            func_80098158(D_800718F4, 0);
        }
        return;
    }
    if (D_8008A5EC == D_80086178) {
        goto hide;
    }
    if (panel->current == D_8008A5EC) {
        return;
    }
    func_80098158(D_800718F4, D_8008A5EC);
    switch (D_80087AC2) {
        case 0:
            func_80097D28(D_800718F4, &D_80080CFC[D_80087988].players[D_80080CFC[D_80087988].depth[D_80086BE0]], 0);
            break;
        case 1:
            func_800167FC(D_80080CFC[D_80087988].players[D_80080CFC[D_80087988].depth[D_80086BE0]].portrait, buffer);
            func_80097D28(D_800718F4, buffer, 0);
            break;
        case 3:
            func_80097D28(D_800718F4, D_8006D560[D_80080CFC[D_80087988].players[D_80080CFC[D_80087988].depth[D_80086BE0]].kind & 0x3F], 0);
            break;
        default:
            goto hide;
    }
}
