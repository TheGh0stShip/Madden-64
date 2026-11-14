#include "types.h"

typedef struct {
    u8 pad00[0xA];
    s16 unk0A;
    u8 unk0C;
    u8 unk0D;
} Widget;

typedef struct {
    u8 pad00[0xC];
    Widget *widget;
} Panel;

typedef struct {
    u8 pad00[0x24];
    Panel *panel;
    u8 pad28[0x3E];
    u16 unk66;
} Screen;

void func_800DB0AC(Widget *, s32, s32);
void func_800AF0DC(Screen *, s32, u8);
Panel *func_800E09F8(void);
void func_800ACA00(Screen *, s32);

void func_800ACA58(Screen *screen, s32 kind) {
    Widget *widget;
    u16 value;

    widget = screen->panel->widget;
    func_800DB0AC(widget, 0, 0);
    widget->unk0D = 0;
    widget->unk0A = 0;
    value = screen->unk66;
    if (value != 0) {
        widget->unk0C = kind;
    }
    func_800AF0DC(screen, value, kind);
    if (func_800E09F8() != screen->panel) {
        func_800ACA00(screen, 0);
    }
}
