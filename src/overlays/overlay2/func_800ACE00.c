#include "types.h"

typedef struct {
    u8 pad00[0x8];
    s16 unk08;
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
    u8 pad28[0x3C];
    s32 unk64;
} Screen;

void func_800DB478(Widget *);
void func_800DB0AC(Widget *, s32, s32);
Panel *func_800E09F8(void);
void func_800ACA00(Screen *, s32);

void func_800ACE00(Screen *screen) {
    Widget *widget;
    s16 count;

    widget = screen->panel->widget;
    widget->unk0D = 0;
    widget->unk0A = 0;
    count = screen->unk64;
    if (count != 0) {
        func_800DB478(widget);
        widget->unk08 = count;
        widget->unk0C = 6;
        func_800DB478(widget);
    } else {
        func_800DB478(widget);
        widget->unk08 = 1;
        widget->unk0C = 1;
    }
    func_800DB0AC(widget, 0, 0);
    if (func_800E09F8() != screen->panel) {
        func_800ACA00(screen, 0);
    }
}
