#include "types.h"

typedef struct {
    s32 kind;
    s32 value;
    char *name;
    char *line1;
    char *line2;
    u8 *record;
} Message;

typedef struct {
    u8 pad00[4];
    u16 index;
    s16 unk06;
    u8 pad08[2];
    s16 unk0A;
    s32 unk0C;
} Request;

extern Message D_8006B98C;
extern s16 D_8006B9C2;
extern s32 D_8006B9D4;
extern s32 D_8006E9FC[];
extern char D_80085A58[3][0x28];
extern u16 D_80088472;
extern u8 *D_800895B8;

void func_800167FC(s16, char *);
void func_8002E65C(char *, s32);
u16 func_80031A1C(s32);
void func_80032F3C(s32, s32);
void func_800363F4(u16, s32, s32);
s32 func_800AE680(void);
void func_800AEA9C(s32);
s16 func_800AEFF8(s32, s16, Message *, s32);

void func_800B164C(Request *req) {
    char *name;
    char *line1;
    char *line2;
    Message *msg;
    s32 pad[4];

    name = D_80085A58[0];
    func_800167FC(req->unk0A, name);
    line1 = name + 0x28;
    func_8002E65C(line1, req->unk0C);
    func_80032F3C(0, req->unk0C);
    line2 = name + 0x50;
    func_800167FC(*(s16 *)(D_800895B8 + req->index * 2 + 0xEE), line2);
    msg = &D_8006B98C;
    msg->kind = 5;
    D_8006B98C.value = D_8006E9FC[req->index];
    D_8006B98C.name = name;
    D_8006B98C.line1 = line1;
    D_8006B98C.line2 = line2;
    D_8006B98C.record = D_800895B8 + req->index * 0x11;
    func_800363F4(D_80088472, func_80031A1C(5) + 2, D_8006B9D4);
    D_8006B9C2 = func_800AEFF8(0x88, req->unk06, msg, func_800AE680());
    func_800AEA9C(1);
}
