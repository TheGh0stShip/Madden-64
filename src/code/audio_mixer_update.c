#include "types.h"

typedef struct {
    s16 unk0;
    s16 unk2;
    union { s32 w; struct { u8 b0, b1, b2, b3; } b; } unk4;
    union {
        u16 flags;
        struct { s32 pos : 3; s32 mid : 13; s32 rest : 16; } b;
    } unk8;
} SRosterEnt;
typedef struct { SRosterEnt ent[53]; } SRoster;
typedef struct { SRoster *unk0; u8 pad4[0x214C - 4]; } STeam;
typedef struct { u8 pad0[0x20]; s32 unk20; } SPos;
typedef struct { u8 pad0[0x1F]; u8 unk1F; u8 pad20[4]; SPos *unk24; } SPl;
typedef struct { u8 a; u8 b; s8 c; u8 d; } SMsg;
typedef struct { s32 x; s32 y; } FixPos;
typedef struct { u16 unk0; } Pair;
extern s32 func_80031A1C(s32 limit);
extern void func_800CA518(void);
extern void func_800E1B00(SPl *, SMsg *);
s32 func_800E1C98(SPl *);
extern u16 D_8006B014[];
extern Pair D_8006B7AA;
extern s32 D_80080C10;
extern STeam D_80082DB8[];
extern FixPos D_80084F30;
extern SPl *D_80085040[][22];
extern s32 D_800876EC;
extern s32 D_800876F0;
extern s8 D_800880A0;
extern s8 D_800885E8;
extern u16 D_80088AE4;
extern s16 D_800892D0;
extern s16 D_80089518;

void audio_mixer_update(u16 arg0) {
    SMsg msg;
    s32 i;
    SPl *pl;
    s32 flag;
    s32 j;
    s16 d;
    s32 v;

    if (arg0 == D_80088AE4) {
        D_80089518 = -1;
        D_800880A0 = 1;
    }
    i = 0;
    while ((u16)i < 11) {
        pl = D_80085040[arg0][(u16)i];
        func_800E1C98(pl);
        if ((arg0 == (s16)D_80088AE4) & ((u16)i == 0)) {
            msg.a = 1;
            msg.b = 6;
            func_800E1B00(pl, &msg);
        }
        msg.a = 3;
        msg.b = (u32)(D_80082DB8[arg0].unk0->ent[(u16)i].unk2 + (D_80084F30.y >> 16)) >> 8;
        msg.c = D_80082DB8[arg0].unk0->ent[(u16)i].unk2 + (D_80084F30.y >> 16);
        msg.d = (D_80082DB8[arg0].unk0->ent[(u16)i].unk0 + (D_80084F30.x >> 16)) >> 2;
        func_800E1B00(pl, &msg);
        msg.a = 4;
        msg.c = D_80082DB8[arg0].unk0->ent[(u16)i].unk4.w;
        msg.d = D_80082DB8[arg0].unk0->ent[(u16)i].unk8.b.pos << 4;
        msg.b = D_80082DB8[arg0].unk0->ent[(u16)i].unk4.b.b2;
        func_800E1B00(pl, &msg);
        if (arg0 == D_80088AE4) {
            v = D_80082DB8[arg0].unk0->ent[(u16)i].unk8.b.mid & 0x7FF;
            if (v != 0) {
                d = v;
                if (D_80082DB8[arg0].unk0->ent[(u16)i].unk8.b.mid & 0x400) {
                    d = v | 0xF800;
                }
                D_800885E8 = 1;
                D_80089518 = i;
                if (d < 0) {
                    D_800876EC = (D_80082DB8[arg0].unk0->ent[(u16)i].unk0 << 16) + D_80084F30.x + (d << 16);
                    D_800876F0 = (D_80082DB8[arg0].unk0->ent[(u16)i].unk0 << 16) + D_80084F30.x;
                    if (D_8006B7AA.unk0 & 0x2000) {
                        D_800885E8 = 0;
                    }
                } else {
                    D_800876EC = (D_80082DB8[arg0].unk0->ent[(u16)i].unk0 << 16) + D_80084F30.x;
                    D_800876F0 = (D_80082DB8[arg0].unk0->ent[(u16)i].unk0 << 16) + D_80084F30.x + (d << 16);
                    if (!(D_8006B7AA.unk0 & 0x2000)) {
                        D_800885E8 = 0;
                    }
                }
                if (D_80082DB8[arg0].unk0->ent[(u16)i].unk8.flags & 0x1000) {
                    D_80089518 = -1;
                    func_800CA518();
                    msg.a = 3;
                    if (D_80082DB8[arg0].unk0->ent[(u16)i].unk8.flags & 0x800) {
                        u32 v = (D_80084F30.y >> 16) - 0x2A;
                        msg.b = v >> 8;
                        msg.c = v;
                    } else {
                        msg.b = (u32)(D_80082DB8[arg0].unk0->ent[(u16)i].unk2 + (D_80084F30.y >> 16)) >> 8;
                        msg.c = D_80082DB8[arg0].unk0->ent[(u16)i].unk2 + (D_80084F30.y >> 16);
                    }
                    msg.d = (D_80082DB8[arg0].unk0->ent[(u16)i].unk0 + D_80082DB8[arg0].unk0->ent[(u16)i].unk8.b.mid + (D_80084F30.x >> 16)) >> 2;
                    func_800E1B00(pl, &msg);
                    msg.a = 4;
                    msg.c = D_80082DB8[arg0].unk0->ent[(u16)i].unk4.w;
                    msg.d = D_80082DB8[arg0].unk0->ent[(u16)i].unk8.b.pos << 4;
                    msg.b = D_80082DB8[arg0].unk0->ent[(u16)i].unk4.b.b2;
                    func_800E1B00(pl, &msg);
                } else {
                    if (!(D_80080C10 & 2)) {
                        if (D_800892D0 == 0) {
                            flag = 1;
                            for (j = 0; j < 2; j++) {
                                if (D_8006B014[j] == (D_8006B7AA.unk0 & 0x1FFF)) {
                                    flag = 0;
                                    break;
                                }
                            }
                            if ((u16)func_80031A1C(100) < 20) {
                                if (flag == 1) {
                                    msg.a = 1;
                                    msg.b = 8;
                                    func_800E1B00(pl, &msg);
                                    func_800CA518();
                                    msg.a = 3;
                                    if (D_80082DB8[arg0].unk0->ent[(u16)i].unk8.flags & 0x800) {
                                        u32 v = (D_80084F30.y >> 16) - 0x2A;
                                        msg.b = v >> 8;
                                        msg.c = v;
                                    } else {
                                        msg.b = (u32)(D_80082DB8[arg0].unk0->ent[(u16)i].unk2 + (D_80084F30.y >> 16)) >> 8;
                                        msg.c = D_80082DB8[arg0].unk0->ent[(u16)i].unk2 + (D_80084F30.y >> 16);
                                    }
                                    msg.d = (D_80082DB8[arg0].unk0->ent[(u16)i].unk0 + D_80082DB8[arg0].unk0->ent[(u16)i].unk8.b.mid + (D_80084F30.x >> 16)) >> 2;
                                    func_800E1B00(pl, &msg);
                                    msg.a = 4;
                                    msg.c = D_80082DB8[arg0].unk0->ent[(u16)i].unk4.w;
                                    msg.d = D_80082DB8[arg0].unk0->ent[(u16)i].unk8.b.pos << 4;
                                    msg.b = D_80082DB8[arg0].unk0->ent[(u16)i].unk4.b.b2;
                                    func_800E1B00(pl, &msg);
                                }
                            }
                        }
                    }
                }
            }
        }
        i++;
    }
}
