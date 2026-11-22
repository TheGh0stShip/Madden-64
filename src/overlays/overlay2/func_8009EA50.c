#include "types.h"

typedef struct { u8 pad[0x14]; s32 rect[4]; } Disp;
typedef struct { u8 pad[0x14]; s32 flags; s32 pad18; s32 unk1C; s32 unk20; } Item;
typedef struct { s32 count; char *line[181]; } Sub;
typedef struct { s16 id; Sub *sub; s32 unk8; s32 unkC; s16 unk10; } Init;

typedef struct {
    u16 unk0[16];
    s16 unk20[16];
    u16 unk40;
} Roster;

typedef struct {
    u8 pad0[4];
    void *unk4;
    u8 pad8[8];
    s32 unk10;
    u8 pad14[0xC];
    void *unk20;
    void *unk24;
    void *unk28;
    u8 unk2C;
    u8 unk2D;
    u8 unk2E;
    u8 pad2F[2];
    u8 unk31;
    u8 pad32[0xA];
    Sub *unk3C;
    Disp *unk40;
    Item *unk44;
    Item *unk48;
    void *unk4C;
} Panel;

typedef struct {
    u8 pad0[0x24];
    void *unk24;
    Item *unk28;
    u8 pad2C[0xC];
    Item *unk38;
    u8 pad3C[0x24];
    Roster *unk60;
    u8 pad64[0x10];
    Sub sub;
} Owner;

typedef struct {
    s8 count;
} Count;

extern Count D_800C4EEB;
extern u16 D_80086190[];
extern s32 D_800892D8[4];
extern s32 D_80087AA8;
extern u8 D_80072580[];
extern u8 D_80072578[];
extern u8 D_8007257C[];

extern Disp *func_800DD634(void);
extern void *func_80032E00(s32, s32);
extern s16 func_8009F078(Roster *);
extern void func_8009F184(Roster *);
extern void func_800DB190(Panel *, s32, s32, s32);
extern void func_8009F308();
extern Item *func_8000D740(s32, s32, Init *);
extern void func_800DAF30(void *, Panel *);
extern void func_8009F238(Panel *, u16);
extern void func_800D6424(Item *, s32, s32, s32);

void func_8009EA50(Owner *owner) {
    Init init;
    Disp *d;
    Sub *sub;
    Roster *roster;
    Panel *panel;
    void *holder;
    Item *item;
    Item *item2;
    u16 i;

    d = func_800DD634();
    sub = &owner->sub;
    sub->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        sub->line[i] = 0;
    }
    sub->line[i] = 0;
    roster = func_80032E00(0, 0x42);
    owner->unk60 = roster;
    for (i = 0; i < (u16)D_800C4EEB.count; i++) {
        roster->unk0[i] = D_80086190[i];
        roster->unk20[i] = 0;
    }
    func_8009F078(roster);
    func_8009F184(roster);
    d->rect[0] = 0;
    d->rect[1] = 0;
    d->rect[2] = D_800892D8[2];
    d->rect[3] = D_800892D8[3];
    panel = func_80032E00(0, 0x50);
    holder = func_80032E00(0, 0x14);
    owner->unk24 = holder;
    func_800DB190(panel, 8, 3, D_800C4EEB.count);
    panel->unk31 = 6;
    panel->unk2E = 0x84;
    panel->unk2D = 0xFF;
    panel->unk2C = 0;
    panel->unk4 = func_8009F308;
    panel->unk20 = D_80072580;
    panel->unk24 = D_80072578;
    panel->unk28 = D_8007257C;
    panel->unk10 = 0;
    init.id = 0x5A8;
    init.sub = sub;
    init.unk8 = 0;
    init.unk10 = 7;
    item = func_8000D740(D_80087AA8, 1, &init);
    owner->unk28 = item;
    item->unk20 = 0xFA;
    item->unk1C = 0;
    init.id = 0x5B0;
    init.sub = 0;
    init.unk8 = 0;
    init.unk10 = 6;
    item2 = func_8000D740(D_80087AA8, 1, &init);
    item2->flags &= ~1;
    owner->unk38 = item2;
    panel->unk44 = item;
    panel->unk48 = item2;
    panel->unk3C = sub;
    panel->unk4C = owner;
    panel->unk40 = d;
    func_800DAF30(holder, panel);
    func_8009F238(panel, roster->unk40);
    func_800D6424(item, 0, 3, 0xA);
}
