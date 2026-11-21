#include "types.h"

typedef struct { char c[4]; } Lit4;

typedef struct {
    u16 type;
    void *unk04;
    s32 unk08;
    s32 unk0C;
    s16 mode;
} LoadRequest;

typedef struct {
    s32 unk00;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s32 unk0C;
    s32 unk10;
    u8 pad14[0x14];
} ObjConfig;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[4];
    s32 unk1C;
    s32 unk20;
} Model;

typedef struct {
    s32 items[3];
    void *unkC;
    void *unk10;
    s32 unk14;
    s32 unk18;
} Request;

typedef struct {
    u8 pad00[0x22];
    u8 unk22;
    u8 pad23[5];
} TeamInfo;

typedef struct {
    u8 pad00[0x6C];
    u16 players[55];
    u8 name[1];
} Roster;

typedef struct {
    u8 pad00[8];
    s16 current;
    u16 team;
    u8 pad0C[0x30];
    u16 unk3C;
    u8 unk3E[0xD];
    u8 page;
    u8 unk4C;
    u8 pad4D[3];
    u8 parts[5];
    u8 limits[5];
    u8 pad5A;
    u8 count;
    u8 pad5C[0x18];
    s32 unk74;
} Tally;

extern Lit4 D_80002E48;
extern Tally *D_800895EC;
extern Roster D_80080C90;
extern u16 D_80084F40;
extern s32 D_80086E30;
extern s32 D_80086E44[];
extern s32 D_80086E78[];
extern void *D_80087780[];
extern s32 D_80088090;
extern s32 D_8008931C;
extern u16 D_800892B4[];
extern void *D_800893B8;
extern u16 D_800BDF0A;
extern s16 D_80073D68;
extern u8 *D_8006B9DC;
extern u8 D_800C3158[];
extern u8 D_800C366C[];
extern void *D_800E6B78[];
extern u8 D_800E7968[];
extern u8 D_800C1790[];
extern u8 D_800C3320[];
extern u8 D_800C3338[];
extern u8 D_800C334C[];
extern u8 D_800C3360[];
extern u8 D_800C3374[];

void func_800BB46C(void);
u16 func_80016FD4(void);
void func_80016FC4(u16);
void func_80016FE4(s32);
void func_80016FF4(s32);
void func_8003A7DC(u16, u8 *);
void func_8003A8CC(u16, u16 *);
void func_8003AE80(u16 *, u8 *);
s32 func_80022B3C(s32, u16, s32);
s32 func_8000D8DC(s32, ObjConfig *);
void func_800167FC(s16, char *);
u8 *func_8003A7B8(u16);
void func_800BA684(u16);
void func_8001AEA8(s32 *);
s32 func_8000C8A0(s32);
Model *func_8000D740(s32, s32, LoadRequest *);
void *func_8001B02C(s32);
void func_800BA6F0(void);
void func_800BA96C(s32, void *);
void func_800B9F40(u16, void *);
void func_800BA9A4(u16, void *, Model *);
void func_800BAA8C(u16, s32);
s16 func_800BAB0C(s16);
void func_800BABE0(u16, Model *);
void func_8001ECAC(Model *, s32, s32);
void func_8001EC20(Model *, s32);
void func_800D3F4C(s32, s32 *, s16, s32);
void func_80092B98(void);
s32 func_80030C74(s32 *);
u8 func_800BB294(u16);
u8 func_800BB2F8(u16);
void func_800DF6EC(void);
void func_800DF72C(void);
void func_800BA9FC(u16, u16, Model *);
void func_800BAE88(TeamInfo *);
s16 func_800BB0F4(Request *);
u16 func_8003A378(TeamInfo *);
void func_80039F08(s32, u16, s32);
void func_800D67B8(Request *);
void func_800D6454(Request *);
s32 func_8003A248(u16);
u16 func_80028224(void);
u16 func_8003A21C(u16);
void func_80033308(s32, void *, s32, s32);
s16 func_800BADE4(u16);
s16 func_800BAD04(u16);
void func_800D67EC(void *, s32);
void func_800940D4(void);
void func_80032F3C(s32, void *);
void func_8000D874(s32, void *);
void func_8000D834(s32, void *);

void func_800BC684(void) {
    Model *objs[5];
    void *ids[5];
    LoadRequest request;
    ObjConfig config;
    TeamInfo info;
    Request msg;
    char name[8];
    Lit4 none;
    s32 held;
    s16 i;
    s32 font2;
    s32 font1;
    Model *bar;
    void *gauge;
    u16 saved;
    s16 total;
    Model *model;
    Model *cursor;
    u16 cur;
    s32 pad;
    u16 team;
    u8 n;
    s32 j;
    s32 sel;
    s32 *entry;
    u32 kind;
    s32 save;

    held = 0;
    pad = 0;
    none = D_80002E48;
    saved = func_80016FD4();
    func_80016FC4(D_80084F40);
    total = 0;
    if (D_800895EC->team != 0xFF) {
        func_8003A7DC(D_800895EC->team, (u8 *)&D_80080C90);
        func_8003A8CC(D_800895EC->team, D_80080C90.players);
        func_8003AE80(D_80080C90.players, D_80080C90.name);
        for (i = 0; i < 55; i++) {
            if (D_80080C90.players[i] == 0xFFFF) {
                break;
            }
            total += func_80022B3C(0, i, 0x13);
        }
    }
    config.unk04 = 5;
    config.unk06 = 0;
    config.unk08 = 0;
    config.unk10 = 0;
    config.unk0C = 0x10;
    config.unk00 = 3;
    font1 = func_8000D8DC(0, &config);
    func_80016FE4(font1);
    config.unk0C = 0x10;
    config.unk00 = 4;
    font2 = func_8000D8DC(0, &config);
    func_80016FE4(font2);
    D_80086E30 = 0x1E;
    D_80086E78[0] = font2;
    D_80087780[0] = (void *)0x20;
    D_800895EC->current = 0;
    for (i = 1; i < 32; i++) {
        D_80087780[i] = D_800C3158;
    }
    func_800167FC(D_800895EC->unk4C, name);
    D_80087780[1] = name;
    D_80087780[3] = 0;
    D_80087780[2] = D_800895EC->unk3E;
    D_80087780[4] = D_800E6B78[D_800895EC->page];
    if (D_800895EC->team != 0xFF) {
        D_80087780[3] = func_8003A7B8(D_800895EC->team) + 0x55;
    } else {
        D_80087780[3] = &none;
    }
    func_800BA684(5);
    func_8001AEA8(&D_80086E30);
    request.type = 0x328;
    request.mode = 8;
    request.unk04 = D_80087780;
    request.unk08 = 0;
    model = func_8000D740(func_8000C8A0(D_80088090), 1, &request);
    model->unk20 = 0xF0;
    request.type = 0x360;
    request.mode = 3;
    bar = func_8000D740(func_8000C8A0(D_80088090), 1, &request);
    bar->unk20 = 0xF0;
    bar->unk1C = 0;
    cur = 0;
    gauge = func_8001B02C(request.type);
    request.type = 0x330;
    request.mode = 7;
    request.unk04 = 0;
    request.unk08 = 0;
    cursor = func_8000D740(func_8000C8A0(D_80088090), 1, &request);
    cursor->unk20 = 0x49;
    cursor->unk1C = 0;
    cursor->flags &= ~1;
    func_800BA6F0();
    D_800895EC->count = D_800C366C[D_800895EC->page];
    request.type = 0x338;
    request.mode = 3;
    for (i = 0; i < D_800895EC->count; i++) {
        objs[i] = func_8000D740(func_8000C8A0(D_80088090), 1, &request);
        objs[i]->unk20 = i * 17 + 0xF0;
        objs[i]->unk1C = 1;
        ids[i] = func_8001B02C(request.type);
        D_80086E44[i] = font1;
        func_800BA96C(D_800895EC->parts[i], ids[i]);
        request.type += 8;
    }
    for (i = D_800895EC->count; i < 5; i++) {
        D_80086E44[i] = 0;
    }
    func_800B9F40(0x19, D_800E7968);
    func_800BA9A4(D_800895EC->unk3C, gauge, bar);
    for (i = 10; i < 15; i++) {
        D_80087780[i] = 0;
    }
    func_800BAA8C(10, 0);
    D_800895EC->current = func_800BAB0C(D_800895EC->current);
    func_800BABE0(D_800895EC->current, 0);
    func_8001ECAC(model, cur + 5, 6);
    func_8001ECAC(model, cur + 10, 6);
    while (model->unk20 != 0) {
        func_800D3F4C(10, &model->unk20, 0, 1);
        func_800D3F4C(10, &bar->unk20, 0, 1);
        for (i = 0; i < D_800895EC->count; i++) {
            func_800D3F4C(10, &objs[i]->unk20, i * 17, 1);
        }
        func_80092B98();
    }
    cursor->flags |= 1;
    func_800BABE0(D_800895EC->current, model);
    while (!(pad & 0x4000)) {
        func_80092B98();
        pad = func_80030C74(&held);
        if (held & 0x300) {
            if (pad & 0x200) {
                if (D_800895EC->parts[cur] >= 2) {
                    n = func_800BB294(cur);
                    if (D_800895EC->parts[cur] != 0) {
                        if (n < D_800895EC->parts[cur]) {
                            D_800895EC->parts[cur] -= n;
                        } else {
                            D_800895EC->parts[cur] = 0;
                        }
                        func_800DF6EC();
                        func_800BA96C(D_800895EC->parts[cur], ids[cur]);
                        func_800B9F40(0x19, D_800E7968);
                        func_8001EC20(model, 0x19);
                        func_800BA9A4(D_800895EC->unk3C, gauge, bar);
                        func_800BA9FC(cur, cur + 10, model);
                    }
                }
            } else if (pad & 0x100) {
                n = func_800BB2F8(cur);
                if (D_800895EC->parts[cur] + n <= D_800895EC->limits[cur] && D_800895EC->unk3C != 0) {
                    D_800895EC->parts[cur] += n;
                    func_800DF6EC();
                    func_800BA96C(D_800895EC->parts[cur], ids[cur]);
                    func_800B9F40(0x19, D_800E7968);
                    func_8001EC20(model, 0x19);
                    func_800BA9A4(D_800895EC->unk3C, gauge, bar);
                    func_800BA9FC(cur, cur + 10, model);
                }
            }
        } else {
            if (pad & 0x800) {
                sel = cur;
                if (sel != 0) {
                cur--;
                func_800DF6EC();
                func_8001ECAC(model, sel + 5, 0);
                func_8001ECAC(model, sel + 10, 0);
                cursor->unk20 = cur * 17 + 0x49;
                cursor->unk1C = 0;
                func_8001ECAC(model, cur + 5, 6);
                func_8001ECAC(model, cur + 10, 6);
                }
            }
            if (pad & 0x400) {
                sel = cur;
                if (sel < D_800895EC->count - 1) {
                cur++;
                func_800DF6EC();
                func_8001ECAC(model, sel + 5, 0);
                func_8001ECAC(model, sel + 10, 0);
                cursor->unk20 = cur * 17 + 0x49;
                cursor->unk1C = 0;
                func_8001ECAC(model, cur + 5, 6);
                func_8001ECAC(model, cur + 10, 6);
                }
            }
        }
        if (pad & 0x4000) {
            func_800DF72C();
            D_800893B8 = func_800BB46C;
            break;
        }
        if (pad & 0x9000) {
            func_800DF72C();
            func_800BAE88(&info);
            if (D_800895EC->team != 0xFF) {
                if (total + info.unk22 < 0x6EE || D_80073D68 == 0) {
                    if (func_800BB0F4(&msg) == 0) {
                        func_80039F08(0, func_8003A378(&info), 0);
                        D_800892B4[0] = D_800895EC->team;
                        D_800893B8 = 0;
                        D_800BDF0A = D_800895EC->team;
                        break;
                    }
                } else {
                    func_800D67B8(&msg);
                    msg.items[0] = (s32)D_800C3320;
                    msg.items[1] = (s32)D_800C3338;
                    func_800D6454(&msg);
                }
            } else if (func_800BB0F4(&msg) == 0) {
                team = func_8003A378(&info);
                if (func_8003A248(team) == 0) {
                    func_800D67B8(&msg);
                    msg.items[0] = (s32)D_800C334C;
                    msg.items[1] = (s32)D_800C3360;
                    msg.items[2] = (s32)D_800C3374;
                    func_800D6454(&msg);
                } else {
                    j = 0;
                    if (func_80028224() == 1) {
                        while (func_8003A21C(j) != team) {
                            j++;
                        }
                        entry = (s32 *)(D_8006B9DC + (j * 12 + 0x4D58));
                        func_80033308(0, entry, 12, 0);
                        kind = D_800895EC->page & 0x3F;
                        if (kind < 10) {
                            if (kind == 0) {
                                *entry = *entry & 0x3FFFFFFF;
                            } else {
                                *entry = (*entry & 0x3FFFFFFF) | 0x40000000;
                            }
                        } else if (kind < 21) {
                            *entry = (*entry & 0x3FFFFFFF) | 0x80000000;
                        } else {
                            *entry = *entry | 0xC0000000;
                        }
                    }
                    D_800893B8 = 0;
                    break;
                }
            }
        }
        if (pad & 0x2030) {
            if (pad & 0x2020) {
                if (func_800BADE4(D_800895EC->current) != 0) {
                    func_800DF72C();
                }
            } else if (func_800BAD04(D_800895EC->current) != 0) {
                func_800DF72C();
            }
            func_800BABE0(D_800895EC->current, model);
        }
        if (pad & 2) {
            func_800D67EC(D_800C1790, 0);
        }
    }
    if (D_800893B8 == 0) {
        func_800940D4();
        func_80016FF4(D_800895EC->unk74);
    }
    cursor->flags &= ~1;
    while (model->unk20 < 0xF4) {
        func_800D3F4C(10, &model->unk20, 0xF4, 0);
        func_800D3F4C(10, &bar->unk20, 0xF4, 0);
        for (i = 0; i < D_800895EC->count; i++) {
            func_800D3F4C(10, &objs[i]->unk20, i * 20 + 0xF4, 0);
        }
        func_80092B98();
    }
    for (i = 0; i < D_800895EC->count; i++) {
        D_80086E44[i] = 0;
        func_8000D874(func_8000C8A0(D_80088090), objs[i]);
        func_8000D834(D_8008931C, objs[i]);
    }
    if (D_800893B8 == 0) {
        save = D_800895EC->unk74;
        func_80032F3C(0, D_800895EC);
        D_800895EC = 0;
        func_80016FF4(save);
        func_8000D874(func_8000C8A0(D_80088090), (void *)save);
        func_8000D834(D_8008931C, (void *)save);
        func_800940D4();
    }
    func_8000D874(func_8000C8A0(D_80088090), bar);
    func_8000D834(D_8008931C, bar);
    func_8000D874(func_8000C8A0(D_80088090), cursor);
    func_8000D834(D_8008931C, cursor);
    func_8000D874(func_8000C8A0(D_80088090), model);
    func_8000D834(D_8008931C, model);
    func_8000D834(D_8008931C, (void *)font1);
    func_8000D834(D_8008931C, (void *)font2);
    func_80092B98();
    func_80092B98();
    func_80016FC4(saved);
}
