#include "types.h"

typedef struct {
    s32 unk0;
    s32 pos;
    s32 unk8;
    s32 unkC;
} Cursor;

typedef struct {
    u8 pad[0x14];
    s32 flags;
    u8 pad18[8];
    s32 unk20;
} Node;

typedef struct {
    u8 pad[0x3C];
    s32 list;
    Node *node;
    u8 pad44[0x24];
    s32 cur;
} Menu;

void func_8001ECAC(s32, s32, s32);
void func_8001F070(s32, s32, Cursor *);

/* Move the menu highlight to row `row`: clear the old row's three cells, re-anchor the cursor, highlight the new row. */
void func_80097144(Menu *menu, s32 row) {
    s32 list = menu->list;
    Node *node = menu->node;
    Cursor cursor;

    func_8001ECAC(list, menu->cur + 1, 0);
    func_8001ECAC(list, menu->cur + 5, 0);
    func_8001ECAC(list, menu->cur + 9, 0);
    cursor.pos = node->unk20 + 0x22;
    func_8001F070(list, row + 1, &cursor);
    node->unk20 = cursor.pos - 0x10;
    node->flags |= 1;
    func_8001ECAC(list, row + 1, 6);
    func_8001ECAC(list, row + 5, 6);
    func_8001ECAC(list, row + 9, 6);
    menu->cur = row;
}
