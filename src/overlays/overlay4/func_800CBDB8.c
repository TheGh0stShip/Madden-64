#include "types.h"

typedef struct { s16 unk0; s16 unk2; u8 pad4[4]; u16 unk8; u8 padA[2]; } SRosterEnt;
typedef struct { SRosterEnt ent[53]; } SRoster;
typedef struct { SRoster *unk0; u8 pad4[0x214C - 4]; } STeam;
typedef struct { u8 pad0[0x2C]; s32 unk2C; } SPl;
typedef struct { u8 a; u8 b; } SMsg;
extern void func_800C0BBC(SPl *, s32);
extern void func_800CA28C(SPl *);
extern void func_800CA3C4(SPl *);
extern void func_800E1B00(SPl *, SMsg *);
extern STeam D_80082DB8[];
extern SPl *D_80085040[][22];
extern s8 D_800880A0;
extern s16 D_80088AE4;

void func_800CBDB8(void) {
    SMsg msg;
    s16 i;
    SPl *p;
    if (D_800880A0 == 1) {
        D_800880A0 = 0;
        for (i = 0; i < 11; i++) {
            p = D_80085040[D_80088AE4][i];
            if (D_80082DB8[D_80088AE4].unk0->ent[i].unk8 & 0x800) {
                msg.a = 1;
                msg.b = 8;
                func_800E1B00(p, &msg);
                if (D_80082DB8[D_80088AE4].unk0->ent[i].unk2 == -0x18) {
                    func_800CA3C4(p);
                } else {
                    func_800CA28C(p);
                }
            } else {
                msg.a = 1;
                msg.b = 8;
                func_800E1B00(p, &msg);
            }
        }
        p = D_80085040[D_80088AE4][0];
        if (p->unk2C == 0x13) {
            func_800C0BBC(p, 0x38);
        }
    }
}
