#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Sprite;

typedef struct {
    u8 pad00[0xC];
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
    u8 pad04[4];
    Sprite *cursor;
    u8 pad0C[4];
    Sprite *box;
    u8 pad14[0x4C];
    u32 idle;
    s32 state;
    u32 blink;
    s32 done;
    u8 pad70[0x30];
    Sprite *prompt;
} Screen;

typedef struct {
    u8 pad00[0x62];
    u8 unk62;
} Team;

extern s16 D_80087A60;
extern s16 D_80087A68;
extern s16 D_80087A92;
extern s32 D_80088090;
extern s16 D_800892B4[2];
extern s16 D_800892B6;
extern s32 D_8008931C;
extern s32 D_80089490;
extern s16 D_80089598;
extern s16 D_8008959A;
extern s16 D_8008A5B0;
extern volatile u16 D_8008A5B4;
extern u8 D_800BEF98;
extern void *D_800BEFA4;
extern u8 D_800C125C;
extern s8 D_800C5D44;

s32 func_8000C8A0(s32);
void func_8000D834(s32, Sprite *);
void func_8000D874(s32, Sprite *);
s32 func_80030DF0(void);
s16 func_80031A1C(s32);
Team *func_8003A7B8(u16);
void func_80092B98(void);
void func_800D5E0C(Widget *, s32, u8, Sprite *);
void func_800DD514(void *);
void func_800DD5B8(void *);
void func_800DED64(s32, s32);
void func_800DF72C(void);
void func_800E08A4(Owner *);

void func_800A2550(Screen *screen_arg, s32 controller_arg, s16 button_arg) {
    s32 controller = controller_arg;
    s16 button = button_arg;
    Screen *screen = screen_arg;
    s16 pressed = button;
    Widget *widget;
    Owner *owner;
    s16 *away;

    if (screen->state == 1) {
        widget = screen->owner->widget;
        func_800D5E0C(widget, widget->inner->unk0C, widget->unk29, screen->box);
        screen->state = 2;
        D_800BEFA4 = &D_800C125C;
    }
    switch (button) {
    case 12:
        break;
    case 13:
        widget = screen->owner->widget;
        func_800D5E0C(widget, widget->inner->unk0C, widget->unk29, screen->box);
        screen->box->flags |= 1;
        break;
    case 28:
        if (screen->state != 0) {
            goto controller_busy;
        }
        func_800DF72C();
        func_80092B98();
        func_80092B98();
        func_8000D874(func_8000C8A0(D_80088090), screen->prompt);
        func_8000D834(D_8008931C, screen->prompt);
        D_8008A5B0 = 2;
        owner = *(Owner **)(void *)screen;
        screen->prompt = 0;
        screen->state = 1;
        func_800E08A4(owner);
        screen->cursor->flags |= 1;
        screen->box->flags |= 1;
        goto button_done;
controller_busy:
        func_800DED64(controller, 8);
button_done:
        break;
    }
    if (screen->state == 0) {
        screen->blink += D_8008A5B4;
        if (screen->blink >= 0x2E) {
            screen->blink = 0;
            screen->prompt->flags ^= 1;
        }
    }
    if (D_800C5D44 == 1) {
        func_800DD5B8(&D_800BEF98);
        D_800C5D44 = 2;
    }
    if (func_80030DF0() != 0) {
        screen->idle = 0;
        return;
    }
    if (pressed == 0x19) {
        screen->idle += D_8008A5B4;
        if (screen->idle >= 0x709) {
            screen->idle = 0;
            D_800892B6 = D_800892B4[0] = func_80031A1C(0x1D);
            away = &D_800892B4[1];
            do {
                *away = func_80031A1C(0x1D);
            } while (away[-1] == *away);
            D_80089490 = -1;
            D_80087A60 = 300;
            D_80089598 = 0;
            D_8008959A = 0;
            D_8008A5B0 = 4;
            D_80087A92 = func_8003A7B8(D_800892B6)->unk62;
            D_80087A68 = func_80031A1C(5);
            func_800DD514(0);
            screen->done = 1;
        }
    } else {
        screen->idle = 0;
    }
}
