#include "types.h"

typedef struct { u8 pad00[4]; u8 text; u8 kind; u8 pad06[2]; } StatFormat;
typedef struct { u8 pad00[0x320]; u16 x320; } Roster;
typedef struct { s32 value; s32 unk4; } Pair;
typedef struct { u8 name[13]; } Name;
typedef struct {
    s8 count;
    u8 pad01[0x81];
    u8 used[8];
    u16 rows[8][49];
    u8 pad39A[0x40C - 0x39A];
    s8 dirty;
} SlotTable;
typedef struct { s32 count; s32 rows[1][4]; } List;
typedef struct { s16 unk0; s32 *unk4; s32 unk8; s32 unkC; s16 unk10; } Setup;
typedef struct { u8 pad00[0x14]; s32 flags; u8 pad18[8]; s32 unk20; } Node;
typedef struct {
    u8 pad00[0x24];
    s32 unk24;
    s32 unk28;
    s32 unk2C;
    s32 unk30;
    u8 pad34[0x10];
    s32 unk44;
} Menu;
typedef struct {
    u8 pad00[0x18];
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    u8 pad24[8];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[4];
    Node *unk3C;
    u8 pad40[0x20];
    List *unk60;
    s32 unk64;
    u8 pad68[0xC];
    s32 unk74[4];
    Name *unk84;
} Screen;
typedef struct { u8 unk0; u8 unk1; u8 pad02[0x20]; s16 unk22; } Panel;

extern u16 D_8006B9E0;
extern u16 D_8006B9E4[];
extern s8 D_8007A288;
extern u8 *D_8007A28C;
extern s32 D_8007A290;
extern List *D_8007A294;
extern char D_8007A298[];
extern char D_8007A2A0[];
extern u8 D_80080C28;
extern s32 D_80087AA8;
extern s32 D_800892E8[4];
extern Roster *D_8008B2B0[];
extern s32 D_800BDFAC;
extern s32 D_800BDFB0;
extern Panel D_800BFEFC;
extern Pair *D_800BFF28;
extern Pair *D_800BFF30;
extern s32 D_800BFF64;
extern s32 D_800BFF7C[];
extern StatFormat D_800BFFE0[];
extern Pair D_800BFFE8[];
extern s8 D_800C00E4[];
extern SlotTable D_800C4AD2;
extern Name D_800C4AD4[];
extern s8 D_800C4B3C[];
extern Pair *D_800C5060;
extern Pair *D_800C5064;
extern s16 D_800C507C;
extern Roster *D_800C5094;
extern u8 D_800C5CE8;
extern u8 D_800C5D32;

Node *func_8000D740(s32, u16, void *);
void func_80016FF4(s32);
void func_80024694(void);
void *func_80032E00(s32, u32);
s32 func_8003A720(s32, s32);
void func_80092B98(void);
void func_80094028(void);
void func_80094080(void);
void func_8009AD80(s32, s32);
void func_8009AE80(s32, s32);
Roster *func_800D40A4(s32, s32, u8 *, u8, s32, u8 *, s32);
void func_800D54E4(s32);
void func_800D5C1C(s32, Screen *, void *);
void func_800D6060(s32, void *, void *);
Menu *func_800DD634(void);

void func_8009989C(Screen *screen) {
    Setup setup;
    s32 *slots = screen->unk74;
    s16 i;
    s32 time;
    Menu *menu;
    Node *node;
    s32 text;
    Pair *pairs;
    s8 count;

    func_8003A720(1, 0);
    D_8006B9E0 = 0x1E;
    for (i = 0; i < 0x1E; i++) {
        D_8006B9E4[i] = i;
    }
    i = 0;
    func_80024694();
    func_80094028();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    while (i < 0x17) {
        D_8008B2B0[i] = func_800D40A4(0x1C100014, 0x63, &D_800BFFE0[0].text, D_800BFFE0[0].kind, 0, D_8007A28C, i);
        i++;
    }
    D_800C5094 = func_800D40A4(0x1C100014, 0x63, &D_800BFFE0[D_800C507C].text, D_800BFFE0[D_800C507C].kind, 0, D_8007A28C, D_800C5CE8);
    D_800BFEFC.unk1 = D_800C5094->x320;
    i = 0;
    func_80094080();
    D_800C5060 = func_80032E00(0, 0xB8);
    D_800C5064 = func_80032E00(0, 0x78);
    D_800BFF30 = D_800C5064;
    D_800BFF28 = D_800C5060;
    pairs = D_800BFF28;
    while (i < 0x17) {
        pairs[i].value = D_800BFF7C[i];
        pairs[i].unk4 = 0;
        i++;
    }
    i = 0;
    pairs = D_800C5064;
    while (i < 0xF) {
        pairs[i].value = D_800BFFE8[i].value;
        pairs[i].unk4 = 0;
        i++;
    }
    time = 0xFA;
    screen->unk18 = 0x660;
    screen->unk1C = 0;
    screen->unk20 = time;
    func_800D5C1C(0x650, screen, &D_800BFF64);
    screen->unk84 = &D_800C4AD4[D_8007A288];
    slots[0] = 0x4B;
    func_8009AD80(0, 0x43);
    func_8009AE80(0, 0x44);
    slots[0x43] = (s32)D_8007A298;
    slots[0x44] = (s32)D_8007A2A0;
    func_800D54E4(1);
    i = 0;
    menu = func_800DD634();
    menu->unk24 = D_800892E8[0];
    menu->unk28 = D_800892E8[1];
    menu->unk2C = D_800892E8[2];
    menu->unk30 = D_800892E8[3];
    func_80016FF4(D_800892E8[0]);
    func_80016FF4(D_800892E8[1]);
    func_80016FF4(D_800892E8[2]);
    func_80016FF4(D_800892E8[3]);
    D_800BFEFC.unk22 = 0x11;
    screen->unk34 = 0x668;
    screen->unk2C = 0;
    screen->unk30 = time;
    func_800D6060(0x658, &D_800BFEFC, screen);
    while (i < 5) {
        screen->unk74[D_800C00E4[i]] = D_800BFFE8[i].value;
        i++;
    }
    menu->unk44 = 0;
    screen->unk60 = D_8007A294;
    slots = (s32 *)screen->unk60;
    D_800BDFAC = -1;
    D_800BDFB0 = 0;
    D_80080C28 = 0;
    D_800C5D32 = 0;
    slots[0] = D_800C4AD2.count * 4;
    screen->unk64 = D_8007A290;
    text = screen->unk64;
    for (i = 0; i < D_800C4AD2.count; i++) {
        slots[i * 4 + 1] = text;
        text += 0x16;
        slots[i * 4 + 2] = text;
        text += 0x16;
        slots[i * 4 + 3] = text;
        text += 0x16;
        slots[i * 4 + 4] = text;
        text += 0x16;
    }
    if (D_800C4AD2.count == 4) {
        setup.unk0 = 0x630;
    } else {
        setup.unk0 = 0x638;
    }
    setup.unk10 = 2;
    setup.unk4 = slots;
    setup.unk8 = 0;
    node = func_8000D740(D_80087AA8, 1, &setup);
    node->unk20 = 0;
    screen->unk3C = node;
    node->flags &= ~1;
    D_800C5D32 = 1;
    count = D_800C4AD2.count;
    for (i = 0; i < count; i++) {
        if (D_800C4B3C[i] == 1) {
            D_800C5D32 = 0;
        }
    }
}
