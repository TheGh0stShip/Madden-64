#include "types.h"

typedef struct {
    s32 mode;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC[2];
    u16 unk10[2];
    u8 unk14;
    char unk15[1];
} Roster;

typedef struct {
    u8 pad0[0x22];
    u8 unk22;
    u8 pad23;
    u8 unk24;
    u8 unk25;
} Team;

typedef struct {
    u8 pad0[0xC];
    void *panel;
} Holder;

typedef struct {
    s32 count;
    char *line[181];
} Sub;

typedef struct {
    u8 pad0[0x24];
    Holder *holder;
    u8 pad28[0x14];
    s32 unk3C;
    u8 pad40[0x20];
    Roster *unk60;
    u8 pad64[0x10];
    Sub sub;
} Owner;

extern void func_800AF050(Roster *);
extern void func_800945D8(u16, char *);
extern void func_8002E65C(char *, char *);
extern void func_8001EC20(s32, s32);
extern void func_800DB44C(void *, s32 *, s32 *, s32 *);
extern Team *func_8003AA28(u16);
extern void func_800AE6E0(s16, s16);
extern void func_8001F2B4(s32, Team *);

extern s16 D_80073D68;
extern char D_800C302C[];
extern char D_800C3024[];
extern u16 D_80080CFC[][4262];

void func_800AE460(Owner *owner) {
    Roster *roster;
    void *panel;
    s32 item;
    Sub *sub;
    s16 idx;
    Team *team;
    s32 a;
    s32 b;
    s32 c;

    roster = owner->unk60;
    panel = owner->holder->panel;
    item = owner->unk3C;
    func_800AF050(roster);
    idx = roster->unk14;
    func_800945D8(roster->unkC[roster->unk14], owner->sub.line[0]);
    sub = &owner->sub;
    if (roster->mode == 1 && roster->unk10[idx] >= 0x6EF && D_80073D68 != 0) {
        func_8002E65C(owner->sub.line[1], D_800C302C);
    } else {
        func_800945D8(roster->unk10[roster->unk14], sub->line[1]);
    }
    func_8001EC20(item, 1);
    func_8001EC20(item, 2);
    func_800DB44C(panel, &a, &b, &c);
    team = func_8003AA28(D_80080CFC[roster->unk14][b]);
    func_800945D8(team->unk22, sub->line[104]);
    func_8001EC20(item, 0x69);
    func_800AE6E0((team->unk24 << 8) | team->unk25, 1);
    func_8001F2B4(0, team);
    switch (roster->mode) {
    case 0:
        func_8002E65C(sub->line[2], (char *)team);
        func_8001EC20(item, 3);
        func_8002E65C(sub->line[3], D_800C3024);
        func_8001EC20(item, 4);
        sub->line[73] = 0;
        func_8001EC20(item, 0x4A);
        break;
    case 1:
        if (roster->unk4 == roster->unk6 && roster->unk8 == (u16)b) {
            func_8002E65C(sub->line[3], D_800C3024);
        } else {
            func_8002E65C(sub->line[3], (char *)team);
        }
        func_8001EC20(item, 4);
        sub->line[73] = roster->unk15;
        func_8001EC20(item, 0x4A);
        break;
    }
}
