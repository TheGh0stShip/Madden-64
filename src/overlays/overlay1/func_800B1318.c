#include "types.h"

typedef struct {
    u8 data[0x28];
} RosterPlayer;

typedef struct {
    u16 slot[55];
    RosterPlayer players[55];
    u8 pad[0x214C - 0x6E - 55 * 0x28];
} RosterTeam;

typedef struct {
    s32 kind;
    RosterPlayer *first;
    RosterPlayer *second;
} PlayerPair;

typedef struct {
    u8 pad00[4];
    s32 team;
    s32 first;
    s32 second;
} PairRequest;

extern u8 D_8006B948[];
extern PlayerPair D_8006B98C;
extern s16 D_8006B9C2;
extern u8 D_8006E278[];
extern RosterTeam D_80080CFC[];
extern s16 D_800895D2;

void func_800AD460(void);
void func_8003DDF8(u8 *, PlayerPair *, u8 *, s32, s32);
s16 func_800AEFF8(s32, s16, u8 *, s32);
void func_800AEA9C(s32);

void func_800B1318(PairRequest *req) {
    s16 team;

    func_800AD460();
    team = req->team;
    D_8006B98C.kind = 2;
    D_8006B98C.first = &D_80080CFC[team].players[req->first];
    D_8006B98C.second = &D_80080CFC[team].players[req->second];
    func_8003DDF8(D_8006E278, &D_8006B98C, D_8006B948, 0xB4, D_800895D2);
    D_8006B9C2 = func_800AEFF8(0x60, team, D_8006B948, 0);
    func_800AEA9C(1);
}
