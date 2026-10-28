#include "types.h"

typedef struct {
    u8 unk00[0xE];
    u8 position;
    u8 ratings[0x28 - 0xF];
} RosterPlayer;

typedef struct {
    u16 slot[55];
    RosterPlayer players[55];
    u8 pad906[0x20D0 - 0x906];
    s32 unk20D0;
    s32 unk20D4;
    s32 unk20D8;
    u8 pad20DC[0x214C - 0x20DC];
} RosterTeam;

typedef struct {
    s32 kind;
    RosterPlayer *player;
    RosterPlayer *cards[3];
} CardView;

typedef struct {
    u8 pad00[4];
    s32 team;
    s32 player;
} CardRequest;

typedef struct {
    s32 v[4];
} Scratch;

extern s32 D_8006B968;
extern s32 D_8006B96C;
extern s32 D_8006B970;
extern s32 D_8006B974;
extern CardView D_8006B98C;
extern s16 D_8006B9C2;
extern RosterTeam D_80080CFC[];
extern RosterPlayer D_80085A80[];

void func_8001AEA8(s32 *);
void func_8001F2B4(s32, RosterPlayer *);
void func_8001F81C(s32, u16);
void func_8002AC68(s32, s32, RosterPlayer **, Scratch *);
void func_8002B1B8(s32, s32, Scratch *, s32);
u16 func_800397C8(u16, u16);
void func_800AE5C4(u16);
u16 func_800AE65C(void);
void func_800AEA9C(s32);
void func_800AEAD0(void);
s16 func_800AEB2C(s32, CardView *, s32);

void func_800B3310(CardRequest *req) {
    s32 team;
    s32 player;
    s32 id;
    s32 v;
    RosterPlayer *p;
    Scratch scratch;

    team = req->team;
    player = req->player;
    func_8001AEA8(&D_8006B968);
    do {
        D_8006B96C = 0;
        D_8006B974 = 0;
        D_8006B970 = D_80080CFC[team].unk20D0;
        id = func_800397C8(team, player);
        if (id == 0) {
            id = 0x631;
        }
        func_800AEAD0();
    } while (0);
    if (id != func_800AE65C()) {
        func_800AE5C4(id);
        func_800AEAD0();
    }
    v = D_80080CFC[team].unk20D8;
    p = &D_80080CFC[team].players[player];
    D_8006B98C.kind = 4;
    D_8006B98C.player = p;
    D_8006B98C.cards[0] = &D_80085A80[0];
    D_8006B98C.cards[1] = &D_80085A80[1];
    D_8006B98C.cards[2] = &D_80085A80[2];
    D_8006B974 = v;
    func_8002B1B8(team, player, &scratch, v);
    func_8002AC68(D_80080CFC[team].players[player].position & 0x3F, 3, D_8006B98C.cards, &scratch);
    func_8001F2B4(0, p);
    func_8001F81C(0, team);
    D_8006B9C2 = func_800AEB2C(0xB0, &D_8006B98C, 3);
    func_800AEA9C(1);
}
