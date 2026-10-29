#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Sprite;

typedef struct {
    u8 pad00[8];
    s16 unk08;
    u8 pad0A[2];
    s32 unk0C;
} Inner;

typedef struct {
    u8 pad00[0xC];
    Inner *inner;
    u8 pad10[0x19];
    u8 unk29;
} Widget;

typedef struct {
    u8 pad00[0xC];
    Widget *widget;
} Owner;

typedef struct {
    Owner *owner;
    u8 pad04[0xC];
    Sprite *box;
} Screen;

extern u8 D_800BF540;

void func_800D5E0C(Widget *, s32, u8, Sprite *);
void func_800DF72C();
void func_800DD514(void *);
void func_800D5DA0(Screen *);
void func_80024F5C(void);
void func_8003EB78(void);
void func_8003A600(s32, s32);
void func_80094114(void);

void func_800A8330(Screen *screen, s32 controller, s16 button) {
    Widget *widget = screen->owner->widget;

    switch (button) {
        case 13:
            func_800D5E0C(widget, widget->inner->unk0C, widget->unk29, screen->box);
            screen->box->flags |= 1;
            break;
        case 8:
            if (widget->inner->unk08 == 1) {
                func_800DF72C();
            }
            break;
        case 28:
            func_800DF72C();
            func_800DD514(&D_800BF540);
            break;
        case 12:
            func_800D5DA0(screen);
            break;
        case 17:
            func_80024F5C();
            func_8003EB78();
            func_8003A600(0, 1);
            func_80094114();
            break;
    }
}
