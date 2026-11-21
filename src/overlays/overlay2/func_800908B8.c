#include "types.h"

s32 func_8000B2E0();                   /* extern */
s32 func_8000B614();                            /* extern */
s32 func_8000B6F8();                /* extern */
s32 func_8000B7E4();                         /* extern */
s32 func_8000BE80();                            /* extern */
s32 func_8000BEE8();                     /* extern */
s32 func_8000BF08();                            /* extern */
s32 func_8000C898();                    /* extern */
s32 func_8000C8A0();                             /* extern */
s32 func_8000C8AC();                         /* extern */
s32 func_8000C930(); /* extern */
s32 func_8000C940();       /* extern */
s32 func_8000C964();       /* extern */
s32 func_8000CE10();       /* extern */
s32 func_8000D2C0();                   /* extern */
s32 func_8000D4AC();                            /* extern */
s32 func_8000D5BC();       /* extern */
s32 func_8000D684();                         /* extern */
s32 func_80015C80(); /* extern */
s32 func_80015CFC();                            /* extern */
s16 func_80015D2C();                         /* extern */
s32 func_80016E80(); /* extern */
s32 func_80016EB4();                     /* extern */
s32 func_80016EE4();                            /* extern */
s32 func_8001AB74();                            /* extern */
s32 func_8001AD78();                     /* extern */
s32 func_8001B51C();          /* extern */
s32 func_80024694();                            /* extern */
s32 func_80024E9C();                            /* extern */
s32 func_80024F5C();                            /* extern */
s32 func_80028C1C();                            /* extern */
s32 func_8002FE58();                            /* extern */
s16 func_80031A1C();                         /* extern */
s32 func_80031A98();                            /* extern */
s32 func_800334B8();                            /* extern */
s32 func_80036CB4();                            /* extern */
s32 func_80036CBC();                            /* extern */
s32 func_80036D28();                            /* extern */
s32 func_80036D30();                            /* extern */
s32 func_80036D38();                            /* extern */
s32 func_80039674();                            /* extern */
s32 func_800396E0();                     /* extern */
s32 func_80039850();            /* extern */
s32 func_8003A600();            /* extern */
s32 func_8003A7B8();                              /* extern */
s32 func_8003C76C();                     /* extern */
s32 func_8003C8E0(); /* extern */
s32 func_8003CA4C();                            /* extern */
s32 func_8003D158();                     /* extern */
s32 func_8003D2D4();            /* extern */
s32 func_8003E2C0();              /* extern */
s32 func_8003E510();  /* extern */
s32 func_8003E668();                    /* extern */
s32 func_8003E9B0();                            /* extern */
s32 func_8003EB78();                            /* extern */
s32 func_8008D7B4();                            /* extern */
s32 func_8008DB64();                            /* extern */
s32 func_800928C8();                            /* extern */
s32 func_80092B98();                            /* extern */
s32 func_80093094();                            /* extern */
s32 func_80094028();                            /* extern */
s32 func_80094080();                            /* extern */
s32 func_800940D4();                            /* extern */
s32 func_80094114();                            /* extern */
s32 func_80094158();                            /* extern */
s32 func_800943EC();                            /* extern */
s32 func_80094A20();                     /* extern */
s32 func_80094AB0();                     /* extern */
s32 func_80096428();                            /* extern */
s32 func_80096838();                            /* extern */
s32 func_80096898();                            /* extern */
s32 func_8009DB14();                            /* extern */
s32 func_800A17C8();                            /* extern */
s32 func_800DC978();     /* extern */
s32 func_800DCBC4();                            /* extern */
s32 func_800DE7B8();                   /* extern */
extern s32 D_80000418;
extern s32 D_80000428;
extern u8 D_80001970;
extern u8 D_80064A54;
extern s32 D_800696F0;
extern s32 D_80069A30;
extern s16 D_8006B9E0;
extern s32 D_8007258C;
extern s16 D_8007A25C;
extern u16 D_80084F40;
extern s32 D_80086CCC;
extern s32 D_80086CD0;
extern s32 D_80086CD4;
extern s32 D_80086CD8;
extern s32 *D_80086DD8;
extern s32 D_80087130;
extern s16 D_800876DC;
extern s32 D_80087A64;
extern s16 D_80087A68;
extern s8 D_80087A6A;
extern s16 D_80087A92;
extern s32 D_80087AA4;
extern s32 D_80087AA8;
extern s32 D_80088090;
extern u16 D_800886FC;
extern s32 *D_80088D2C;
extern s32 D_800892AC;
extern s32 D_8008931C;
extern s32 D_80089490;
extern s16 D_800895D2;
extern u8 D_80089C18;
extern s16 D_8008A5B0;
extern s16 D_8008AF84;
extern u16 D_8008B3C8;
extern s32 D_8008B3D0;
extern s16 D_8008B670;
extern s32 D_8008B8E8;
extern s16 D_800BDF08;
extern s32 D_800BEF98;
extern s32 D_800BF2EC;
extern s32 D_800BF540;
extern s32 D_800BF634;
extern s32 D_800C01D4;
extern s32 D_800C2ED4;
extern s32 func_80000404;
extern s32 func_80000410;
extern s32 func_80000414;
extern s32 func_8000041C;
extern s32 func_8002ED70;

typedef struct {
    /* 0x0000 */ s32 id : 8;
    /* 0x0001 */ char unk1[0x2A];
    /* 0x002B */ char unk2B[0x15];
    /* 0x0040 */ char unk40[0x15];
    /* 0x0055 */ char unk55[0x17];
    /* 0x006C */ u16 roster[0x37];
    /* 0x00DA */ u8 unkDA[0x2104 - 0xDA];
    /* 0x2104 */ u16 score;
    /* 0x2106 */ s16 unk2106;
    /* 0x2108 */ u8 pad2108[0x18];
    /* 0x2120 */ s16 unk2120;
    /* 0x2122 */ u8 pad2122[0x214C - 0x2122];
} Team;
typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ s16 unk4;
    /* 0x06 */ s16 unk6;
    /* 0x08 */ s16 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 unk18;
    /* 0x1C */ s32 unk1C[3];
} Info;
typedef struct {
    s32 unk0;
    s32 unk4;
    s32 unk8;
} Node;
typedef struct {
    s16 wins[8];
    s16 losses[8];
    s16 ties[8];
    s16 ids[8];
} Record;
typedef struct {
    u16 a;
    u16 b;
} Margin;
extern Team D_80080C90[2];
extern Record D_80088170;
extern Margin D_800881B0[8];
extern Margin D_800881D0[8];
extern u16 D_800881F0[3][8][8];
extern u16 D_80088370[2][8][8];
extern s16 D_80089598[];
extern Node *D_800C48B8[];
extern s16 D_80086190[];
extern s16 D_8006B9E4[];
extern char *D_800C010C[];
extern char *D_800C017C[];
extern u8 D_800C4B44[];
extern u16 D_800C4B5C[][0x31];
extern u8 D_800C509E[];
extern char D_800893C0[][6];
extern void *D_80085158[16];
void *func_80032E00(s32, s32);
s32 func_8000D740(s32, s32, Info *);
Node *func_8000D8DC(s32, Info *);
s32 func_80016FD4(void);
u16 func_800356C4(void *, s32);
u16 func_80035674(void *);
void *func_80035D7C(u16, s32);
void func_8003AE80(u16 *, u8 *);
void func_8002E17C(void *, void *, u32);
void func_80016FE4(void *);
void func_8000D834(void *, void *);
void func_80032F3C(s32, void *);
void func_8002E65C(char *, char *);
void func_8002E688(char *, char *);
void func_8003A7DC(s32, Team *);
void func_80035F88(u16, s32);
void func_80035EF0(u16, s32);
void func_8001AAD8(u16, s32);
void func_80016FC4(u16);
void func_80035A7C(u16);
#define S0 D_80080C90[0].score
#define S1 D_80080C90[1].score
extern Node *D_8007A260;
extern s16 D_800892B4[2];
extern struct { s8 count; u8 pad; u8 ids[0x1F]; } D_800C509C;
void func_80094B18();
s32 func_8003DC54(u16);
void func_8003EB2C();

void func_800908B8(void) {
    s16 home[8];
    s16 away[8];
    s16 i;
    s16 j;
    s16 nh;
    s16 na;
    s16 win;
    s16 n;
    Info *info;
    u16 id;
    u16 id2;
    u16 saved;
    s32 raw;
    void *src;
    Node *node;
    s32 k;
    s32 *var_a0_1206;
    s32 *var_a1_1180;
    s16 temp_s0_1279;
    s16 temp_s0_1306;
    s16 temp_s1_1286;
    s32 var_a0_1759;
    s32 var_v1_1853;
    s32 temp_v0_46;
    s32 temp_v0_99;

    if (D_8008A5B0 != 0) {
        func_8002FE58();
    }
    func_8008D7B4();
    func_8003C8E0(&func_8000041C, 0xB1C, 0x42, 1);
    func_8003D158(1);
    func_80036D28();
    func_8003D2D4(0x3F, 1);
    func_8000B2E0(&D_80069A30);
    func_8000C930(&D_8008B3D0, 0, 0, 0);
    temp_v0_46 = func_8000B6F8(4, 5);
    D_80088090 = temp_v0_46;
    func_8000C940(temp_v0_46, 0, 0);
    func_8000C964(D_80088090, 0x140, 0xF0);
    func_8000D2C0(&D_800696F0);
    D_80087A64 = func_8000D5BC(0, 0, 0);
    D_80087AA8 = func_8000D5BC(0, 0, 0);
    func_80016E80(6, &func_80000404, 0x720);
    func_80016EB4(0x10C);
    func_80015C80(D_80087AA8, 0, 2, &func_80000414, 0x18);
    func_8000C898(D_80088090, D_80087A64);
    temp_v0_99 = func_8000B6F8(0xA, 4);
    D_80087AA4 = temp_v0_99;
    func_8000C940(temp_v0_99, 0, 0);
    func_8000C964(D_80087AA4, 0x140, 0xF0);
    func_8000C8AC(D_80087AA4);
    func_8000C898(D_80087AA4, D_80087AA8);
    info = func_80032E00(0, 0x28);
    info->unk0 = 0x1D;
    info->unkC = 0;
    info->unk4 = 0xA;
    info->unk6 = 0;
    info->unk8 = 0;
    info->unk10 = 0;
    D_80087130 = func_8000D740(func_8000C8A0(D_80088090), 0, info);
    info->unk0 = 5;
    D_80086CCC = func_8000D740(func_8000C8A0(D_80088090), 0, info);
    info->unk0 = 6;
    D_80086CD0 = func_8000D740(func_8000C8A0(D_80088090), 0, info);
    info->unk0 = 7;
    D_80086CD4 = func_8000D740(func_8000C8A0(D_80088090), 0, info);
    info->unk0 = 8;
    D_80086CD8 = func_8000D740(func_8000C8A0(D_80088090), 0, info);
    func_80032F3C(0, info);
    id = func_80035674(&func_80000404);
    src = func_80035D7C(id, 0x9);
    D_80085158[0] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[0], src, 0x200);
    func_80035F88(id, 0x9);
    src = func_80035D7C(id, 0xd);
    D_80085158[1] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[1], src, 0x200);
    func_80035F88(id, 0xd);
    src = func_80035D7C(id, 0x11);
    D_80085158[2] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[2], src, 0x200);
    func_80035F88(id, 0x11);
    src = func_80035D7C(id, 0x15);
    D_80085158[3] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[3], src, 0x200);
    func_80035F88(id, 0x15);
    src = func_80035D7C(id, 0xa);
    D_80085158[4] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[4], src, 0x200);
    func_80035F88(id, 0xa);
    src = func_80035D7C(id, 0xe);
    D_80085158[5] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[5], src, 0x200);
    func_80035F88(id, 0xe);
    src = func_80035D7C(id, 0x12);
    D_80085158[6] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[6], src, 0x200);
    func_80035F88(id, 0x12);
    src = func_80035D7C(id, 0x16);
    D_80085158[7] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[7], src, 0x200);
    func_80035F88(id, 0x16);
    src = func_80035D7C(id, 0xb);
    D_80085158[8] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[8], src, 0x200);
    func_80035F88(id, 0xb);
    src = func_80035D7C(id, 0xf);
    D_80085158[9] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[9], src, 0x200);
    func_80035F88(id, 0xf);
    src = func_80035D7C(id, 0x13);
    D_80085158[10] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[10], src, 0x200);
    func_80035F88(id, 0x13);
    src = func_80035D7C(id, 0x17);
    D_80085158[11] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[11], src, 0x200);
    func_80035F88(id, 0x17);
    src = func_80035D7C(id, 0xc);
    D_80085158[12] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[12], src, 0x200);
    func_80035F88(id, 0xc);
    src = func_80035D7C(id, 0x10);
    D_80085158[13] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[13], src, 0x200);
    func_80035F88(id, 0x10);
    src = func_80035D7C(id, 0x14);
    D_80085158[14] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[14], src, 0x200);
    func_80035F88(id, 0x14);
    src = func_80035D7C(id, 0x18);
    D_80085158[15] = func_80032E00(0, 0x200);
    func_8002E17C(D_80085158[15], src, 0x200);
    func_80035F88(id, 0x18);
    func_8000CE10(D_80088090, 1, 8);
    na = 0;
    nh = 0;
    if (((u32) ((u16) D_8008A5B0 - 1) < 2U) || ((u32) ((u16) D_8008A5B0 - 5) < 2U)) {
        i = 0;
        if (D_800876DC != 7) {
            for (; i < 8; i++) {
                if (D_80088170.ids[i] != -1) {
                    switch (D_80089598[D_80088170.ids[i]]) {
                    case 0:
                        home[nh++] = i;
                        if (S0 > S1) {
                            D_80088170.wins[i]++;
                        }
                        if (S0 < S1) {
                            D_80088170.losses[i]++;
                        }
                        if (S0 == S1) {
                            D_80088170.ties[i]++;
                        }
                        break;
                    case 1:
                        away[na++] = i;
                        if (S1 > S0) {
                            D_80088170.wins[i]++;
                        }
                        if (S1 < S0) {
                            D_80088170.losses[i]++;
                        }
                        if (S1 == S0) {
                            D_80088170.ties[i]++;
                        }
                        break;
                    }
                    D_80088170.ids[i] = -1;
                }
            }
            win = S0 > S1;
            if (S0 == S1) {
                win = -1;
            }
            if ((nh != 0) & (na != 0)) {
                for (i = 0; i < nh; i++) {
                    for (j = 0; j < na; j++) {
                        D_80088370[0][home[i]][away[j]] += S0;
                        D_80088370[1][home[i]][away[j]] += S1;
                        switch (win) {
                        case 1:
                            D_800881F0[0][home[i]][away[j]]++;
                            if (D_800881B0[home[i]].a - D_800881B0[home[i]].b < S0 - S1) {
                                D_800881B0[home[i]].a = S0;
                                D_800881B0[home[i]].b = S1;
                            }
                            break;
                        case 0:
                            D_800881F0[1][home[i]][away[j]]++;
                            if (D_800881D0[home[i]].b - D_800881D0[home[i]].a < S1 - S0) {
                                D_800881D0[home[i]].a = S1;
                                D_800881D0[home[i]].b = S0;
                            }
                            break;
                        case -1:
                            D_800881F0[2][home[i]][away[j]]++;
                            break;
                        }
                    }
                }
                for (i = 0; i < na; i++) {
                    for (j = 0; j < nh; j++) {
                        D_80088370[0][away[i]][home[j]] += S1;
                        D_80088370[1][away[i]][home[j]] += S0;
                        switch (win) {
                        case 0:
                            D_800881F0[0][away[i]][home[j]]++;
                            if (D_800881B0[away[i]].a - D_800881B0[away[i]].b < S1 - S0) {
                                D_800881B0[away[i]].a = S1;
                                D_800881B0[away[i]].b = S0;
                            }
                            break;
                        case 1:
                            D_800881F0[1][away[i]][home[j]]++;
                            if (D_800881D0[away[i]].b - D_800881D0[away[i]].a < S0 - S1) {
                                D_800881D0[away[i]].a = S0;
                                D_800881D0[away[i]].b = S1;
                            }
                            break;
                        case -1:
                            D_800881F0[2][away[i]][home[j]]++;
                            break;
                        }
                    }
                }
            }
        }
    }
    D_8008B670 = D_800895D2 = func_80015D2C(0);
    D_8008AF84 = func_80015D2C(1);
    func_8001B51C(D_800895D2, D_8008AF84, D_8008B670, D_8008AF84);
    func_800334B8();
    D_80084F40 = func_800356C4(&D_80000418, 0x84);
    raw = func_80016FD4();
    id = raw;
    func_80035EF0(id, 0x85);
    func_80035EF0(id, 0x86);
    func_80035EF0(id, 0x87);
    func_80035EF0(id, 0x88);
    func_80035EF0(id, 0x89);
    func_80035EF0(id, 0x8a);
    func_80035EF0(id, 0x8b);
    func_80035EF0(id, 0x8c);
    func_80035EF0(id, 0x8d);
    func_80035EF0(id, 0x48);
    func_80035EF0(id, 0x1a);
    func_80035EF0(id, 0x1f);
    func_80035EF0(id, 0x1e);
    func_80035EF0(id, 0x6d);
    func_80035EF0(id, 0x2);
    func_80016FC4(D_80084F40);
    info = func_80032E00(0, 0x28);
    info->unk4 = 4;
    info->unkC = 0;
    info->unk6 = 0;
    info->unk8 = 0;
    info->unk10 = 0;
    info->unk0 = 5;
    D_8007A260 = func_8000D8DC(0, info);
    info->unk18 = D_8007A260->unk8;
    info->unkC = 0x408;
    func_800334B8();
    id2 = func_800356C4(&D_80000428, 0xF78);
    func_80016FC4(id2);
    info->unk0 = 2;
    for (i = 0; i < 0x86; i++) {
        D_800C48B8[i] = func_8000D8DC(0, info);
        func_80016FE4(D_800C48B8[i]);
        info->unk0++;
    }
    func_80035A7C(id2);
    func_800334B8();
    func_8000D834(D_8008931C, D_8007A260);
    func_80016FC4(raw & 0xFFFF);
    func_800334B8();
    func_80035EF0(D_80084F40, 1);
    func_80035EF0(D_80084F40, 0);
    func_80035EF0(D_80084F40, 8);
    func_80035EF0(D_80084F40, 9);
    func_80035EF0(D_80084F40, 0xA);
    func_80035EF0(func_80016FD4(), 0x8F);
    func_80032F3C(0, info);
    func_8000BEE8(2);
    D_80087A68 = 0;
    D_80089490 = -1;
    raw = func_80016FD4();
    func_80016FC4(D_80084F40);
    func_80039674();
    func_80016FC4(raw & 0xFFFF);
    D_800886FC = func_800356C4(&func_80000410, 0x2B8);
    func_8001AAD8(D_800886FC, 0x2B);
    func_8001AD78(0);
    func_80036D30();
    if (D_8008A5B0 == 0) {
        if (D_8008B3C8 == 0) {
            func_80024694();
            func_80039850(0, 1);
            func_80024E9C();
        }
        for (i = 0; i < 0x10; i++) {
            D_80086190[i] = i;
        }
    }
    D_8007A25C = 0;
    func_80094158();
    switch (D_8008A5B0) {
    case 0:
        if (D_80089C18 == 0) {
            func_800DC978(D_80088090, &D_800BEF98, 0x18);
        } else if ((u32) (D_80089C18 - 1) < 2U) {
            func_8000BF08();
            func_8000BF08();
            func_80031A98();
            func_800DC978(D_80088090, &D_800BF634, 0x18);
            func_800DE7B8(&D_800BEF98);
            func_800940D4();
        }
        break;
    case 2:
    case 3:
    case 4:
        func_800DC978(D_80088090, &D_800BEF98, 0x18);
        break;
    case 1:
        func_800928C8();
        func_800DC978(D_80088090, &D_800BF540, 0x18);
        func_800DE7B8(&D_800BEF98);
        func_800DE7B8(&D_800BF2EC);
        func_800940D4();
        break;
    case 6:
        func_8009DB14();
        func_800DC978(D_80088090, &D_800C01D4, 0x18);
        func_800DE7B8(&D_800BEF98);
        func_800940D4();
        break;
    case 5:
        func_800A17C8();
        func_800DC978(D_80088090, &D_8007258C, 0x18);
        func_800DE7B8(&D_800BEF98);
        func_800940D4();
        break;
    }
    func_80036CB4();
    func_80096838();
    func_8000BF08();
    func_8000BF08();
    func_8000BE80();
    func_80031A98();
    func_800DCBC4();
    if (D_80087A92 == 0x24) {
        D_80087A68 = 4;
    }
    func_8003A7DC(func_8003DC54(D_80087A92) & 0xFFFF, &D_80080C90[0]);
    func_8002E65C((char *)&D_80064A54, D_80080C90[0].unk40);
    func_8002E688((char *)&D_80064A54, (char *)&D_80001970);
    func_8002E688((char *)&D_80064A54, D_80080C90[0].unk2B);
    temp_s0_1279 = D_8008A5B0;
    if ((temp_s0_1279 == 1) && (func_80094A20(5), temp_s1_1286 = D_8008A5B0, (temp_s1_1286 == temp_s0_1279)) && (func_80094028(), func_80092B98(), func_80092B98(), func_80092B98(), func_80036D38(), func_80092B98(), func_80092B98(), func_80092B98(), temp_s0_1306 = D_8008A5B0, (temp_s0_1306 == temp_s1_1286))) {
        if (D_800C509C.count < 0x15) {
            func_80092B98();
            func_80092B98();
            func_80092B98();
            func_80092B98();
            func_80092B98();
            func_80024F5C();
            func_8003EB78();
            if (D_8008A5B0 == temp_s0_1306) {
                if (D_800C509C.count != 0x15) {
                    func_80094080();
                }
                goto block_88;
            }
        } else {
block_88:
            if (D_8008A5B0 == 1) {
                if (D_800C509C.count == 0x15) {
                    func_80024F5C();
                    func_8003EB78();
                    func_80092B98();
                    func_80092B98();
                    func_80092B98();
                    func_80093094();
                    D_80087A92 = 0x1E;
                    func_8003E9B0();
                    if (D_80087A68 == 4) {
                        D_80087A68 = 0;
                    }
                    func_80094080();
                    func_80092B98();
                    func_80092B98();
                    func_80092B98();
                }
                if (D_8008A5B0 == 1) {
                    func_80094AB0(0);
                }
            }
        }
    }
    if (D_8008A5B0 == 5) {
        func_80024F5C();
    }
    if (D_8008A5B0 == 6) {
        func_8003C76C(0);
        D_80087A68 = func_80031A1C(5);
        func_8003A600(1, 0);
        D_8006B9E0 = 0x1E;
        for (i = 0; i < 0x1E; i++) {
            D_8006B9E4[i] = i;
        }
        func_80024694();
        func_8003A7DC(0x74, &D_80080C90[0]);
        func_8002E65C(D_80080C90[0].unk1, D_800C010C[D_800C4B44[D_800892B4[1]]]);
        func_8002E65C(D_80080C90[0].unk55, D_800C017C[D_800C4B44[D_800892B4[1]]]);
        D_80080C90[0].unk2106 = 3;
        D_80080C90[0].score = 0;
        D_80080C90[0].unk2120 = 0;
        func_8003A7DC(0x75, &D_80080C90[1]);
        func_8002E65C(D_80080C90[1].unk1, D_800C010C[D_800C4B44[D_800892B4[0]]]);
        func_8002E65C(D_80080C90[1].unk55, D_800C017C[D_800C4B44[D_800892B4[0]]]);
        D_80080C90[1].unk2106 = 3;
        D_80080C90[1].score = 0;
        D_80080C90[1].unk2120 = 0;
        j = 0;
        for (i = 0; i < 0x31; i++) {
            if (D_800C4B5C[D_800892B4[1]][i] != 0xFFFF) {
                D_80080C90[0].roster[j++] = D_800C4B5C[D_800892B4[1]][i];
            }
        }
        while (j < 0x37) {
            D_80080C90[0].roster[j++] = 0xFFFF;
        }
        j = 0;
        for (i = 0; i < 0x31; i++) {
            if (D_800C4B5C[D_800892B4[0]][i] != 0xFFFF) {
                D_80080C90[1].roster[j++] = D_800C4B5C[D_800892B4[0]][i];
            }
        }
        while (j < 0x37) {
            D_80080C90[1].roster[j++] = 0xFFFF;
        }
        func_8003AE80(D_80080C90[0].roster, D_80080C90[0].unkDA);
        func_8003AE80(D_80080C90[1].roster, D_80080C90[1].unkDA);
        func_8003A600(0, 0);
        func_80024E9C();
        func_8003E9B0();
        D_800892B4[0] = D_800C4B44[D_800892B4[0]];
        D_800892B4[1] = D_800C4B44[D_800892B4[1]];
        func_8003C76C(1);
    }
    func_80094114();
    func_800943EC();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80096898();
    func_80036CBC();
    func_8003CA4C();
    func_8002FE58();
    if (D_8008A5B0 == 1) {
        for (i = 0; i < 0x1E; i++) {
            func_8002E65C(D_800893C0[i], (char *)func_8003A7B8(D_800C509C.ids[i]) + 0x55);
        }
    }
    for (i = 0; i < 0x86; i++) {
        func_8000D834(D_8008931C, D_800C48B8[i]);
    }
    func_80092B98();
    func_800334B8();
    func_80092B98();
    if (((D_8008A5B0 != 1) || (D_800C509C.count != 0x15)) && (D_8008A5B0 != 6)) {
        if (D_8008A5B0 == 1) {
            func_8003EB2C();
            func_8003E510(D_800892B4[1], D_800892B4[0], 0, 0);
            func_8003EB78();
        } else if ((D_8008A5B0 == 2) && (D_800BDF08 != 0)) {
            func_8003E668(D_800892B4[1], D_800892B4[0]);
        } else {
            func_8003E510(D_800892B4[1], D_800892B4[0], 0, 0);
        }
    }
    D_80087A6A = 0;
    if (((func_8003E2C0(&D_800C2ED4, 0) & 0xFF) == 1) && (((D_80080C90[0].id >= 0x1E) && (D_80080C90[0].id < 0x30)) || ((u8) D_80080C90[0].id == 0x79))) {
        D_80087A6A = 1;
    }
    func_80096428();
    raw = func_80016FD4();
    func_80016FC4(D_80084F40);
    func_80028C1C();
    func_800396E0(1);
    func_80016FC4(raw & 0xFFFF);
    func_8000B7E4(D_80088090);
    func_8000B7E4(D_80087AA4);
    func_8000D684(D_80087A64);
    func_8000D684(D_80087AA8);
    func_80015CFC();
    func_80016EE4();
    func_8001AB74();
    func_8000D4AC();
    func_8000BEE8(0);
    func_80035A7C(D_80084F40);
    func_80035A7C(D_800886FC);
    func_8000B614();
    func_800334B8();
    func_8008DB64();
    if (D_8008A5B0 == 1) {
        var_a0_1759 = 1;
        for (var_v1_1853 = 0; var_v1_1853 < 0x1E; var_v1_1853++) {
            if (D_800C509C.ids[var_v1_1853] >= 0x1E) {
                var_a0_1759 = 0;
                break;
            }
        }
        if ((var_a0_1759 == 1) && (D_800C509C.count < 0x16)) {
            func_80094B18();
            D_80088D2C = &D_8008B8E8;
            D_80086DD8 = &func_8002ED70;
            D_800892AC = 2;
            return;
        }
    } else {
        k = 0xF;
        do {
            func_80032F3C(0, D_80085158[k]);
        } while (k-- != 0);
    }
    D_80086DD8 = &D_8008B8E8;
}
