#include "types.h"

typedef struct {
    char *text;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
} Entry;

typedef struct Node {
    u8 pad00[0xC];
    struct Node *unk0C;
    u8 pad10[0x19];
    u8 unk29;
} Node;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
} Status;

typedef struct {
    Node *list;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
    Status *unk10;
    u8 pad14[0x64];
    s32 unk78;
} Item;

typedef struct {
    s16 unk00;
} SeasonSave;

extern s32 D_800BDF40[];
extern s16 D_800C48B6;
extern u16 D_800C5020[];
extern u16 D_800C5030[];
extern u16 D_800C5040[];
extern u16 D_800C5050[];
extern u16 D_800C5070[];
extern Entry *D_800C5080;
extern u16 D_800C5088[];
extern SeasonSave D_800C5098;
extern u8 D_800C509E[];
extern s16 D_800C5D48[];

extern void func_8001EC20(s32, s32);
s32 func_80030DF0(void);
char *func_8008DF68(s32);
void func_80094114(void);
s32 func_800B8B30(void);
u8 func_800B8BBC(s32 x);
u8 func_800B8C18(s32 x);
void func_800D5DA0(Item *);
void func_800D5E0C(Node *, s32, u8, Status *);
void func_800DF6EC(void);
void func_800DF72C(void);
s8 func_800DF780(Node *);
void func_800DF814(Node *, Entry *);

void func_800B85C0(Item *item, s32 arg1, s16 event) {
    Node *list = item->list;
    Node *node = list->unk0C;
    s32 row;
    s32 buttons;
    s32 i;

    row = func_800DF780(list);
    buttons = func_80030DF0();
    if (buttons & 0x200) {
        s32 n = (u16)row;

        func_800DF6EC();
        D_800C509E[D_800C5D48[n]] = func_800B8BBC(D_800C509E[D_800C5D48[n]]);
        D_800C5080[n].text = func_8008DF68(D_800C5D48[n]);
        func_800DF814(list, &D_800C5080[n]);
    }
    if (buttons & 0x100) {
        s32 n = (u16)row;

        func_800DF6EC();
        D_800C509E[D_800C5D48[n]] = func_800B8C18(D_800C509E[D_800C5D48[n]]);
        D_800C5080[n].text = func_8008DF68(D_800C5D48[n]);
        func_800DF814(list, &D_800C5080[n]);
    }
    if (buttons & 0x2020) {
        D_800C48B6 = D_800C48B6 > 0 ? D_800C48B6 - 1 : 5;
        func_800DF6EC();
        for (i = 0; (u16)i < 5; i++) {
            u16 n;

            switch (D_800C48B6) {
            case 0:
                D_800C5D48[(u16)i] = D_800C5030[(u16)i];
                break;
            case 1:
                D_800C5D48[(u16)i] = D_800C5020[(u16)i];
                break;
            case 2:
                D_800C5D48[(u16)i] = D_800C5070[(u16)i];
                break;
            case 3:
                D_800C5D48[(u16)i] = D_800C5050[(u16)i];
                break;
            case 4:
                D_800C5D48[(u16)i] = D_800C5040[(u16)i];
                break;
            case 5:
                D_800C5D48[(u16)i] = D_800C5088[(u16)i];
                break;
            }
            n = i;
            D_800C5080[n].text = func_8008DF68(D_800C5D48[n]);
            func_800DF814(list, &D_800C5080[n]);
        }
        item->unk78 = D_800BDF40[D_800C48B6];
        func_8001EC20(item->unk08, 1);
    }
    if (buttons & 0x10) {
        if (D_800C48B6 < 5) {
            D_800C48B6++;
        } else {
            D_800C48B6 = 0;
        }
        func_800DF6EC();
        for (i = 0; (u16)i < 5; i++) {
            u16 n;

            switch (D_800C48B6) {
            case 0:
                D_800C5D48[(u16)i] = D_800C5030[(u16)i];
                break;
            case 1:
                D_800C5D48[(u16)i] = D_800C5020[(u16)i];
                break;
            case 2:
                D_800C5D48[(u16)i] = D_800C5070[(u16)i];
                break;
            case 3:
                D_800C5D48[(u16)i] = D_800C5050[(u16)i];
                break;
            case 4:
                D_800C5D48[(u16)i] = D_800C5040[(u16)i];
                break;
            case 5:
                D_800C5D48[(u16)i] = D_800C5088[(u16)i];
                break;
            }
            n = i;
            D_800C5080[n].text = func_8008DF68(D_800C5D48[n]);
            func_800DF814(list, &D_800C5080[n]);
        }
        item->unk78 = D_800BDF40[D_800C48B6];
        func_8001EC20(item->unk08, 1);
    }
    switch (event) {
    case 13:
        func_800D5E0C(node, (s32)node->unk0C->unk0C, node->unk29, item->unk10);
        item->unk10->unk14 |= 1;
        break;
    case 12:
        func_800D5DA0(item);
        break;
    case 28:
        func_800DF72C();
        func_800B8B30();
        break;
    case 17:
        func_80094114();
        D_800C5098.unk00 = 0;
        break;
    }
}
