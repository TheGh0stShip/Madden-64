#include "types.h"

typedef struct ScheduleEntry {
    u8 first;
    u8 second;
    u8 pad02[2];
    u8 state;
    s8 selected;
} ScheduleEntry;

typedef struct {
    void *unk00;
    void *unk04;
    s32 unk08;
    void *unk0C;
    void *unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} Request;

typedef struct Panel {
    u8 pad00[8];
    s16 unk08;
    u8 pad0A[0x3A];
    s32 unk44;
} Panel;

typedef struct {
    u8 pad00[0xC];
    Panel *unk0C;
} ObjSub24;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
} ObjSub38;

typedef struct Obj {
    u8 pad00[0x24];
    ObjSub24 *unk24;
    u8 pad28[0x10];
    ObjSub38 *unk38;
    u8 pad3C[0x38];
    s32 unk74[0x40];
} Obj;

typedef struct {
    u8 pad00[0x44];
    s32 unk44[1];
} Overlay2RuntimeAB810;

void func_80011B3C(void);
void func_8001EC20(s32, s32);
s32 func_80030DF0(void);
void func_80036D38(void);
ScheduleEntry *func_8008DC10(s16 week, s16 index);
void func_8008E074(s32, s32);
void func_8008E444(void);
void func_8008E6EC(void);
s16 func_8008EF54(s16);
s16 func_8008EFDC(s16);
void func_8009256C(s32);
void func_80092B98(void);
void func_80094028(void);
void func_80094080(void);
void func_800AA6EC(void);
void func_800AACA8(ObjSub38 *, s32, Obj *);
void func_800AB014(void);
void func_800D63B4(Obj *);
s16 func_800D6454(Request *);
void func_800D67B8(Request *);
void func_800DB0AC(Panel *, s32, s32);
void func_800DB44C(Panel *, s32 *, u32 *, s32 *);
void func_800DB478(Panel *);
s32 func_800DD4B8();
Overlay2RuntimeAB810 *func_800DD634(void);
void func_800DF6EC(void);
void func_800DF72C(void);

extern u8 D_8006BCA4[];
extern u8 D_8006BCA8[];
extern s32 D_800C0400;
extern s32 D_800C040C;
extern u8 D_800C0928[];
extern s32 D_800C3A10;
extern s16 D_800C5018;
extern s16 D_800C502C;
extern s32 D_800C504C;
extern s8 D_800C509C;
extern s8 D_800C509D;
extern u8 D_800C5840;
extern s16 D_800C5CEA;

void func_800A9FFC(Obj *arg0, s32 arg1, s32 arg2) {
    Request request;
    s32 sp30;
    u32 sp34;
    s32 sp38;
    Overlay2RuntimeAB810 *rt;
    Panel *panel;
    s32 *slots;
    s32 buttons;
    s32 count;
    u32 i;
    ScheduleEntry *entry;
    s8 *last;

    rt = func_800DD634();
    panel = arg0->unk24->unk0C;
    func_800DB44C(panel, &sp30, &sp34, &sp38);
    slots = arg0->unk74;
    switch ((s16)(arg2 - 2)) {
    case 11:
        func_800AACA8(arg0->unk38, 0, arg0);
        arg0->unk38->unk14 |= 1;
        break;
    case 10:
        func_800D63B4(arg0);
        break;
    case 0:
        if (D_800C502C > 0) {
            func_800DF6EC();
            D_800C502C--;
            func_800DB0AC(panel, 0, 0);
            panel->unk08 = func_8008EF54(D_800C502C);
            func_800DB478(panel);
            func_800AA6EC();
            if (D_800C502C < D_800C509C || (D_800C502C == 0x15 && (D_800C5840 & 0xF) == 8)) {
                slots[0x34] = (s32)&D_800C040C;
            } else {
                slots[0x34] = (s32)&D_800C0400;
            }
            func_8001EC20(panel->unk44, 0x33);
            func_8001EC20(panel->unk44, 0x34);
        }
        break;
    case 1:
        if (D_800C502C < D_800C5018) {
            func_800DF6EC();
            D_800C502C++;
            func_800DB0AC(panel, 0, 0);
            panel->unk08 = func_8008EF54(D_800C502C);
            func_800DB478(panel);
            func_800AA6EC();
            if (D_800C502C < D_800C509C || (D_800C502C == 0x15 && (D_800C5840 & 0xF) == 8)) {
                slots[0x34] = (s32)&D_800C040C;
            } else {
                slots[0x34] = (s32)&D_800C0400;
            }
            func_8001EC20(panel->unk44, 0x33);
            func_8001EC20(panel->unk44, 0x34);
        }
        break;
    case 15:
        func_800DF72C();
        func_800DD4B8();
        func_80011B3C();
        if (D_800C509D == 0 && D_800C509C == 0x15 && (func_8008DC10(0x15, 0)->state & 0xF) == 8) {
            func_800AB014();
        }
        if (D_800C509D == 1 && D_800C509C == 0x14 && (func_8008DC10(0x14, 0)->state & 0xF) == 8) {
            func_800AB014();
        }
        break;
    }
    if (D_800C5CEA == 0) {
        buttons = func_80030DF0();
        if (buttons & 4) {
            if (D_800C502C == D_800C509C) {
                ScheduleEntry *sel = func_8008DC10(D_800C502C, sp34);


                if ((sel->state & 0xF) == 0) {
                    if (sel->selected == 1) {
                        func_800DF72C();
                        sel->selected = 0;
                        rt->unk44[sp30] = D_800C504C;
                    } else {
                        func_800DF72C();
                        sel->selected = 1;
                        rt->unk44[sp30] = D_800C3A10;
                    }
                }
            }
        }
        if (buttons & 0x9000) {
            if (D_800C502C == D_800C509C) {
                func_800DF72C();
                if (func_8008EFDC(D_800C502C) == 0) {
                    func_800D67B8(&request);
                    count = 0;
                    request.unk00 = D_800C0928;
                    request.unk0C = D_8006BCA4;
                    request.unk10 = D_8006BCA8;
                    request.unk18 = 1;
                    for (i = 0; i < 15; i++) {
                        entry = func_8008DC10(D_800C502C, i);
                        if (entry->first != 0xFF) {
                            count += (entry->state & 0xF) == 0;
                        }
                    }
                    if (count != 0) {
                        if (func_800D6454(&request) == 0) {
                            func_80094028();
                            func_80092B98();
                            func_80092B98();
                            func_80092B98();
                            func_80092B98();
                            if (D_800C502C == 0x15) {
                                ScheduleEntry *src = func_8008DC10(D_800C502C - 1, 0);

                                entry = func_8008DC10(D_800C502C, 0);
                                entry->first = src->first;
                                entry->second = src->second;
                            }
                            func_8008E074(0, -1);
                            func_80036D38();
                            func_80036D38();
                            func_80036D38();
                            func_80036D38();
                            func_80036D38();
                            func_8008E444();
                            func_8008E6EC();
                            if (D_800C502C == 0x15) {
                                entry = func_8008DC10(0x15, 0);
                                entry->first = 0x75;
                                entry->second = 0x74;
                            }
                            last = &D_800C509C;
                            if (*last > 0x10) {
                                D_800C5018 = *last;
                            }
                            func_80094080();
                            if (D_800C502C < *last || (D_800C502C == 0x15 && (D_800C5840 & 0xF) == 8)) {
                                slots[0x34] = (s32)&D_800C040C;
                            } else {
                                slots[0x34] = (s32)&D_800C0400;
                            }
                            func_8001EC20(panel->unk44, 0x34);
                            func_800DB478(panel);
                        }
                    }
                } else {
                    D_800C5CEA = 1;
                    func_80094028();
                    func_80092B98();
                    func_80092B98();
                    func_80092B98();
                    func_80092B98();
                    func_8009256C(-1);
                    func_80094080();
                }
            }
        }
    }
}
