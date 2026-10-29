#include "types.h"

typedef struct {
    u8 pad00[8];
    u16 count;
} List;

typedef struct {
    u8 pad00[0xC];
    void *list;
} Menu;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Panel;

typedef struct {
    u8 pad00[0x84];
    u8 *codes;
    u8 pad88;
    u8 ids[0x2A];
    s32 unkB4;
} Teams;

typedef struct {
    u8 pad00[0x24];
    Menu *menu;
    u8 pad28[0x10];
    Panel *panel;
    u8 pad3C[0x24];
    s32 scroll;
    s32 dir;
    Teams *teams;
} Screen;

typedef struct {
    s32 unk0;
    s16 unk4;
    s8 unk6;
    s8 unk7;
} Msg;

extern s16 D_80087A92;
extern s16 D_80087A68;
extern s16 D_800C5C3A;

void func_800DB220(Menu *, s32);
void func_800DB44C(void *, s32 *, s32 *, s32 *);
void func_800A4BC4(u16, Screen *);
void func_800A4FF8(Panel *, u8, Screen *);
void func_800DF72C();
void func_800DD4B8(void);
void func_800D63B4(Screen *);
void func_800DD82C(Msg *);
void func_80030C74(s32 *);
u16 func_80031A1C(s32);
void func_800A4754(u8);

void func_800A43B0(Screen *screen, s32 controller, s16 button) {
    Menu *m;
    void *menu;
    List *list;
    Teams *teams;
    Msg msg;
    s32 col;
    s32 row;
    s32 extra;
    s32 scroll;

    m = screen->menu;
    menu = m->list;
    list = menu;
    teams = screen->teams;
    if (screen->scroll != 0) {
        scroll = screen->scroll;
        if (scroll > 0) {
            func_800DB220(m, 1);
            scroll--;
        } else {
            func_800DB220(m, 0);
            scroll++;
        }
        func_800DB44C(menu, &col, &row, &extra);
        func_800A4BC4(row, screen);
        if (row == 0 || row == list->count - 1) {
            scroll = -scroll;
            screen->dir ^= 1;
        }
        screen->scroll = scroll;
    }
    switch (button) {
    case 13:
        func_800DB44C(menu, &col, &row, &extra);
        func_800A4FF8(screen->panel, col, screen);
        screen->panel->flags |= 1;
        break;
    case 19:
    case 20:
        func_800DB44C(menu, &col, &row, &extra);
        func_800A4BC4(row, screen);
        break;
    case 8:
    case 28:
        func_800DF72C();
        func_800DD4B8();
    case 17:
        func_800DB44C(menu, &col, &row, &extra);
        D_80087A92 = teams->ids[row];
        D_80087A68 = teams->codes[row];
        D_800C5C3A = 1;
        screen->scroll = 0;
        break;
    case 12:
        func_800D63B4(screen);
        msg.unk4 = 0x140;
        msg.unk6 = 0;
        msg.unk7 = 10;
        msg.unk0 = teams->unkB4;
        func_800DD82C(&msg);
        break;
    case 6:
    case 7:
        func_80030C74(&scroll);
        if (scroll == 9) {
            scroll = func_80031A1C(0x23) + 10;
            if (screen->dir != 0) {
                screen->scroll = -scroll;
            } else {
                screen->scroll = scroll;
            }
        }
        break;
    }
    func_800DB44C(menu, &col, &row, &extra);
    func_800A4754(teams->ids[row]);
}
