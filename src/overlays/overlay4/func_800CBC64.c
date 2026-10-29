#include "types.h"

typedef struct {
    s16 unk0;
    s16 unk2;
    s32 unk4;
    union {
        u16 flags;
        struct { s32 pos : 3; s32 rest : 29; } b;
    } unk8;
} SRosterEnt;
typedef struct { SRosterEnt ent[53]; } SRoster;
typedef struct { SRoster *unk0; u8 pad4[0x214C - 4]; } STeam;
typedef struct { u8 pad0[0x20]; s16 unk20; } SPos;
typedef struct { u8 pad0[0x1F]; u8 unk1F; u8 pad20[4]; SPos *unk24; } SPl;
typedef struct { u8 a; u8 b; s8 c; u8 d; } SMsg;
extern void func_800E1B00(SPl *, SMsg *);
extern STeam D_80082DB8[];
extern s16 D_80084F34;
extern s16 D_80084F30;
extern s16 D_80088AE4;

void func_800CBC64(SPl *arg0) {
    SMsg msg;
    u32 v;
    s32 i = arg0->unk1F;
    msg.a = 3;
    v = D_80084F34 - 0x2A;
    msg.b = v >> 8;
    msg.c = v;
    msg.d = (D_80082DB8[D_80088AE4].unk0->ent[i].unk0 + D_80084F30) >> 2;
    func_800E1B00(arg0, &msg);
    msg.a = 4;
    msg.c = D_80082DB8[D_80088AE4].unk0->ent[i].unk4;
    msg.d = D_80082DB8[D_80088AE4].unk0->ent[i].unk8.b.pos << 4;
    msg.b = 0;
    func_800E1B00(arg0, &msg);
    msg.a = 1;
    msg.b = 0x16;
    func_800E1B00(arg0, &msg);
}
