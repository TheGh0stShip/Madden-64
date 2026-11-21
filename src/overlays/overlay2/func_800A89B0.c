#include "types.h"

typedef struct {
    /* 0x00 */ s8 id;
    /* 0x01 */ u8 pad_01[3];
    /* 0x04 */ char *name;
} PlayEntry;

typedef struct {
    /* 0x00 */ u8 pad_00[0xC];
    /* 0x0C */ PlayEntry entries[1];
} PlayBook;

typedef struct {
    /* 0x00 */ u32 value;
    /* 0x04 */ u32 flags;
} ListItem;

typedef struct {
    /* 0x00 */ u8 count;
    /* 0x01 */ u8 selected;
    /* 0x02 */ u8 pad_02[2];
    /* 0x04 */ ListItem *items;
} MenuList;

typedef struct {
    /* 0x000 */ u8 pad_000[0x320];
    /* 0x320 */ s16 unk_320;
} PlayState;

typedef struct {
    /* 0x00 */ u8 pad_00[0x24];
    /* 0x24 */ s32 unk_24;
    /* 0x28 */ s32 unk_28;
    /* 0x2C */ s32 unk_2C;
    /* 0x30 */ s32 unk_30;
    /* 0x34 */ u8 pad_34[0x10];
    /* 0x44 */ s32 unk_44;
} Session;

typedef struct {
    /* 0x00 */ u8 pad_00[0x18];
    /* 0x18 */ s32 unk_18;
    /* 0x1C */ s32 unk_1C;
    /* 0x20 */ s32 unk_20;
    /* 0x24 */ u8 pad_24[8];
    /* 0x2C */ s32 unk_2C;
    /* 0x30 */ s32 unk_30;
    /* 0x34 */ s32 unk_34;
    /* 0x38 */ u8 pad_38[0x3C];
    /* 0x74 */ s32 unk_74[8];
    /* 0x94 */ void *unk_94;
    /* 0x98 */ void *unk_98;
    /* 0x9C */ u8 pad_9C[0xC];
    /* 0xA8 */ void *unk_A8;
} Screen;

extern s16 D_800BDFA6;
extern s8 D_800BDFA0[];
extern s32 D_800BDFAC;
extern s32 D_800BDFB0;
extern s32 D_800BDF10;
extern u32 D_800BDF34[];
extern MenuList D_800BF1C8[3];
typedef struct {
    /* 0x00 */ u8 unk_00;
    /* 0x01 */ u8 unk_01;
    /* 0x02 */ u8 pad_02[0x20];
    /* 0x22 */ u16 unk_22;
} Options;

extern Options D_800BF518;
extern u8 D_800BF4FC[];
extern u16 D_800C4EE8;
extern u8 D_800C4EEB;
extern s16 D_800C502A;
extern PlayBook *D_800C505C;
extern s16 D_800C507C;
extern PlayState *D_800C5094;
extern ListItem *D_800C5CDC;
extern s16 D_800C5CE0;
extern ListItem *D_800C5CE4;
extern s16 D_800C5D30;
extern PlayBook D_800E6100;
extern u16 D_8006B9E4[];
extern u8 D_8006BC30[];
extern u8 D_8006BC34[];
extern u8 D_8006BC38[];
extern s32 D_800892E8[4];

void func_80016FF4(s32 handle);
void func_80024694(void);
void *func_80032E00(s32 pool, s32 size);
s32 func_8003A7B8(u16 id);
void func_80094504(void);
PlayState *func_800D3FF4(s32 flags, s32 count, PlayEntry *entries, s32 d, PlayBook *book);
void func_800D54E4(s32 a);
void func_800D5C1C(s32 a, Screen *screen, void *c);
void func_800D6060(s32 a, void *b, Screen *screen);
Session *func_800DD634(void);
void func_800DD694(s32 a, s32 b, s32 c);

void func_800A89B0(Screen *screen) {
    s32 *slots;
    Session *session;
    u8 *name;
    s8 i;
    s8 first;
    s8 count;
    s8 n;

    slots = screen->unk_74;
    D_800BF1C8[0].selected = 0;
    D_800BF1C8[1].selected = 0;
    D_800BF1C8[2].selected = 0;
    func_800DD694(0x48, 0x11, 9);
    func_80094504();
    for (i = 1; i < 70; i++) {
        slots[i] = 0;
    }
    func_80024694();
    D_800C505C = &D_800E6100;
    D_800BDFA6 = 0;
    D_800C5D30 = 0;
    D_800C507C = 0;
    D_800C5CE0 = 0;
    D_800C5094 = func_800D3FF4(D_800BDF10 | 0x20004, 99, D_800E6100.entries, 0, &D_800E6100);
    D_800C502A = 0;
    while (D_800C505C->entries[D_800C502A].id != -1) {
        D_800C502A++;
    }
    if (D_800C4EE8 == 0x5AA5) {
        count = D_800C4EEB;
        first = 1;
    } else {
        first = 9;
        count = 30;
    }
    D_800C5CDC = func_80032E00(0, (first + 30) * 8);
    for (i = 0; i < first; i++) {
        D_800C5CDC[i].value = D_800BDF34[i];
        D_800C5CDC[i].flags = 0;
    }
    for (; i < count + first; i++) {
        D_800C5CDC[i].value = func_8003A7B8(D_8006B9E4[i - first]) + 0x55;
        D_800C5CDC[i].flags = 0;
    }
    D_800BF1C8[0].count = count + first;
    D_800BF1C8[0].items = D_800C5CDC;
    D_800C5CE4 = func_80032E00(0, D_800C502A * 8);
    for (i = 0; i < D_800C502A; i++) {
        D_800C5CE4[i].value = (u32)D_800C505C->entries[i].name;
        D_800C5CE4[i].flags = 0;
    }
    D_800BF1C8[2].count = D_800C502A;
    D_800BF1C8[2].items = D_800C5CE4;
    screen->unk_18 = 0x250;
    screen->unk_1C = 0;
    screen->unk_20 = 0xFA;
    func_800D5C1C(0x240, screen, D_800BF4FC);
    slots[0] = 70;
    func_800D54E4(1);
    session = func_800DD634();
    session->unk_24 = D_800892E8[0];
    session->unk_28 = D_800892E8[1];
    session->unk_2C = D_800892E8[2];
    session->unk_30 = D_800892E8[3];
    func_80016FF4(D_800892E8[0]);
    func_80016FF4(D_800892E8[1]);
    func_80016FF4(D_800892E8[2]);
    func_80016FF4(D_800892E8[3]);
    D_800BF518.unk_22 = D_800C502A + 1;
    if (D_800C5094->unk_320 == 0) {
        D_800BF518.unk_01 = 1;
        D_800BF518.unk_22 = 1;
    } else {
        D_800BF518.unk_01 = D_800C5094->unk_320;
    }
    D_800BF518.unk_00 = 6;
    if (D_800C502A < 4) {
        n = D_800C502A;
    } else {
        n = 4;
    }
    for (i = 0; i < n; i++) {
        *(D_800BDFA0[i] + 1 + screen->unk_74) = (s32)D_800C505C->entries[i].name;
        name = (u8 *)D_800C505C->entries[i].name;
        while (*name++ != 0) {
        }
        *(D_800BDFA0[i] + 2 + screen->unk_74) = (s32)name;
    }
    screen->unk_94 = D_8006BC30;
    screen->unk_98 = D_8006BC34;
    screen->unk_A8 = D_8006BC38;
    screen->unk_34 = 0x258;
    screen->unk_2C = 0;
    screen->unk_30 = 0xFA;
    func_800D6060(0x248, &D_800BF518, screen);
    session->unk_44 = 0;
    D_800BDFAC = -1;
    D_800BDFB0 = 0;
}
