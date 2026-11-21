#include "types.h"

typedef struct {
    u16 unk0[16];
    s16 unk20[16];
    u16 unk40;
} RosterECD8;

typedef struct {
    u8 pad0[0x14];
    s32 flags;
} TargetECD8;

typedef struct {
    u8 pad0[0xD];
    u8 unkD;
} PanelECD8;

typedef struct {
    u8 pad0[0xC];
    PanelECD8 *unkC;
} HolderECD8;

typedef struct {
    u8 pad0[0x24];
    HolderECD8 *unk24;
    s32 unk28;
    u8 pad2C[0xC];
    TargetECD8 *unk38;
    u8 pad3C[0x24];
    RosterECD8 *unk60;
} OwnerECD8;

extern void func_80024694(void);
extern void func_80024E9C(void);
extern void func_80024F5C(void);
extern void func_80025114(void);
extern u16 func_80028224(void);
extern void func_80039850(s32, s32);
extern void func_8003A600(s32, s32);
extern s16 func_8009DFE0(const char *);
extern s16 func_8009F078(RosterECD8 *);
extern void func_8009F184(RosterECD8 *);
extern void func_8009F238(PanelECD8 *, u16);
extern void func_8009F270(RosterECD8 *);
extern void func_8009F308(TargetECD8 *, u8, OwnerECD8 *);
extern void func_800A2078(s16, u16 *, s16 *);
extern void func_800A2170(s16, u16 *, s16 *);
extern void func_800D6424(s32, s32, s32, s32);
extern void func_800DB220(HolderECD8 *, s32);
extern void func_800DC6F8(PanelECD8 *, u8);
extern void func_800DD4B8(void);
extern void func_800DD514(void *);
extern void func_800DE84C(void *);
extern void func_800DF6EC(void);
extern void func_800DF72C(void);

extern u16 D_8006B9E4[];
extern s8 D_800724F9;
extern u8 D_80072558[];
extern u8 D_8007258C[];
extern u16 D_80086190[];
typedef struct {
    s8 count;
} CountECD8;

extern CountECD8 D_800C4EEB;

void func_8009ECD8(OwnerECD8 *owner, s32 unused, s32 mode) {
    HolderECD8 *holder;
    RosterECD8 *roster;
    PanelECD8 *panel;
    s16 result;
    u32 i;

    holder = owner->unk24;
    roster = owner->unk60;
    panel = holder->unkC;
    switch ((s16)mode) {
    case 13:
        func_8009F308(owner->unk38, panel->unkD, owner);
        owner->unk38->flags |= 1;
        break;
    case 2:
    case 21:
        func_800DF6EC();
        func_800DB220(holder, 2);
        func_800A2078(roster->unk40, roster->unk0, roster->unk20);
        func_800DC6F8(panel, roster->unk40);
        break;
    case 3:
    case 22:
        func_800DF6EC();
        func_800DB220(holder, 3);
        func_800A2170(roster->unk40, roster->unk0, roster->unk20);
        func_800DC6F8(panel, roster->unk40);
        break;
    case 8:
        func_800DF72C();
        roster->unk20[roster->unk40] = 1;
        result = func_8009F078(roster);
        if (result == 1) {
            func_8009F270(roster);
            if (func_8009DFE0("TEAM") == result) {
                D_800724F9 = 1;
                func_80024694();
                func_80039850(1, 2);
                func_80024E9C();
                for (i = 0; i < D_800C4EEB.count; i++) {
                    D_80086190[i] = D_8006B9E4[i] = roster->unk0[i];
                }
                func_800DD514(D_8007258C);
                func_800DE84C(D_80072558);
                func_80025114();
                break;
            }
            for (i = 0; i < (u16)D_800C4EEB.count; i++) {
                roster->unk0[i] = D_80086190[i];
                roster->unk20[i] = 0;
            }
            func_8009F078(roster);
        }
        func_8009F184(roster);
        func_8009F238(panel, roster->unk40);
        break;
    case 17:
        func_800DF72C();
        if (func_80028224() != 3) {
            func_80024F5C();
        }
        func_8003A600(0, 1);
        func_800DD4B8();
        break;
    case 12:
        owner->unk38->flags &= ~1;
        func_800D6424(owner->unk28, 0xFA, 2, 0xA);
        break;
    }
}
