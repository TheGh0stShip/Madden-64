#include "types.h"

typedef struct {
    s32 count;
    s32 entries[0xB5];
} Table;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Window;

typedef struct {
    u8 pad00[0xA0];
    Window *window;
    void *screen;
    Table *table;
} Panel;

typedef struct {
    u8 pad00[0x60];
    Panel *panel;
    u8 pad64[0x10];
    Table table;
} Item;

typedef struct {
    u8 pad00[0x44];
    s32 busy;
} Screen;

typedef struct {
    s16 kind;
    s32 table;
    s32 flags;
    s32 pad0C;
    s16 rows;
} WindowDesc;

extern s32 D_80087AA4;

s32 func_8000C8A0(s32);
Window *func_8000D740(s32, s32, WindowDesc *);
void func_80024694(void);
Panel *func_80032E00(s32, s32);
void func_800B9990(Panel *);
void func_800D54E4(s32);
void func_800D6424(Window *, s32, s32, s32);
Screen *func_800DD634(void);
void func_800DD694(s32, s32, s32);

/* Opens the item's list panel: clears its 0xB5-entry table and creates its window. */
void func_800B9704(Item *item) {
    Screen *screen;
    Table *table;
    Panel *panel;
    WindowDesc desc;
    u32 i;

    screen = func_800DD634();
    table = &item->table;
    table->count = 0xB5;
    i = 0;
    do {
        table->entries[(u16)i] = 0;
        i++;
    } while ((u16)i < 0xB4);
    table->entries[(u16)i] = 0;
    panel = func_80032E00(0, 0xAC);
    item->panel = panel;
    panel->screen = screen;
    panel->table = table;
    desc.kind = 0x2D8;
    desc.table = (s32)table;
    desc.flags = 0;
    desc.rows = 7;
    panel->window = func_8000D740(func_8000C8A0(D_80087AA4), 1, &desc);
    func_800DD694(0x6D, 0x11, 4);
    screen->busy = 0;
    func_800D54E4(1);
    func_80024694();
    func_800B9990(panel);
    panel->window->x = 0;
    panel->window->y = 0xFA;
    func_800D6424(panel->window, 0, 3, 0xA);
}
