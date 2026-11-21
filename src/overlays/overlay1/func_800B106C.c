#include "types.h"

typedef struct {
    s32 kind;
    char *name;
    char *line1;
} Message;

typedef struct {
    u8 kind;
    char name[0x2105];
    u16 unk_2106;
    u8 unk_2108[0x214C - 0x2108];
} Team;

typedef struct {
    u8 unk_00[4];
    s32 team;
} Request;

extern s16 D_800876DC;
extern s16 D_80087702;
extern Team D_80080C90[];
extern Message D_8006B98C;
extern char D_8006E1E8[];
extern char D_8006E20C[];
extern char D_8006E230[];
extern char D_8006BE4C[];
extern char D_80085A58[];
extern s32 D_8006B948;
extern s16 D_8006B9C2;
extern s32 D_8006B9D4;
extern u16 D_80088472;
extern s16 D_800895D2;

void primary_handle_release(Request *);
s16 func_80041BDC(s32, s32);
void func_800B7DD8(s32, s32, s32, s32, s32);
void func_800167FC(s16, char *);
u16 func_80031A1C(s32);
void func_800363F4(u16, s32, s32);
s32 func_800AE680(void);
void func_8003DDF8(char *, Message *, s32 *, s32, s32);
s16 func_800AEFF8(s32, s16, s32 *, s32);
void func_800AEA9C(s32);

void func_800B106C(Request *req) {
    s16 busy;
    char *text;
    s16 type;
    s16 time;
    s32 team;
    s32 seed;
    Message *msg;

    time = 0xB4;
    primary_handle_release(req);
    type = 0x60;
    if (D_800876DC == 3) {
        busy = func_80041BDC(0xC, 0xA);
    } else {
        busy = 0;
    }
    if (busy == 0) {
        func_800B7DD8(1, 0x16, req->team, 0, 0);
    }
    if (D_80087702 == 0) {
        switch (D_80080C90[req->team].kind) {
            case 0x76:
            case 0x77:
            case 0x78:
            case 0x7A:
            case 0x7D:
            case 0x7E:
            case 0x7F:
            case 0x80:
            case 0x81:
            case 0x82:
            case 0x83:
            case 0x84:
            case 0x85:
                text = D_8006E1E8;
                break;
            default:
                text = D_8006E20C;
                break;
        }
    } else {
        text = D_8006E230;
    }
    D_8006B98C.kind = 6;
    D_8006B98C.name = D_80080C90[req->team].name;
    if (D_80080C90[req->team].unk_2106 != 0) {
        D_8006B98C.line1 = D_80085A58;
        func_800167FC(D_80080C90[req->team].unk_2106, D_80085A58);
    } else {
        D_8006B98C.line1 = D_8006BE4C;
    }
    team = req->team;
    msg = &D_8006B98C;
    msg->kind = 2;
    if (type == 0x68) {
        time = 0x96;
    }
    func_800363F4(D_80088472, func_80031A1C(5) + 2, D_8006B9D4);
    seed = func_800AE680();
    func_8003DDF8(text, msg, &D_8006B948, time, D_800895D2);
    D_8006B9C2 = func_800AEFF8(type, team, &D_8006B948, seed);
    func_800AEA9C(1);
}
