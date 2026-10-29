#include "types.h"

#define NULL 0

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
    u8 pad00[0x18];
    Menu *menu;
    u8 pad1C[4];
    Widget *target;
} Info;

typedef struct {
    u8 pad00[0x60];
    Info *info;
} Owner;

void func_8001F070(Menu *, s32, Cursor *);

void func_800B1440(Widget *widget, u8 item, Owner *owner) {
    Info *info = owner->info;
    Menu *menu = info->menu;
    Widget *target = info->target;
    Cursor cursor;

    if (menu != NULL && target != NULL && menu->busy == 0) {
        cursor.y = widget->y + 0x10;
        func_8001F070(menu, item + 0x22, &cursor);
        target->y = cursor.y - 0x10;
    }
}
