#include "types.h"

typedef struct Sub48 {
    /* 0x00 */ u8 pad_00[0x16];
    /* 0x16 */ s16 unk_16;
} Sub48;

typedef struct Resource {
    /* 0x00 */ u8 pad_00[0xC];
    /* 0x0C */ void *unk_0C;
    /* 0x10 */ void *unk_10;
    /* 0x14 */ s32 unk_14;
    /* 0x18 */ s32 unk_18;
    /* 0x1C */ s32 unk_1C;
    /* 0x20 */ s32 unk_20;
    /* 0x24 */ s32 unk_24;
    /* 0x28 */ s32 unk_28;
    /* 0x2C */ s32 unk_2C;
    /* 0x30 */ s32 unk_30;
    /* 0x34 */ s32 unk_34;
    /* 0x38 */ s32 unk_38;
    /* 0x3C */ s16 unk_3C;
    /* 0x3E */ s16 unk_3E;
    /* 0x40 */ s32 unk_40;
    /* 0x44 */ s32 unk_44;
    /* 0x48 */ Sub48 *unk_48;
} Resource;

typedef struct Player {
    /* 0x00 */ u8 pad_00[0x1E];
    /* 0x1E */ u8 unk_1E;
    /* 0x1F */ u8 unk_1F;
    /* 0x20 */ u8 unk_20;
    /* 0x21 */ u8 unk_21;
    /* 0x24 */ Resource *unk_24;
    /* 0x28 */ s16 unk_28;
    /* 0x2A */ u8 pad_2A[6];
    /* 0x30 */ s16 unk_30;
    /* 0x32 */ u8 pad_32[0x76];
    /* 0xA8 */ s32 unk_A8;
    /* 0xAC */ s32 unk_AC;
} Player;

extern s32 D_80069A48[];
extern u8 D_80074824[];
extern void *D_8007A550;
extern Player *D_80085040[][22];
extern void *D_800855F8;
extern s32 D_800880F0[];
extern s32 D_80088630;
extern u16 D_8008B672;
extern void D_800BF96C();

void *func_80033174(s32, s32, s32);
Player *func_80033298(void *);
void func_800C2310(Player *);
Resource *func_8000D740(void *, s32, s32 *);
void linked_object_prepend(Resource *);
void record_slot_primary_set(Resource *, u8 *);
void func_800E18D0(void *);

void func_800C3E14(u16 count, void *owner) {
    u16 i;
    u16 team;
    Player *p;

    D_8008B672 = count;
    D_8007A550 = func_80033174(0, count, 0xB0);
    for (i = 0; i < 8; i++) {
        D_800880F0[i] = 0;
    }
    for (team = 0; team < 2; team++) {
        for (i = 0; i < count / 2; i++) {
            p = func_80033298(D_8007A550);
            func_800C2310(p);
            D_80085040[team][i] = p;
            p->unk_1E = team;
            p->unk_1F = i;
            p->unk_20 = 0;
            p->unk_21 = 0;
            p->unk_28 = 0;
            p->unk_30 = 0;
            D_80069A48[0] = D_80088630;
            p->unk_24 = func_8000D740(owner, 7, D_80069A48);
            p->unk_24->unk_1C = 0;
            p->unk_A8 = 0;
            p->unk_24->unk_20 = 0;
            p->unk_AC = 0;
            p->unk_24->unk_24 = 0;
            p->unk_24->unk_2C = 0;
            p->unk_24->unk_30 = 0;
            p->unk_24->unk_34 = 0;
            p->unk_24->unk_3E = 0;
            p->unk_24->unk_3C = 0x96;
            p->unk_24->unk_40 = 0x2000;
            p->unk_24->unk_44 = 0x1800;
            p->unk_24->unk_14 = 0x235;
            p->unk_24->unk_0C = D_800BF96C;
            p->unk_24->unk_10 = p;
            linked_object_prepend(p->unk_24);
            p->unk_24->unk_48->unk_16 = 0;
            record_slot_primary_set(p->unk_24, D_80074824);
        }
    }
    func_800E18D0(D_800855F8);
}
