typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16;
typedef signed int s32; typedef unsigned int u32;

typedef struct Entry {
    s8 id;
    u8 pad1[3];
    s8 *name;
} Entry;

typedef struct List {
    u8 pad0[0xC];
    Entry entries[1];
} List;

typedef struct Table {
    s32 items[200];
    s16 count;
} Table;

typedef struct Team {
    u8 data[0x214C];
} Team;

typedef struct TeamPair {
    Team *home;
    s32 unk4;
    Team *away;
    s32 unkC;
} TeamPair;

typedef struct Slot {
    s8 *name;
    s32 unk4;
} Slot;

typedef struct Owner {
    u8 pad00[0x18];
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    u8 pad24[8];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[0x3C];
    s32 count74;
    s8 *unk78[1];
    s8 *unk7C[5];
    u8 pad90[4];
    void *unk94;
    void *unk98;
    u8 pad9C[0xC];
    void *unkA8;
} Owner;

typedef struct Resources {
    void *a;
    void *b;
    void *c;
    void *d;
} Resources;

typedef struct State {
    u8 pad00[0x24];
    void *resources[4];
    u8 pad34[0x10];
    s32 unk44;
} State;

extern s8 D_80072140[];
extern s32 D_8007214C;
extern s32 D_80072150;
extern s16 D_80072154;
extern s16 D_8007A2CC[];
extern Team D_80080CE5[];
extern s8 D_80084FA8;
extern TeamPair *D_8008512C;
extern s16 D_80085132;
extern Slot *D_80085134;
extern s16 D_80072146;
extern s16 D_80086168;
extern Resources D_800892E8;
extern s16 D_8008A6C2;
extern List *D_8008AF74;
extern s16 D_8008AFC8;
extern Table *D_8008B25C;
extern List D_800E6A6C;
typedef struct PairMenu {
    u8 mode;
    u8 active;
    u8 pad2[2];
    TeamPair *pair;
} PairMenu;

typedef struct SlotMenu {
    s8 count;
    u8 active;
    u8 pad2[2];
    Slot *slots;
} SlotMenu;

extern PairMenu D_800E6DEC;
extern u8 D_800E6E35;
extern SlotMenu D_800E6E3C;
extern s32 D_800E6E74[];
extern u8 D_800E6E90[];
extern s8 D_800E6E91;
extern s16 D_800E6EB2[];
extern s8 D_8006BC30[];
extern s8 D_8006BC34[];
extern s8 D_8006BC38[];

void func_8001F81C(s32, u16);
Table *func_800D3FF4(s32, s32, Entry *, s16, List *);
void *func_80032E00(s32, s32);
void func_800D5C1C(s32, Owner *, s32 *);
void func_800D54E4(s32);
State *func_800DD634(void);
void func_80016FF4(void *);
void func_800D6060(s32, u8 *, Owner *);

void func_800C925C(Owner *owner) {
    s32 *list;
    s8 i;
    s8 side = D_80084FA8;
    s8 limit;
    s8 *p;
    TeamPair *pair;
    State *state;

    D_80072154 = 0;
    D_8007A2CC[0] = side;
    D_8007A2CC[1] = 1 - side;
    func_8001F81C(0, D_8007A2CC[D_80072154]);
    list = &owner->count74;
    D_800E6DEC.active = 0;
    D_800E6E35 = 0;
    D_800E6E3C.active = 0;
    for (i = 1; i < 70; i++) {
        list[i] = 0;
    }
    D_8008AF74 = &D_800E6A6C;
    D_80072146 = 0;
    D_80086168 = 0;
    D_8008AFC8 = 0;
    D_80085132 = 0;
    D_8008B25C = func_800D3FF4(0x20002, 0x37, &D_8008AF74->entries[0], D_8007A2CC[D_80072154], D_8008AF74);
    while (D_8008AF74->entries[D_8008A6C2].id != -1) {
        D_8008A6C2++;
    }
    pair = func_80032E00(0, sizeof(TeamPair));
    D_8008512C = pair;
    pair->unk4 = 0;
    pair->unkC = 0;
    pair->home = &D_80080CE5[D_80084FA8];
    pair->away = &D_80080CE5[1 - D_80084FA8];
    D_800E6DEC.pair = pair;
    D_800E6DEC.mode = 2;
    D_80085134 = func_80032E00(0, D_8008A6C2 * sizeof(Slot));
    for (i = 0; i < D_8008A6C2; i++) {
        D_80085134[i].name = D_8008AF74->entries[i].name;
        D_80085134[i].unk4 = 0;
    }
    D_800E6E3C.count = D_8008A6C2;
    D_800E6E3C.slots = D_80085134;
    owner->unk18 = 0x250;
    owner->unk1C = 0;
    owner->unk20 = 0xFA;
    func_800D5C1C(0x240, owner, D_800E6E74);
    list[0] = 70;
    func_800D54E4(1);
    state = func_800DD634();
    state->resources[0] = D_800892E8.a;
    state->resources[1] = D_800892E8.b;
    state->resources[2] = D_800892E8.c;
    state->resources[3] = D_800892E8.d;
    func_80016FF4(D_800892E8.a);
    func_80016FF4(D_800892E8.b);
    func_80016FF4(D_800892E8.c);
    func_80016FF4(D_800892E8.d);
    D_800E6EB2[0] = D_8008A6C2 + 1;
    if (D_8008B25C->count == 0) {
        D_800E6E91 = 1;
        D_800E6EB2[0] = 1;
    } else {
        D_800E6E91 = D_8008B25C->count;
    }
    D_800E6E90[0] = 6;
    limit = 4;
    if (D_8008A6C2 < 4) {
        limit = D_8008A6C2;
    }
    for (i = 0; i < limit; i++) {
        owner->unk78[D_80072140[i]] = D_8008AF74->entries[i].name;
        p = D_8008AF74->entries[i].name;
        while (*p++ != 0) {
        }
        owner->unk7C[D_80072140[i]] = p;
    }
    owner->unk94 = D_8006BC30;
    owner->unk98 = D_8006BC34;
    owner->unkA8 = D_8006BC38;
    owner->unk34 = 0x258;
    owner->unk2C = 0;
    owner->unk30 = 0xFA;
    func_800D6060(0x248, D_800E6E90, owner);
    state->unk44 = 0;
    D_8007214C = -1;
    D_80072150 = 0;
}
