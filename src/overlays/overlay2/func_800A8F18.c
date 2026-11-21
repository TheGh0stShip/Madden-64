#include "types.h"

typedef struct {
    s8 id;
    u8 pad1[3];
    u8 *name;
} Item;

typedef struct {
    u8 pad00[0xC];
    Item items[1];
} Header;

typedef struct {
    u16 ids[400];
    s16 count;
} Table;

typedef struct {
    u8 *name;
    s32 unk4;
} Slot;

typedef struct {
    u8 pad00[8];
    u16 unk8;
    u8 pad0A[0xE];
    s16 unk18;
    s16 unk1A;
    u8 pad1C[0x28];
    s32 unk44;
} Menu;

typedef struct {
    u8 pad00[0xC];
    Menu *menu;
} Node;

typedef struct {
    u8 pad00[0xC];
    s32 unkC;
} Inner;

typedef struct {
    u8 pad00[0xC];
    Inner *inner;
    u8 pad10[0x19];
    u8 unk29;
} Obj;

typedef struct {
    u8 pad00[0xC];
    Obj *obj;
} Root;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Panel;

typedef struct {
    u8 pad00[0xD];
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u8 unk10;
    u8 pad11[0x13];
    u8 hi;
    u8 lo;
} Player;

typedef struct {
    u8 pad00[0x44];
    s32 unk44;
} Res;

typedef struct {
    Root *root;
    u8 pad04[0xC];
    Panel *panel;
    u8 pad14[0x10];
    Node *node;
    u8 pad28[0x10];
    Panel *panel2;
    u8 pad3C[0x3C];
    u8 *strs[6];
    void *unk90;
    u8 pad94[8];
    void *unk9C;
    void *unkA0;
    void *unkA4;
    u8 padA8[4];
    void *unkAC;
    u8 padB0[4];
    void *unkB4;
} Screen;

extern u16 D_8006B9E4[];
extern u8 D_8006BC68[];
extern u8 D_8006BFA0[];
extern u8 D_80080C90[];
extern s32 D_8008931C;
extern s32 D_800BDF10[];
extern s8 D_800BDFA0[];
extern s16 D_800BDFA6;
extern s32 D_800BDFAC;
extern s32 D_800BDFB0;
extern Header *D_800BDFB4[];
extern s8 D_800BF1D8;
extern s8 D_800BF1D9;
extern u8 D_800BF4CC[];
extern u8 D_800BF4DC[];
extern u8 D_800BF4EC[];
extern char D_800C3A08[];
extern u16 D_800C4EE8;
extern s16 D_800C5016;
extern s16 D_800C502A;
extern Header *D_800C505C;
extern s16 D_800C507C;
extern Table *D_800C5094;
extern Slot *D_800C5CE4;
extern s16 D_800C5D30;
extern char D_800C5D38[];
extern char D_800C5D40[];
extern u8 D_800E5EB8[];
extern void *D_800E6B78[];
extern s16 D_800E7A90;
extern s16 D_800E7A98;

void func_8000D834(s32, s32);
void func_800167FC(s32, char *);
void func_8001EC20(s32, s32);
void func_8001F25C(s32, s32, s32);
void func_8001F2B4(s32, Player *);
void *func_80022A3C(s32, u16);
s32 func_80022A88(s32, u16);
s32 func_80022AD8(s32, u16);
s32 func_80022B3C(s32, u16, s32);
s32 func_80024B90(u16);
void func_80032F3C(s32, void *);
s32 func_800397C8(s32, u16);
void func_8003A7DC(u16, u8 *);
void func_8003A8CC(u16, u8 *);
Player *func_8003AA28(u16);
void func_8003AE80(u8 *, u8 *);
void func_8003E850(u16, char *);
void func_800A9DC8(Panel *, s32, Screen *);
Table *func_800D3FF4(s32, s32, Item *, s32, Header *);
void func_800D5290(s16, s32);
void func_800D5DA0(Screen *);
void func_800D5E0C(Obj *, s32, u8, Panel *);
void func_800D63B4(Screen *);
void func_800DB0AC(Menu *, s32, s32);
void func_800DB44C(Menu *, s32 *, s32 *, s32 *);
void func_800DB478(Menu *);
void func_800DD4B8(void);
Res *func_800DD634(void);
void func_800DE84C(u8 *);
void func_800DF72C(void);
void func_800DF814(Root *, u8 *);
u8 *func_800E0124(Root *);
u32 func_800E0138(u8 *);
s32 func_800E0170(Root *);

void func_800A8F18(Screen *screen, s32 controller, s16 button) {
    Root *root;
    Menu *menu;
    s32 list;
    Player *player;
    Res *res;
    u8 *p;
    u8 *w;
    u32 n;
    s8 i;
    s8 count;
    s16 id;
    s32 col;
    s32 row;
    s32 extra;

    root = screen->root;
    menu = screen->node->menu;
    list = func_800E0170(root);
    func_800DB44C(menu, &col, &row, &extra);
    if (row != D_800BDFAC) {
        if (D_800C5094->count > 0) {
            if (D_800C5D30 == 0) {
                player = func_8003AA28(D_800C5094->ids[row * 2 + 1]);
                id = player->lo | (player->hi << 8);
                D_800E7A90 = id;
                func_800D5290(id, 0);
                screen->unk9C = player;
                func_800167FC(player->unkD, D_800C3A08);
                screen->unk90 = D_800C3A08;
                func_8003E850(player->unk10, D_800C5D38);
                screen->unkA0 = D_800C5D38;
                func_800167FC(player->unkF + 0x91, D_800C5D40);
                screen->unkA4 = D_800C5D40;
                screen->unkAC = D_800E6B78[player->unkE & 0x3F];
                func_8001F2B4(0, player);
            } else {
                screen->unk9C = func_80022A3C(0, D_800C5094->ids[row * 2 + 1]);
                func_800167FC((u8)func_80022A88(0, D_800C5094->ids[row * 2 + 1]), D_800C3A08);
                screen->unk90 = D_800C3A08;
                id = func_800397C8(0, D_800C5094->ids[row * 2 + 1]);
                D_800E7A90 = id;
                func_800D5290(id, 0);
                func_8003E850(func_80022B3C(0, D_800C5094->ids[row * 2 + 1], 1), D_800C5D38);
                screen->unkA0 = D_800C5D38;
                screen->unkAC = D_800E6B78[func_80022AD8(0, D_800C5094->ids[row * 2 + 1]) & 0x3F];
                func_800167FC((s16)func_80022B3C(0, D_800C5094->ids[row * 2 + 1], 0), D_800C5D40);
                screen->unkA4 = D_800C5D40;
            }
            func_8001EC20(list, 7);
            func_8001EC20(list, 0xA);
            func_8001EC20(list, 0xB);
            func_8001EC20(list, 0xC);
            func_8001EC20(list, 0xE);
            if (D_800C5D30 == 0) {
                if ((u8)func_80024B90(D_800C5094->ids[row * 2 + 1]) != 0xFF) {
                    func_8003A7DC((u8)func_80024B90(D_800C5094->ids[row * 2 + 1]), D_80080C90);
                    screen->unkB4 = D_80080C90 + 0x55;
                    func_8001F25C(0, (u8)func_80024B90(D_800C5094->ids[row * 2 + 1]), 0);
                } else {
                    screen->unkB4 = D_8006BC68;
                }
            } else {
                screen->unkB4 = D_80080C90 + 0x55;
            }
            func_8001EC20(list, 0x10);
            D_800BDFAC = row;
        }
        if (row != D_800BDFAC && D_800C5094->count == 0) {
            res = func_800DD634();
            if (res->unk44 != 0) {
                func_8000D834(D_8008931C, res->unk44);
                res->unk44 = 0;
                D_800E7A98 = -1;
            }
            screen->unk90 = D_8006BFA0;
            screen->unk9C = D_8006BFA0;
            screen->unkA0 = D_8006BFA0;
            screen->unkA4 = D_8006BFA0;
            screen->unkAC = D_8006BFA0;
            screen->unkB4 = D_8006BFA0;
            func_8001EC20(list, 7);
            func_8001EC20(list, 0xA);
            func_8001EC20(list, 0xB);
            func_8001EC20(list, 0xC);
            func_8001EC20(list, 0xE);
            func_8001EC20(list, 0x10);
            D_800BDFAC = row;
        }
    }
    if (extra != D_800BDFB0) {
        for (i = 0; i < 4; i++) {
            *(screen->strs + D_800BDFA0[i]) = D_800C505C->items[i + extra].name;
            p = D_800C505C->items[i + extra].name;
            while (*p++ != 0) {
            }
            *(screen->strs + D_800BDFA0[i] + 1) = p;
            func_8001EC20(menu->unk44, D_800BDFA0[i] + 1);
            func_8001EC20(menu->unk44, D_800BDFA0[i] + 2);
        }
        D_800BDFB0 = extra;
    }
    switch (button) {
    case 13:
        func_800D5E0C(screen->root->obj, screen->root->obj->inner->unkC, screen->root->obj->unk29, screen->panel);
        screen->panel->flags &= ~1;
        func_800A9DC8(screen->panel2, 0, screen);
        screen->panel2->flags |= 1;
        break;
    case 12:
        func_800D5DA0(screen);
        func_800D63B4(screen);
        break;
    case 26:
        w = func_800E0124(screen->root);
        n = (D_800C4EE8 != 0x5AA5 ? 9 : 0) | 1;
        if (w == D_800BF4CC) {
            if (func_800E0138(w) >= n) {
                D_800C5D30 = 1;
                func_80032F3C(0, D_800C5094);
                D_800C5016 = func_800E0138(w) - n;
                func_8003A7DC(D_8006B9E4[D_800C5016], D_80080C90);
                func_8003A8CC(D_8006B9E4[D_800C5016], D_80080C90 + 0x6C);
                func_8003AE80(D_80080C90 + 0x6C, D_80080C90 + 0xDA);
                D_800C5094 = func_800D3FF4(0x20002, 0x37, &D_800C505C->items[D_800C507C], 0, D_800C505C);
                func_800DB0AC(menu, 0, 0);
                menu->unk8 = D_800C5094->count;
                menu->unk18 = D_800C502A + 1;
                menu->unk1A = 0;
                if (D_800C5094->count == 0) {
                    menu->unk8 = 1;
                    menu->unk18 = 1;
                }
            } else {
                D_800C5D30 = 0;
                func_80032F3C(0, D_800C5094);
                D_800BDFA6 = func_800E0138(w);
                if (D_800C5D30 == 0) {
                    D_800C5094 = func_800D3FF4(D_800BDF10[D_800BDFA6] | 0x20004, 0x63, &D_800C505C->items[D_800C507C], 0, D_800C505C);
                } else {
                    D_800C5094 = func_800D3FF4(0x20002, 0x37, &D_800C505C->items[D_800C507C], 0, D_800C505C);
                }
                func_800DB0AC(menu, 0, 0);
                menu->unk8 = D_800C5094->count;
                menu->unk18 = D_800C502A + 1;
                menu->unk1A = 0;
                if (D_800C5094->count == 0) {
                    menu->unk8 = 1;
                    menu->unk18 = 1;
                }
            }
            func_800DB478(menu);
            D_800BDFAC = -1;
        }
        if (w == D_800BF4DC) {
            Header *header;

            func_80032F3C(0, D_800C5094);
            header = D_800BDFB4[func_800E0138(w)];
            D_800C507C = 0;
            D_800C505C = header;
            if (D_800C5D30 == 0) {
                D_800C5094 = func_800D3FF4(D_800BDF10[D_800BDFA6] | 0x20004, 0x63, &header->items[0], 0, header);
            } else {
                D_800C5094 = func_800D3FF4(0x20002, 0x37, &header->items[0], 0, header);
            }
            D_800C502A = 0;
            while (D_800C505C->items[D_800C502A].id != -1) {
                D_800C502A++;
            }
            count = 4;
            if (D_800C502A < 4) {
                count = D_800C502A;
            }
            menu->unk18 = D_800C502A + 1;
            for (i = 0; i < 4; i++) {
                if (i < count) {
                    *(screen->strs + D_800BDFA0[i]) = D_800C505C->items[i].name;
                    p = D_800C505C->items[i].name;
                    while (*p++ != 0) {
                    }
                    *(screen->strs + D_800BDFA0[i] + 1) = p;
                } else {
                    *(screen->strs + D_800BDFA0[i]) = D_8006BFA0;
                    *(screen->strs + D_800BDFA0[i] + 1) = D_8006BFA0;
                }
                func_8001EC20(menu->unk44, D_800BDFA0[i] + 1);
                func_8001EC20(menu->unk44, D_800BDFA0[i] + 2);
            }
            func_800DB0AC(menu, 0, 0);
            menu->unk8 = D_800C5094->count;
            menu->unk1A = 0;
            if (D_800C5094->count == 0) {
                menu->unk8 = 1;
                menu->unk18 = 1;
            }
            func_800DB478(menu);
            D_800BDFAC = -1;
            for (i = 0; i < D_800C502A; i++) {
                D_800C5CE4[i].name = D_800C505C->items[i].name;
                D_800C5CE4[i].unk4 = 0;
            }
            D_800BF1D9 = 0;
            D_800BF1D8 = D_800C502A;
            func_800DF814(root, D_800BF4EC);
        }
        if (w == D_800BF4EC) {
            func_80032F3C(0, D_800C5094);
            D_800C507C = func_800E0138(w);
            if (D_800C5D30 == 0) {
                D_800C5094 = func_800D3FF4(D_800BDF10[D_800BDFA6] | 0x20004, 0x63, &D_800C505C->items[D_800C507C], 0, D_800C505C);
            } else {
                D_800C5094 = func_800D3FF4(0x20002, 0x37, &D_800C505C->items[D_800C507C], 0, D_800C505C);
            }
            menu->unk8 = D_800C5094->count;
            if (D_800C5094->count == 0) {
                menu->unk8 = 1;
                menu->unk18 = 1;
            }
            func_800DB478(menu);
            D_800BDFAC = -1;
        }
        break;
    case 18:
        screen->panel2->flags ^= 1;
        break;
    case 8:
    case 28:
        func_800DF72C();
        func_800DE84C(D_800E5EB8);
        func_800DD4B8();
        break;
    }
}
