#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 unk8;
    s32 unkC;
} Cursor;

typedef struct {
    u8 pad[0x1C];
    s32 x1C;
    s32 x20;
} Node;

typedef struct {
    u8 pad[0x3C];
    s32 list;
    u8 pad40[4];
    Node *node;
    u8 pad48[0x18];
    s32 row;
    u8 pad64[8];
    s32 len;
} Menu;

typedef struct {
    u8 pad[0xC];
    u8 xC;
} Label;

extern u8 D_800C4AD4[][13];
extern s16 D_800895D2;

Label *func_8001B02C(s32);
void func_8001F070(s32, s32, Cursor *);
s32 func_80016A24(s32, u8 *);
s32 func_80016B70(s32, s32);

void func_8009723C(Menu *menu) {
    s32 list = menu->list;
    Node *node = menu->node;
    Label *label = func_8001B02C(0x6B8);
    Cursor cursor;
    u8 buf[13];
    u32 i;
    s32 w = 0;

    cursor.y = 0;
    cursor.x = 0;
    func_8001F070(list, menu->row + 5, &cursor);
    node->x20 = cursor.y + 4;
    for (i = 0; i < menu->len + 1; i++) {
        buf[i] = D_800C4AD4[menu->row][i];
    }
    buf[i] = 0;
    w = (s16)func_80016A24(D_800895D2, buf);
    node->x1C = cursor.x + w - (s16)func_80016B70(0, D_800C4AD4[menu->row][menu->len]);
    label->xC = func_80016B70(0, D_800C4AD4[menu->row][menu->len]) + 1;
}
