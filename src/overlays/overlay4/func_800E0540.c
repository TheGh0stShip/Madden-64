#include "types.h"

typedef struct {
    /* 0x00 */ void *unk_00;
    /* 0x04 */ s16 unk_04;
    /* 0x06 */ s16 unk_06;
    /* 0x08 */ s16 unk_08;
    /* 0x0A */ u8 unk_0A;
    /* 0x0C */ u32 unk_0C;
    /* 0x10 */ u32 unk_10;
    /* 0x14 */ char text[0x34];
    /* 0x48 */ s32 unk_48;
} Menu;

typedef struct {
    /* 0x00 */ u8 pad0[8];
    /* 0x08 */ void *unk_08;
    /* 0x0C */ u8 padC[8];
    /* 0x14 */ s32 unk_14;
    /* 0x18 */ s16 unk_18;
    /* 0x1A */ s16 unk_1A;
    /* 0x1C */ s32 unk_1C;
    /* 0x20 */ s32 unk_20;
} Obj;

typedef struct {
    /* 0x00 */ u8 pad0[0x16];
    /* 0x16 */ u16 unk_16;
} Anim;

typedef struct {
    /* 0x00 */ u16 unk_00;
    /* 0x02 */ u16 unk_02;
    /* 0x04 */ s16 *unk_04;
    /* 0x08 */ s16 unk_08;
    /* 0x0A */ s16 unk_0A;
    /* 0x0C */ void *unk_0C;
    /* 0x10 */ s32 unk_10;
    /* 0x14 */ s32 unk_14;
    /* 0x18 */ s32 unk_18;
    /* 0x1C */ s16 unk_1C;
} Req;

typedef struct {
    /* 0x00 */ s16 unk_00;
    /* 0x04 */ void *unk_04;
    /* 0x08 */ void *unk_08;
    /* 0x0C */ s32 unk_0C;
    /* 0x10 */ s16 unk_10;
} Setup;

typedef struct {
    /* 0x00 */ s32 unk_00;
    /* 0x04 */ s16 unk_04;
    /* 0x08 */ s32 unk_08;
    /* 0x0C */ s32 unk_0C;
    /* 0x10 */ s32 pad10[5];
    /* 0x24 */ s32 unk_24;
} Setup2;

typedef struct {
    s32 unk_00;
    s32 unk_04;
} Event;

typedef struct {
    u8 pad0[0x18];
    s16 unk_18;
    s16 unk_1A;
    s16 unk_1C;
} Win;

typedef struct { u16 a, b, c, d; } UTriple;
typedef struct { s16 a, b, c, d; } STriple;
typedef struct { char name[0x214C]; } TeamName;

void func_800BF1C8(void);
void func_8000CDC0(void);
s32 func_800334B8();
void func_800B7D98(void);
void func_8003D78C(s32);
void func_800AAC40(void);
void func_800DD6EC(void);
void *func_80032E00(s32, s32);
void func_8002E65C(void *, void *);
void func_8002E688(void *, void *);
s32 func_80031964(void);
void *func_8001AEA8(void *);
s32 func_8000BF08();
s32 func_80036540(s32);
void func_800B7C80(void);
void func_8003E460(void);
u16 func_80016FD4(void);
u16 func_800356C4(void *, s32);
s32 func_80016FC4(s32);
void func_800E009C(s32, s32);
void *func_8000D740(void *, s32, void *);
void func_800E0500(Menu *, s32, Obj *);
void func_800B7DD8(s32, s32, s32, s32, s32);
void *func_8000B6F8(s32, s32);
void func_8000C940(void *, s32, s32);
void func_8000C964(void *, s32, s32);
void func_8000C8AC(void *);
void func_8000CB78(void *, s32, s32);
void func_8000B7A4(void *, s32);
u16 func_80031A1C(s32);
void *func_8000D5BC(s32, s32, s32);
void func_8000C898(void *, void *);
void func_80041620(void *, s32);
void func_80031A98(void);
void func_800C0BBC(void *, s32);
void func_8003456C(s32, s32);
void func_800E0218(Menu *, Obj *);
s32 func_800E01A8(void);
void func_80030C74(Event *);
void func_800E0744(void);
s16 func_8003CBB8();
void func_8003CEB8(s32, s32, s32, s32);
void func_8000BE80(void);
void func_8000D998(void *, void *);
s32 func_8000C9AC(void *, void *);
void func_8000DE34(s32);
void func_8000E3C8(void);
void func_8000E20C(void);
void func_800E0388(s32, Menu *, Obj *);
void func_8000BEE8(s32);
void func_8000B7E4(void *);
void func_80035A7C(u16);
void func_80032F3C(s32, void *);
void func_8000D874(void *, void *);
void func_8000D834(void *, void *);
void func_800311D0(void);
void func_800AAC94(void);
void *func_8002FEA4(void *, s32, s32);

extern u8 D_80000408[];
extern u8 func_80000420[];
extern char D_800014F8[];
extern u16 D_80064A4C;
extern void *D_8006BB68;
extern UTriple D_8006BB6C[];
extern STriple D_8006BBAC[];
extern STriple D_8006BBEC[];
extern char D_8006D8DC[];
extern char D_8006D8E4[];
extern char D_8006D8EC[];
extern char D_8006D8FC[];
extern char D_8006D908[];
extern char D_8006D920[];
extern char D_8006D930[];
extern char D_8006D93C[];
extern char D_8006D944[];
extern char D_8006D94C[];
extern char D_8006D958[];
extern char D_8006D964[];
extern char D_8006D970[];
extern char D_8006D97C[];
extern u8 D_80073523[];
extern TeamName D_80080C91[];
extern s32 D_80082DCC;
extern s32 D_80082DD0;
extern char D_80082DDD[];
extern s32 D_80084F18;
extern s32 D_80084F1C;
extern void *D_80084F4C;
extern s32 D_80084F78;
extern u16 D_80085280;
extern s32 D_80085298;
extern u16 D_800857B2;
extern s32 D_80085804;
extern s32 D_80085808;
extern s32 D_80085810;
extern void *D_80085A44;
extern s16 D_80086BE2;
extern void *D_80086DD8;
extern s32 D_80086E30[];
extern s32 D_80086E34;
extern s32 D_80086E38;
extern s32 D_80086E3C;
extern s32 D_80086E40;
extern s32 D_80086E74;
extern u8 D_80087138[];
extern Obj *D_8008715C;
extern s32 D_80087780[];
extern char *D_80087784;
extern char *D_80087790;
extern char *D_80087794;
extern char *D_80087798;
extern char *D_8008779C;
extern char *D_800877A0;
extern char *D_800877A4;
extern s16 D_80087A68;
extern s16 D_80087A92;
extern s32 D_80087AA4;
extern s32 D_80088090;
extern void *D_8008809C;
extern void *D_800885E0;
extern volatile s32 D_80088620;
extern void *D_80088D30;
extern s32 D_8008929C;
extern void *D_8008931C;
extern s16 D_80089320;
extern s32 D_80089344;
extern u16 D_8008A3D8;
extern volatile u16 D_8008A5B4;
extern u8 D_8008CA8C[];
extern u8 D_8008F9C4[];

void func_8001B314(void *);
void func_800DECA0(void) {
    Req req;
    Setup setup;
    Setup2 setup2;
    s16 s0[6] = { 0x18, 0x17, 0xB, 0xC, 0xA, 0 };
    s16 s1[6] = { 0x16, 0x15, 0xB, 0xC, 0xA, 0 };
    s16 s2[6] = { 0xF, 0x10, 0xB, 0xC, 0xA, 0 };
    s16 s3[6] = { 0xD, 0xE, 0xB, 0xC, 0xA, 0 };
    s16 s4[6] = { 0x13, 0x14, 0xB, 0xC, 0xA, 0 };
    s16 s5[6] = { 0x11, 0x12, 0xB, 0xC, 0xA, 0 };
    Event ev;
    u16 gfx;
    Obj *spr;
    u16 snd;
    u16 mode;
    void *saved;
    u16 pad1;
    u16 pad2;
    u16 quit;
    Menu *menu;
    Obj *box;
    Obj *left;
    Obj *right;
    Anim *anim;
    u32 i;
    s32 start;
    s32 limit;
    s16 team;
    s32 first;
    s32 second;
    s32 flag;
    u16 pad;

    func_800BF1C8();
    func_8000CDC0();
    func_800334B8();
    start = D_80088620;
    func_800B7D98();
    func_8003D78C(0);
    D_80086BE2 = 0;
    D_8008A3D8 = 0;
    func_800AAC40();
    func_800DD6EC();
    menu = func_80032E00(0, 0x4C);
    menu->unk_0A = 0;
    pad = D_80085280;
    menu->unk_10 = 4;
    menu->unk_0C = 0;
    menu->unk_48 = 0xB4;
    if (!(pad & 0xC0)) {
        menu->unk_08 = -2;
        menu->unk_04 = 0;
    } else {
        menu->unk_08 = pad & 0xFF3F;
        menu->unk_04 = 1;
    }
    D_80087780[0] = 0xB;
    for (i = 0; i < 0xB; i++) {
        D_80087780[i + 1] = 0;
    }
    D_80087784 = menu->text;
    func_8002E65C(menu->text, D_80082DDD);
    func_8002E688(menu->text, D_800014F8);
    func_8002E688(menu->text, D_8006D8EC);
    func_8002E688(menu->text, D_800014F8);
    func_8002E688(menu->text, D_8006D8FC);
    D_800877A0 = D_8006D8DC;
    D_800877A4 = D_8006D8E4;
    D_80087790 = 0;
    D_80087798 = 0;
    D_8008779C = 0;
    D_80087794 = 0;
    func_80031964();
    saved = func_8001AEA8(D_80086E30);
    if (D_80089320 == -1) {
        func_800BF1C8();
    }
    func_8000BF08();
    func_8000BF08();
    func_8000BF08();
    func_8000BF08();
    while (func_80036540(1)) {
        func_800B7C80();
        func_8003E460();
    }
    i = 1;
    mode = func_80016FD4();
    snd = func_800356C4(D_80000408, 0xC);
    func_80016FC4(snd);
    func_800E009C(D_80088090, D_80087AA4);
    D_80086E30[0] = 0x14;
    for (; i < 0x14; i++) {
        D_80086E30[i] = 0;
    }
    D_80086E30[17] = 0;
    setup.unk_10 = 4;
    setup.unk_04 = D_80087780;
    setup.unk_08 = D_80086E30;
    setup.unk_00 = 0x128;
    D_80086E30[1] = D_80084F18;
    D_80086E30[3] = D_80082DCC;
    D_80086E30[2] = D_80084F1C;
    D_80086E30[4] = D_80082DD0;
    left = func_8000D740(D_80085A44, 1, &setup);
    setup.unk_00 = 0x130;
    right = func_8000D740(D_80085A44, 1, &setup);
    menu->unk_00 = right;
    setup.unk_00 = 0x138;
    box = func_8000D740(D_80085A44, 1, &setup);
    box->unk_14 &= ~1;
    left->unk_1C = 0;
    left->unk_20 = 0xFA;
    right->unk_1C = 0;
    right->unk_20 = 0xFA;
    func_8003E460();
    while (left->unk_20 > 0) {
        func_8003E460();
        left->unk_20 -= D_8008A5B4 * 6;
        right->unk_20 -= D_8008A5B4 * 6;
    }
    left->unk_20 = 0;
    right->unk_20 = 0;
    func_8003E460();
    func_8003E460();
    func_8003E460();
    func_800E0500(menu, menu->unk_10, box);
    box->unk_14 |= 1;
    func_800B7DD8(1, 0x13, 0, 0, 0);
    while (D_8008929C != 0 && D_8008929C != 4) {
        func_800B7C80();
        func_8003E460();
    }
    setup2.unk_0C = 0x382;
    setup2.unk_04 = 2;
    setup2.unk_24 = D_80089344;
    D_80086E30[17] = D_80084F78;
    D_8008715C->unk_14 &= ~0x40000;
    menu->unk_06 = 1;
    gfx = func_800356C4(func_80000420, 0x648);
    D_800885E0 = func_8000B6F8(4, 3);
    func_8000C940(D_800885E0, 0x6F, 0x2B);
    func_8000C964(D_800885E0, 0x62, 0x49);
    func_8000C8AC(D_800885E0);
    func_8000CB78(D_800885E0, 0, 0);
    func_8000B7A4(D_800885E0, 0xB0);
    req.unk_0A = 2;
    req.unk_10 = 0;
    req.unk_18 = 0;
    req.unk_1C = 0;
    req.unk_0C = D_800885E0;
    flag = -(D_80073523[D_80087A92 * 16] & 2);
    if (D_80087A68 == 3) {
        if (flag) {
            req.unk_04 = s2;
        } else {
            req.unk_04 = s3;
        }
    } else if (D_80087A68 == 1) {
        if (flag) {
            req.unk_04 = s4;
        } else {
            req.unk_04 = s5;
        }
    } else {
        if (flag) {
            req.unk_04 = s0;
        } else {
            req.unk_04 = s1;
        }
    }
    team = func_80031A1C(2);
    if (team != 0) {
        req.unk_08 = 0x6F;
    } else {
        req.unk_08 = 0x6E;
    }
    req.unk_02 = req.unk_00 = gfx;
    D_80088D30 = func_8000D5BC(0, 0, 0);
    func_8000C898(D_800885E0, D_80088D30);
    spr = func_8000D740(D_80088D30, 0x10, &req);
    D_8006BB68 = spr;
    func_80041620(spr, 0);
    anim = spr->unk_08;
    func_80031A98();
    D_8008715C->unk_14 &= ~0x40000;
    func_800C0BBC(D_80087138, 0x500);
    func_800B7C80();
    func_8003E460();
    while (anim->unk_16 < 0x55) {
        func_8003456C(D_80085298, D_8008A5B4);
        func_8000BF08();
        if (D_8008715C->unk_14 & 0x40000) {
            func_80041620(spr, 1);
            D_8008715C->unk_14 &= ~0x40000;
        }
        if (anim->unk_16 < 0x28) {
            func_800E0218(menu, box);
        }
        if (func_800E01A8() & 0xFF) {
            goto end;
        }
    }
    func_80041620(spr, 0);
    first = 0;
    if (menu->unk_10 - 4 == team) {
        pad1 = D_80085280;
        pad2 = D_800857B2;
        first = 1;
        second = 0;
    } else {
        pad1 = D_800857B2;
        pad2 = D_80085280;
        second = 1;
        if (!(pad1 & 0xC0)) {
            menu->unk_08 = -2;
            menu->unk_04 = 0;
        } else {
            menu->unk_08 = pad1 & 0xFF3F;
            menu->unk_04 = 1;
        }
    }
    if (first) {
        if (team == 0) {
            func_8002E65C(menu->text, D_8006D964);
        } else {
            func_8002E65C(menu->text, D_8006D970);
        }
    }
    func_8001B314(left);
    menu->unk_06 = 0;
    func_800B7DD8(1, 0x14, team, first, 0);
    limit = D_80088620 + 0x69;
    while (D_80088620 < limit) {
        func_80030C74(&ev);
        if (ev.unk_00 & 2) {
            func_800E0744();
        }
        func_800B7C80();
        func_8003E460();
        if (func_800E01A8() & 0xFF) {
            goto end;
        }
    }
    while (D_8008929C != 0) {
        func_800B7C80();
        func_8003E460();
    }
    func_8003E460();
    func_800B7C80();
    func_8003E460();
    func_800B7C80();
    start = D_80088620;
    if (first == 0) {
        func_8003CEB8(7, 0x39, (s16)(func_8003CBB8() * 10 + 0x1B), 0x10);
    } else {
        func_8003CEB8(9, 0x3B, (s16)(func_8003CBB8() * 10 + 0x1E), 0x10);
    }
    func_800B7C80();
    func_8000BE80();
    func_8000D998(D_80088D30, spr);
    D_8006BB68 = 0;
    func_8000C9AC(D_800885E0, &D_8006BBAC[D_80064A4C >> 9]);
    ((Win *)D_800885E0)->unk_18 = D_8006BB6C[D_80064A4C >> 9].a;
    ((Win *)D_800885E0)->unk_1A = D_8006BB6C[D_80064A4C >> 9].b;
    ((Win *)D_800885E0)->unk_1C = D_8006BB6C[D_80064A4C >> 9].c;
    D_80085804 = D_8006BBEC[D_80064A4C >> 9].a;
    D_80085808 = D_8006BBEC[D_80064A4C >> 9].b;
    D_80085810 = D_8006BBEC[D_80064A4C >> 9].c;
    func_8000C940(D_800885E0, 0x6F, 0x2B);
    func_8000C964(D_800885E0, 0x62, 0x49);
    func_8000C8AC(D_800885E0);
    func_8000CB78(D_800885E0, 0, 0);
    func_8000B7A4(D_800885E0, 0xB0);
    D_80088D30 = func_8000D5BC(0, 0, 0);
    func_8000C898(D_800885E0, D_80088D30);
    spr = func_8000D740(D_80088D30, 0xF, &req);
    func_8000DE34(4);
    func_8000E3C8();
    func_8000E20C();
    func_8000BF08();
    if (first == 0) {
        menu->unk_0A = 1;
        right->unk_1C = 0xB4;
    }
    func_8002E65C(menu->text, D_80080C91[first].name);
    func_8002E688(menu->text, D_800014F8);
    func_8002E688(menu->text, D_8006D97C);
    D_80087798 = D_8006D94C;
    D_8008779C = D_8006D958;
    D_80087790 = D_8006D944;
    D_80087794 = D_8006D93C;
    D_800877A4 = 0;
    D_800877A0 = 0;
    func_8001B314(left);
    func_8001B314(right);
    func_800B7C80();
    menu->unk_10 = 1;
    menu->unk_0C = 2;
    menu->unk_08 = pad1 & 0xFF3F;
    menu->unk_48 = 0xB4;
    func_800E0500(menu, menu->unk_10, box);
    while (menu->unk_0C != 3) {
        func_800B7C80();
        if (start != 0) {
            if (D_80088620 >= start + 0x78) {
                start = 0;
            }
        }
        if (menu->unk_04 == 0) {
            func_8003E460();
            func_800E0388(0x8000, menu, box);
            for (i = 0; i < 0x2D; i++) {
                func_8003E460();
                if (func_800E01A8() & 0xFF) {
                    goto end;
                }
            }
        } else {
            func_800E0218(menu, box);
        }
        if (func_800E01A8() & 0xFF) {
            goto end;
        }
    }
    switch (menu->unk_10) {
    case 0:
        D_8008A3D8 = 1;
        D_80086BE2 = -1;
        break;
    case 1:
        D_80086BE2 = second;
        break;
    case 2:
        D_80086BE2 = first;
        break;
    case 3:
        D_8008A3D8 = 0;
        D_80086BE2 = -1;
        break;
    }
    if (!(pad2 & 0xC0)) {
        menu->unk_08 = -2;
        menu->unk_04 = 0;
    } else {
        menu->unk_08 = pad2 & 0xFF3F;
        menu->unk_04 = 1;
    }
    if (menu->unk_0A == 0) {
        menu->unk_0A = 1;
        right->unk_1C = 0xB4;
    } else {
        menu->unk_0A = 0;
        right->unk_1C = 0;
    }
    func_8002E65C(menu->text, D_80080C91[second].name);
    func_8002E688(menu->text, D_800014F8);
    menu->unk_08 = pad2 & 0xFF3F;
    menu->unk_10 = 4;
    menu->unk_48 = 0xB4;
    if (D_80086BE2 == -1) {
        func_8002E688(menu->text, D_8006D908);
        D_80087790 = 0;
        D_80087798 = 0;
        D_8008779C = 0;
        D_80087794 = 0;
        D_800877A4 = 0;
        D_800877A0 = 0;
        func_8001B314(left);
        func_8001B314(right);
        quit = 1;
        D_800877A0 = D_8006D944;
        D_800877A4 = D_8006D93C;
    } else {
        quit = 0;
        func_8002E688(menu->text, D_8006D920);
        func_8002E688(menu->text, D_800014F8);
        func_8002E688(menu->text, D_8006D930);
        D_80087790 = 0;
        D_80087798 = 0;
        D_8008779C = 0;
        D_80087794 = 0;
        D_800877A4 = 0;
        D_800877A0 = 0;
        func_8001B314(left);
        func_8001B314(right);
        D_800877A0 = D_8006D94C;
        D_800877A4 = D_8006D958;
    }
    func_8001B314(left);
    func_8001B314(right);
    func_800E0500(menu, menu->unk_10, box);
    while (menu->unk_0C != 4) {
        if (start != 0) {
            if (D_80088620 >= start + 0x78) {
                start = 0;
            }
        }
        if (menu->unk_04 == 0) {
            if (D_80086BE2 != -1) {
                if (func_80031964() & 0x100) {
                    menu->unk_10 = 4;
                } else {
                    menu->unk_10 = 5;
                }
                func_800E0500(menu, menu->unk_10, box);
                func_800E0388(0x8000, menu, box);
            } else {
                func_800E0388(0x8000, menu, box);
            }
            for (i = 0; i < 0x2D; i++) {
                func_8003E460();
            }
        } else {
            func_800E0218(menu, box);
        }
        if (func_800E01A8() & 0xFF) {
            goto end;
        }
    }
    if (D_80086BE2 == -1) {
        if (menu->unk_10 == 4) {
            D_80086BE2 = first;
        } else {
            D_80086BE2 = second;
            D_8008A3D8 = 1 - D_8008A3D8;
        }
    } else if (menu->unk_10 == 4) {
        if (D_80086BE2 == second) {
            D_8008A3D8 = 1;
        } else {
            D_8008A3D8 = 0;
        }
    } else {
        if (D_80086BE2 == second) {
            D_8008A3D8 = 0;
        } else {
            D_8008A3D8 = 1;
        }
    }
    if (quit == 0) {
        func_800B7DD8(1, 0x15, first, D_80086BE2, second);
    }
end:
    func_8000BEE8(0);
    func_8000BE80();
    func_8000D998(D_80088D30, spr);
    func_8000B7E4(D_800885E0);
    func_80035A7C(gfx);
    box->unk_14 &= ~1;
    while (left->unk_20 < 0xFA) {
        func_800B7C80();
        func_8003E460();
        left->unk_20 += D_8008A5B4 * 6;
        right->unk_20 += D_8008A5B4 * 6;
    }
    func_80032F3C(0, menu);
    func_8000D874(D_80085A44, D_80084F4C);
    func_8000D834(D_8008931C, D_80084F4C);
    func_8000D874(D_80085A44, D_8008809C);
    func_8000D834(D_8008931C, D_8008809C);
    func_8000D874(D_80085A44, left);
    func_8000D834(D_8008931C, left);
    func_8000D874(D_80085A44, right);
    func_8000D834(D_8008931C, right);
    func_8000D874(D_80085A44, box);
    func_8000D834(D_8008931C, box);
    func_800311D0();
    func_8000BE80();
    func_8003E460();
    func_80016FC4(mode);
    func_80035A7C(snd);
    func_8001AEA8(saved);
    func_800AAC94();
    func_8002FEA4(D_8008F9C4, 0xA, 0x78);
    D_80086DD8 = D_8008CA8C;
}
