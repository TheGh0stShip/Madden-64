#include "types.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC;
} Mask;

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
} Stats;

typedef struct {
    u8 pad0[0x1F];
    u8 unk1F;
    u8 pad20;
    u8 unk21;
    u8 pad22[2];
    Stats *unk24;
    u8 pad28[0x3C];
    u8 unk64;
} Player;

typedef struct {
    u8 pad0[2];
    s16 unk2;
} Info;

typedef struct {
    u8 unk0;
    u8 pad1[0x20A1];
    s16 unk20A2;
    u8 pad20A4[0xA];
    s16 unk20AE;
    u8 pad20B0[0xC];
    Info *unk20BC;
    u8 pad20C0[4];
    s32 unk20C4;
    u8 pad20C8[0x214C - 0x20C8];
} TeamBlock;

typedef struct {
    s32 unk0;
    s32 entries[1];
} Table;

extern s16 D_80088AE4;
extern s8 D_80086DDC[];
extern s32 D_80080C10;
extern s16 D_800857B2;
extern u8 D_800857B3;
extern s16 D_800869D0[];
extern s16 D_800869D6;
extern s16 D_80086CF2;
extern s8 D_8008B2A8[];
extern Mask *D_80072720[];
extern s32 D_8008B360[];
extern s32 D_800878A8[];
extern s16 D_80086C24[];
extern u16 D_8008A5B4;
extern s16 D_800892D0;
extern Table *D_800895DC;
extern TeamBlock D_80080CF8[];
extern s16 D_80089320;
extern u16 D_8008A5B2;
extern u16 D_8008B672;
extern Player *D_80085040[][22];
extern s16 D_8006B7BC;
extern u8 D_8008AFC6;
extern s32 D_80089380[];
extern s16 D_80085BFE;
extern s32 D_80089490;
extern Player *D_800880F0[];
extern s32 D_80086178;
extern u8 D_80086CE8[];
extern u8 D_8008951A;
extern s16 D_80089518;
extern s32 D_800876EC;
extern s32 D_800876F0;

void func_800AE7F0(u16 team);
void func_80041718(s32 arg0);
void func_80092978(s16 team, s32 mask);
void indexed_runtime_slot_release(u16 team);
s16 func_800DD28C(s32 arg0);
void func_800920B8(s16 team, s32 arg1);
s32 func_80031A1C(u16 arg0);
s16 weighted_group_object_count(void);
void func_80091E2C(s16 team);
void func_800D62A8(void);
s16 func_8008F318(void);
void func_8008F624(void);
void func_80093110(void);
void func_800416A4(s32 arg0);
void func_800BDD70(Player *player, s32 arg1);
void func_800A2E4C(void *arg0, s32 arg1);
void conditional_mode_activate(s32 arg0);
void func_800935A4(s32 arg0);
s16 func_800BBA64(Player *player);
void func_800E1C98(Player *player);
void func_800C9FB4(Player *player);
void func_800CA120(Player *player);

void func_8008DA38(void) {
    s16 team = D_80088AE4;
    s16 flag = 0;
    s16 i;
    s32 bits;
    Player *player;
    s16 kind;
    s16 v;

    if (D_80086DDC[team] == 1 && (D_80080C10 & 0x800)) {
        if (D_800857B2 != 0) {
            if (D_800869D0[team] == 0) {
                if (D_80086CF2 != 6) {
                    if (D_800878A8[(s16)(D_800857B2 & ~0xC0)] & ~D_8008B360[team] &
                        D_80072720[D_8008B2A8[(s16)(D_800857B2 & ~0xC0)]]->unk0) {
                        D_800869D0[team] = -1;
                        func_800AE7F0(team);
                        func_80041718(0xB);
                        D_8008B360[D_80088AE4] = D_800878A8[(s16)(D_800857B2 & ~0xC0)];
                        D_80086C24[D_80088AE4] = 0xF0;
                        flag = 1;
                    }
                }
            } else {
                if (D_80086CF2 != 6) {
                    func_80092978(team, D_800878A8[(s16)(D_800857B2 & ~0xC0)] & ~D_8008B360[team]);
                    flag = 1;
                    if (D_800869D0[D_80088AE4] != 0) {
                        if ((s16)(D_80086C24[D_80088AE4] -= D_8008A5B4) < 0) {
                            indexed_runtime_slot_release(D_80088AE4);
                        }
                    }
                }
                D_8008B360[D_80088AE4] = D_800878A8[(s16)(D_800857B2 & ~0xC0)];
            }
        } else {
            if ((s16)(D_80086C24[team] -= D_8008A5B4) < 0) {
                if (D_800869D0[team] != 0) {
                    indexed_runtime_slot_release(team);
                    D_800892D0 = 0;
                    D_80086C24[D_80088AE4] = 0xF0;
                } else {
                    v = func_800DD28C(2);
                    if (v != 0) {
                        func_800AE7F0(D_80088AE4);
                        D_80086C24[D_80088AE4] = 0xB4;
                        v &= 0x7FFF;
                        D_80080CF8[D_80088AE4].unk20A2 = v;
                        D_80080CF8[D_80088AE4].unk20C4 = D_800895DC->entries[v & 0x1FFF];
                        D_80080CF8[D_80088AE4].unk20AE = func_800DD28C(1);
                        D_800869D0[D_80088AE4] = -1;
                        func_80041718(0xB);
                        func_800920B8(D_80088AE4, 0);
                    } else {
                        D_80086C24[D_80088AE4] =
                            func_80031A1C((0xFF - D_80080CF8[D_80088AE4].unk0) >> 3) + 30;
                    }
                }
            }
        }
    } else {
        D_8008B360[D_80088AE4] = D_800878A8[(s16)(D_800857B2 & ~0xC0)];
    }

    if (D_80089320 != -1) {
        if (D_80086DDC[D_80088AE4] == 0) {
            if (weighted_group_object_count() == 0 && D_8008A5B2 == 1) {
                func_80091E2C(D_80088AE4);
                func_800D62A8();
            }
        }
        for (i = 0; i < (D_8008B672 >> 1); i++) {
            u8 code = D_80085040[D_80088AE4][i]->unk21;

            if ((code & 0xC0) != 0x40) {
                continue;
            }
            if ((i == D_80080CF8[D_80088AE4].unk20BC->unk2 && D_8006B7BC != 1) ||
                (i == 1 && D_8006B7BC == i) || D_8008AFC6 != 0) {
                if (flag == 0) {
                    bits = D_800878A8[D_80085040[D_80088AE4][i]->unk21 & ~0xC0] & ~D_8008B360[D_80088AE4];
                    D_8008B360[D_80088AE4] = D_800878A8[(s16)(D_800857B2 & ~0xC0)];
                    if (bits & D_80072720[D_8008B2A8[D_80085040[D_80088AE4][i]->unk21 & ~0xC0]]->unk8) {
                        if (func_8008F318() != 0) {
                            if (D_800869D6 < 0) {
                                func_8008F624();
                            }
                            D_80089380[D_80085040[D_80088AE4][i]->unk21 & ~0xC0] =
                                (bits | D_80072720[D_8008B2A8[D_80085040[D_80088AE4][i]->unk21 & ~0xC0]]->unk8) & ~0xF00;
                            D_800878A8[D_80085040[D_80088AE4][i]->unk21 & ~0xC0] = bits;
                            continue;
                        }
                        D_800878A8[(s16)(D_800857B2 & ~0xC0)] = 0;
                        continue;
                    } else {
                        if (bits & D_80072720[D_8008B2A8[D_80085040[D_80088AE4][i]->unk21 & ~0xC0]]->unk4) {
                            if (!(D_80080C10 & 0x100)) {
                                D_80085BFE = 0x3C;
                                func_80093110();
                                func_800416A4(0xA);
                            }
                        }
                        if (D_8008AFC6 != 0 && !(D_80080C10 & 0x100)) {
                            Player *pl = D_80085040[D_80088AE4][i];

                            if (bits & D_80072720[D_8008B2A8[pl->unk21 & ~0xC0]]->unkC) {
                                Player *sel;

                                func_800BDD70(pl, pl->unk21 & 0x3F);
                                sel = D_800880F0[D_80089490];
                                func_800A2E4C(D_80086CE8, sel->unk1F != 0 ? (s32)sel->unk24 : D_80086178);
                                D_8008951A = sel->unk1F;
                                D_800878A8[(s16)(D_800857B2 & ~0xC0)] = 0;
                                return;
                            }
                        }
                        if (bits & 0x2020) {
                            conditional_mode_activate(D_800857B3 & 0x3F);
                        } else if (bits & 0x10) {
                            func_800935A4(D_800857B3 & 0x3F);
                        }
                        if (D_80089518 != -1) {
                            player = D_80085040[D_80088AE4][D_80089518];
                            kind = (func_800BBA64(D_80085040[D_80088AE4][i]) + 0xFF) >> 9;
                            if ((player->unk21 & 0xC0) != 0x40) {
                                if (player->unk64 == 0 || player->unk64 == 2) {
                                    if (kind == 6 && D_800876EC + 0x30000 < player->unk24->unk1C) {
                                        func_800E1C98(player);
                                        func_800C9FB4(player);
                                    } else if (kind == 2 && player->unk24->unk1C < D_800876F0 - 0x30000) {
                                        func_800E1C98(player);
                                        func_800CA120(player);
                                    }
                                }
                            }
                        }
                    }
                }
                D_800878A8[(s16)(D_800857B2 & ~0xC0)] = 0;
            } else {
                bits = D_800878A8[code & ~0xC0] & ~D_80089380[code & ~0xC0];
                if (bits & D_80072720[D_8008B2A8[code & ~0xC0]]->unk8) {
                    D_80089380[code & ~0xC0] |= D_80072720[D_8008B2A8[code & ~0xC0]]->unk8;
                    func_800BDD70(D_80085040[D_80088AE4][i], D_80085040[D_80088AE4][i]->unk21 & 0x3F);
                }
                if (i == D_80089518) {
                    if (D_80085040[D_80088AE4][i]->unk64 == 0 || D_80085040[D_80088AE4][i]->unk64 == 2) {
                        player = D_80085040[D_80088AE4][i];
                        kind = (func_800BBA64(player) + 0xFF) >> 9;
                        if (kind == 6 && D_800876EC + 0x30000 < player->unk24->unk1C) {
                            func_800E1C98(player);
                            func_800C9FB4(player);
                        } else if (kind == 2 && player->unk24->unk1C < D_800876F0 - 0x30000) {
                            func_800E1C98(player);
                            func_800CA120(player);
                        }
                    }
                }
            }
        }
    } else {
        if (D_80086DDC[D_80088AE4] == 0) {
            func_80091E2C(D_80088AE4);
        }
        D_8008B360[D_80088AE4] = D_800878A8[(s16)(D_800857B2 & ~0xC0)];
        if (flag) {
            D_80089380[(s16)(D_800857B2 & ~0xC0)] = D_800878A8[(s16)(D_800857B2 & ~0xC0)];
        }
        if (D_800869D0[D_80088AE4] == 0) {
            for (i = 0; i < (D_8008B672 >> 1); i++) {
                u8 c = D_80085040[D_80088AE4][i]->unk21;

                if ((c & 0xC0) == 0x40) {
                    bits = D_800878A8[c & ~0xC0] & ~D_80089380[c & ~0xC0];
                    if (bits & D_80072720[D_8008B2A8[c & ~0xC0]]->unk8) {
                        D_80089380[c & ~0xC0] |= D_80072720[D_8008B2A8[c & ~0xC0]]->unk8;
                        func_800BDD70(D_80085040[D_80088AE4][i], D_80085040[D_80088AE4][i]->unk21 & 0x3F);
                    }
                }
            }
        }
    }
}
