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
typedef struct { u8 pad0[0x20]; s32 unk20; } SPos;
typedef struct { u8 pad0[0x1F]; u8 unk1F; u8 pad20[4]; SPos *unk24; } SPl;
typedef struct { u8 a; u8 b; s8 c; u8 d; } SMsg;
extern void func_800CA518(void);
extern void func_800E1B00(SPl *, SMsg *);
extern STeam D_80082DB8[];
extern s16 D_80084F34;
extern s32 D_800876EC;
extern s16 D_80088AE4;
extern s16 D_80089518;

void func_800CB854(SPl *arg0) {
    SMsg msg;
    func_800CA518();
    msg.a = 2;
    msg.d = D_800876EC >> 18;
    if (D_80082DB8[D_80088AE4].unk0->ent[arg0->unk1F].unk8.flags & 0x800) {
        u32 v = D_80084F34 - 0x2A;
        msg.b = v >> 8;
        msg.c = v;
    } else {
        msg.b = (u16)(arg0->unk24->unk20 >> 16) >> 8;
        msg.c = arg0->unk24->unk20 >> 16;
    }
    func_800E1B00(arg0, &msg);
    msg.a = 4;
    msg.c = D_80082DB8[D_80088AE4].unk0->ent[D_80089518].unk4;
    msg.b = 0;
    msg.d = D_80082DB8[D_80088AE4].unk0->ent[D_80089518].unk8.b.pos << 4;
    func_800E1B00(arg0, &msg);
}
