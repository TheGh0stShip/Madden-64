#include "types.h"

typedef struct {
    u8 pad00[4];
    s32 unk4;
    u8 pad08[4];
    s32 unkC;
} Node;

typedef struct {
    u8 pad00[4];
    Node *unk4;
    u8 pad08[4];
    Node *unkC;
    u8 pad10[0x19];
    u8 sel;
} Widget;

typedef struct {
    u8 pad00[0xC];
    Widget *widget;
} Menu;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Panel;

typedef struct {
    Menu *menu;
    u8 pad04[0xC];
    Panel *panel;
    u8 pad14[0x4C];
    s32 home;
    s32 away;
} Screen;

typedef struct {
    s32 unk0;
    s16 unk4;
    s8 unk6;
    s8 unk7;
} Msg;

extern s32 D_80087938;
extern u16 D_800892B4[];
extern u8 D_800E5EB0;
extern s32 D_80086C00[];

void *func_800DD634(void);
void func_800A3FD4(s32, s32);
void func_800D5E0C(Widget *, s32, u8, Panel *);
u8 func_80092BD0(u8, s32, s32);
u8 func_80092CFC(u8, s32, s32);
void func_800A3D84(Screen *, u16, s32);
void func_800DF72C();
void func_800A3E7C(void);
void func_800D5DA0(Screen *);
void func_800DD82C(Msg *);
void func_80030C74(s32 *);
u16 func_80031A1C(s32);
void func_800DF6EC(void);
void func_80092B98(void);

void func_800A34C0(Screen *arg0, Menu *menu, s16 button) {
    Screen *screen;
    Widget *widget;
    Msg msg;
    s32 n;
    u16 i;
    s16 j;
    u8 sel;

    func_800DD634();
    func_800A3FD4(0, D_80087938);
    func_800A3FD4(1, D_80087938);
    screen = arg0;
    switch (button) {
    case 13:
        widget = screen->menu->widget;
        func_800D5E0C(widget, widget->unkC->unkC, widget->sel, screen->panel);
        screen->panel->flags |= 1;
        break;
    case 2:
        widget = menu->widget;
        sel = widget->sel;
        i = sel;
        if (i < 3) {
            if (sel != 0) {
                i--;
                D_800892B4[i] = func_80092BD0(D_800892B4[i], 0x7D, 0);
                func_800A3D84(screen, i, widget->unk4->unk4);
            }
        }
        break;
    case 3:
        widget = menu->widget;
        sel = widget->sel;
        i = sel;
        if (i < 3) {
            if (sel != 0) {
                i--;
                D_800892B4[i] = func_80092CFC(D_800892B4[i], 0x7D, 0);
                func_800A3D84(screen, i, widget->unk4->unk4);
            }
        }
        break;
    case 28:
        func_800DF72C();
        D_800E5EB0 = 1;
        func_800A3E7C();
    case 8:
    case 17:
        screen->home = 0;
        screen->away = 0;
        break;
    case 12:
        func_800D5DA0(screen);
        msg.unk4 = 0xFA;
        msg.unk6 = 2;
        msg.unk7 = 10;
        for (j = 0; j < 8; j++) {
            msg.unk0 = D_80086C00[j];
            func_800DD82C(&msg);
        }
        break;
    case 6:
    case 7:
        func_80030C74(&n);
        if (n == 9) {
            screen->home = func_80031A1C(0x23) + 10;
            screen->away = func_80031A1C(0x23) + 7;
        }
        break;
    }
    if (screen->home != 0) {
        func_800DF6EC();
        n = func_80031A1C(5);
        while (n-- != 0) {
            D_800892B4[0] = func_80092CFC(D_800892B4[0], 0x7D, 0);
        }
        func_80092B98();
        if (screen->away == 0) {
            func_80092B98();
        }
        widget = menu->widget;
        func_800A3D84(screen, 0, widget->unk4->unk4);
        screen->home--;
    }
    if (screen->away != 0) {
        func_800DF6EC();
        n = func_80031A1C(5);
        while (n-- != 0) {
            D_800892B4[1] = func_80092CFC(D_800892B4[1], 0x7D, 0);
        }
        func_80092B98();
        if (screen->home == 0) {
            func_80092B98();
        }
        widget = menu->widget;
        func_800A3D84(screen, 1, widget->unk4->unk4);
        screen->away--;
    }
}
