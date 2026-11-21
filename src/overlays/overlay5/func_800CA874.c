#include "types.h"

typedef struct {
    u8 pad00[0xA];
    u16 unkA;
    u8 padC;
    u8 unkD;
} Cursor;

typedef struct {
    u8 pad00[0xC];
    Cursor *cursor;
} Menu;

typedef struct {
    u8 pad00[0xC];
    s32 unkC;
} Inner;

typedef struct {
    u8 pad00[0xC];
    Inner *inner;
    u8 pad10[0x19];
    u8 unk29;
    u8 pad2A[0x42];
    Menu *menu;
} Widget;

typedef struct {
    u8 pad00[0xC];
    Widget *widget;
} Owner;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Sprite;

typedef struct {
    Owner *owner;
    u8 pad04[0xC];
    Sprite *box;
} Screen;

extern s16 D_80064A4A;
extern s32 D_800696D8;
extern u8 D_800718F8;
extern s8 D_800724A8;
extern s16 D_800740CA;
extern s16 D_800740E0;
extern s8 D_80074808;
extern s32 D_80086178;
extern u8 D_80086CE8;
extern u8 D_80087A94;
extern u8 D_8008951A;
extern u8 D_8008AFC6;
extern u8 D_800E70A0;
extern u8 D_800E70F0;
extern u8 D_800E7100;
extern u8 D_800E7120;

void func_8003FD70(void);
void func_8003FD84(void);
void func_800A2E4C(void *, s32);
void func_800BF1C8(void);
void func_800BF248(s32);
void overlay5_runtime_event_stop(Screen *);
void func_800D5E0C(Widget *, s32, u8, Sprite *);
void overlay5_runtime_stack_advance(void);
void func_800DF72C(void);
u32 overlay5_linked_index_get(void *);

void func_800CA874(Screen *screen, s32 controller, s16 button) {
    Widget *widget = screen->owner->widget;

    switch (button) {
    case 13:
        func_800D5E0C(widget, widget->inner->unkC, widget->unk29, screen->box);
        screen->box->flags |= 1;
        break;
    case 26:
        switch (widget->menu->cursor->unkA + widget->menu->cursor->unkD) {
        case 0:
            D_80064A4A = overlay5_linked_index_get(&D_800E70A0);
            break;
        case 5:
            D_80074808 = overlay5_linked_index_get(&D_800E70F0);
            break;
        case 8:
            D_8008AFC6 = overlay5_linked_index_get(&D_800E7120);
            if (D_8008AFC6 == 0) {
                func_800A2E4C(&D_80086CE8, D_80086178);
                D_8008951A = 0;
            }
            break;
        case 3:
            D_800740E0 = !D_800740E0;
            break;
        case 4:
            D_800724A8 = !D_800724A8;
            break;
        case 9:
            D_80087A94 ^= 1;
            break;
        case 1:
            D_800696D8 ^= 1;
            break;
        case 2:
            if (D_800740CA == 0) {
                func_8003FD70();
            } else {
                func_8003FD84();
            }
            break;
        case 6:
            switch (overlay5_linked_index_get(&D_800E7100)) {
            case 0:
                func_800BF248(0);
                break;
            case 1:
                func_800BF248(1);
                break;
            case 2:
                func_800BF248(3);
                break;
            case 3:
                func_800BF248(2);
                break;
            }
            func_800BF1C8();
            break;
        case 7:
            D_800718F8 = !D_800718F8;
            break;
        }
        break;
    case 12:
        overlay5_runtime_event_stop(screen);
        break;
    case 28:
        func_800DF72C();
        overlay5_runtime_stack_advance();
        break;
    }
}
