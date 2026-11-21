#include "types.h"

typedef struct {
    u8 data[0x28];
} RosterPlayer;

typedef struct {
    u16 slot[55];
    RosterPlayer players[55];
    u8 pad906[0xB64 - 0x906];
    s16 order[(0x214C - 0xB64) / 2];
} RosterTeam;

typedef struct {
    s32 kind;
    s32 first;
    void *second;
    void *unk_C;
    void *unk_10;
    s32 unk_14;
    s32 unk_18;
} PlayerPair;

typedef struct {
    s32 unk_0;
    u16 unk_4;
    u16 pad6;
    s32 pad8;
} PlayEntry;

typedef struct {
    u8 pad0[0x1E];
    u8 team;
    u8 unk_1F;
} PlayObj;

typedef struct {
    s32 pad0;
    s32 unk_4;
    PlayObj *unk_8;
    s32 unk_C;
} PlayRequest;

extern PlayEntry D_80069ED8[];
extern u8 D_8006B948[];
extern PlayerPair D_8006B98C;
extern s16 D_8006B9C2;
extern s32 D_8006B9D4;
extern u8 D_8006BDBC[];
extern u8 D_8006BDC4[];
extern u8 D_8006E16C[];
extern u8 D_8006E184[];
extern u8 D_8006E194[];
extern u8 D_8006E1A0[];
extern s32 D_80080C10;
extern RosterTeam D_80080CFC[];
extern u8 D_80085A58[];
extern u16 D_80088472;
extern s16 D_80088AE4;
extern s16 D_800895D2;
extern s32 D_8008AF88;

void primary_handle_release(void);
s32 func_800AD124(PlayObj *);
s32 func_80031A1C(s32);
void func_800363F4(u16, s32, s32);
s32 func_800AE680(void);
void func_800B7DD8(s32, u16, PlayObj *, s32, s32);
void func_80041E54(s32);
void func_8004192C(s32);
void func_800167FC(u8, u8 *);
void func_8003DDF8(u8 *, PlayerPair *, u8 *, s32, s32);
s16 func_800AEFF8(s32, s16, u8 *, s32);
void func_800AEA9C(s32);

void func_800AC5F8(PlayRequest *req) {
    u8 *anim;
    s16 kind;
    u8 team;
    s32 handle;
    s16 t2;
    s32 k2;
    s32 flag;
    s16 len;

    primary_handle_release();
    D_8006B98C.kind = 6;
    kind = 0x60;
    D_8006B98C.unk_14 = func_800AD124(req->unk_8);
    team = req->unk_8->team;
    D_8006B98C.unk_10 = 0;
    D_8006B98C.unk_18 = D_8008AF88;
    func_800363F4(D_80088472, (u16)func_80031A1C(2) + 8, D_8006B9D4);
    handle = func_800AE680();
    func_800B7DD8(1, D_80069ED8[req->unk_4].unk_4, req->unk_8, 0, 0);
    if (req->unk_4 == 2) {
        if (D_80088AE4 == 0) {
            func_80041E54(0xC);
        } else {
            func_8004192C(1);
        }
    }
    if (req->unk_4 == 0xE) {
        if (D_80088AE4 == 0) {
            func_8004192C(1);
        } else {
            func_80041E54(0xC);
        }
    }
    if (req->unk_4 == 4) {
        if (D_80088AE4 == 0) {
            func_8004192C(1);
        } else {
            func_80041E54(0xC);
        }
    }
    t2 = team;
    D_8006B98C.first = D_80069ED8[req->unk_4].unk_0;
    D_8006B98C.second = D_80085A58;
    anim = D_8006E16C;
    func_800167FC(D_80080CFC[t2].players[D_80080CFC[t2].order[req->unk_8->unk_1F]].data[0xD], D_80085A58);
    flag = D_80080C10 & 1;
    if ((t2 == D_80088AE4 ? (flag ^ 1) : flag) != 0) {
        D_8006B98C.unk_C = D_8006BDBC;
    } else {
        D_8006B98C.unk_C = D_8006BDC4;
    }
    if (req->unk_C == 3) {
        anim = D_8006E184;
    } else if (req->unk_C == 1) {
        D_8006B98C.unk_10 = D_8006E1A0;
    } else {
        D_8006B98C.unk_10 = D_8006E194;
        if (req->unk_C == 2) {
            anim = D_8006E184;
        }
    }
    k2 = kind;
    if (anim != 0) {
        len = 0x96;
        if (k2 == 0x60) {
            len = 0xB4;
        }
        func_8003DDF8(anim, &D_8006B98C, D_8006B948, len, D_800895D2);
        D_8006B9C2 = func_800AEFF8(k2, team, D_8006B948, handle);
        func_800AEA9C(1);
    }
}
