#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 w;
    s32 h;
} Cursor;

typedef struct {
    u8 pad00[0x20];
    s32 y;
} Widget;

typedef struct {
    u8 pad00[0x20];
    s32 busy;
} Menu;

typedef struct {
    u8 pad00[0x28];
    Menu *menu;
} Owner;

void func_8001F070(Menu *, s32, Cursor *);

void func_800B0D9C(Widget *widget, u8 item, Owner *owner) {
    Menu *menu = owner->menu;
    Cursor cursor;

    if (menu->busy == 0) {
        cursor.y = widget->y + 0x10;
        func_8001F070(menu, item + 1, &cursor);
        widget->y = cursor.y - 0x10;
    }
}
