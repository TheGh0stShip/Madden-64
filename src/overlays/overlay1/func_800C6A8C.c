#include "types.h"

typedef struct {
    u8 pad0[0x14];
    s32 flags;
    u8 pad18[0x4];
    s32 x;
    s32 y;
    s32 z;
} Body;

typedef struct Player Player;

struct Player {
    u8 pad0[0x8];
    u8 unk_8;
    u8 pad9[0x6];
    u8 unk_F;
    u8 unk_10;
    u8 pad11[0x6];
    u8 unk_17;
    u8 unk_18;
    u8 pad19[0x8];
    u8 unk_21;
    u8 pad22[0x2];
    Body *body;
    u16 unk_28;
    u8 pad2A[0x2];
    union {
        s32 word;
        u8 bytes[4];
    } unk_2C;
    s16 unk_30;
    u8 pad32[0x4];
    s16 unk_36;
    Player *target;
    u8 pad3C[0x28];
    u8 unk_64;
    u8 unk_65;
};

typedef struct {
    u8 pad0[0x1C];
    s32 x;
    s32 y;
    s32 z;
    u8 pad28[0x4];
    s32 vx;
    s32 vy;
    s32 vz;
} Camera;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec2i;

typedef struct {
    s8 type;
    u8 pad1;
    s16 x;
    s16 y;
    u8 pad6[0x6];
    Player *player;
} Tackle;

int abs(int);
void func_80021078(Player *, Player *);
u16 func_80031A1C(u16);
s16 func_80041BDC(s32, s32);
void func_80041E54(s32);
void func_8009CA5C(s32, s32);
void func_8009CFAC(Player *);
void func_800B7DD8(s32, s32, s32, s32, s32);
s16 func_800B9208(Vec2i *);
void func_800C0D00(Player *, s32);
void func_800C12B4(Player *, Player *);
void func_800C1368(void);
s16 func_800C157C(Player *);
void func_800C1838(void);
void func_800C2DA0(void);
void func_800C5F80(void);
void func_800C6330(u16);
void func_800C7368(Player *);
void func_800C747C(Player *);
void func_800C77F0(void);
void object_mode_transition_finalize(Player *);
extern s32 D_80080C10;
extern s16 D_80080C14;
extern s32 D_80084F34;
extern s16 D_80084F6E;
extern s16 D_800857F0;
extern Camera *D_80086178;
extern s16 D_80086E28[3];
extern s16 D_800876F6;
extern s32 D_800878A8[];
extern s16 D_80087A68;
extern Tackle D_80087AB0;
extern s16 D_80087AF0;
extern s16 D_80088AE4;
extern s32 D_800892B8;
extern s16 D_80089320;
extern s16 D_80089340;
extern s32 D_80089380[];
extern s16 D_800894FC;
extern Player *D_8008A058;
extern u16 D_8008A5B2;
extern u16 D_8008A5B4;

void func_800C2368(void) {
    Player *lead;
    Player *opp;
    Player *victim;
    Vec2i delta;
    s16 chance;
    s16 roll;
    s32 rate;
    s16 base;
    s32 dir;
    s16 limit;
    s32 k;
    s32 allow;
    s32 idx;
    u8 type;

    lead = D_8008A058;
    D_800892B8 = D_8008A5B4 + D_800892B8;
    if (D_800894FC == 0) {
        if (lead != 0 && lead->unk_36 == 0 && lead->body->z == 0 && (D_80080C10 & 0x4000) &&
            D_800857F0 == 0 && lead->unk_30 != 0) {
            if (D_800876F6 > 0) {
                func_800C2DA0();
            }
            if (lead->target != 0) {
                func_8009CFAC(lead->target);
                lead->body->flags &= ~0x200;
                func_8009CA5C(0x2D, 0xD2);
                func_800C1838();
            }
        }
    } else if (D_800894FC < 15) {
        if (lead != 0) {
            D_80086178->z = (lead->unk_36 / 2) << 16;
            func_800C6330(0);
            D_80080C14 = 0;
            D_80086178->vx = 0;
            D_80086178->vy = 0;
            D_80086178->vz = 0;
            D_80086E28[0] = 0;
            D_80086E28[1] = 0;
            D_80086E28[2] = 0;
        }
    }
    if (D_800876F6 > 0) {
        D_800876F6 -= D_8008A5B4;
        if (D_800876F6 <= 0) {
            D_800876F6 = 1;
            if (D_800894FC == 0 && D_8008A058->body->z == 0 && D_8008A058->unk_64 != 5) {
                func_800C2DA0();
                D_800876F6 = 0;
            }
        }
    }
    if (D_80080C10 & 0x4000) {
        if ((D_8008A058->unk_28 & 1) && D_80087AF0 >= 0) {
            idx = lead->unk_21 & 0x3F;
            if (D_800878A8[idx] & (~D_80089380[idx] | 0xF00) & 0xEF3F) {
                D_80087AF0 = 60;
            }
        }
        if (D_80087AF0 >= 0) {
            if (D_80087AF0 < 25 && lead->unk_2C.bytes[1] != 4) {
                func_800C0D00(D_8008A058, 4);
            }
            D_80087AF0 -= D_8008A5B4;
            if (D_80087AF0 < 0) {
                D_80087AF0 = 0;
                if (D_8008A058->body->y < -0x3200000) {
                    if (D_80089340 == 4) {
                        D_80087AB0.type = 12;
                    } else {
                        D_80087AB0.type = 11;
                    }
                    D_80087AB0.player = lead;
                    D_80087AB0.x = lead->body->x >> 16;
                    D_80087AB0.y = lead->body->y >> 16;
                    func_800C5F80();
                    func_8009CA5C(11, 0xD2);
                    D_80087AF0 = 1000;
                    lead->unk_28 |= 0x10;
                    func_800C1838();
                }
            } else if (D_8008A058->body->y >= -0x3200000) {
                D_80087AF0 = -1;
            }
        }
    }
    type = lead->unk_64;
    if (type == 0x1A) {
        return;
    }
    if (lead->unk_30 == 0) {
        return;
    }
    if (type == 5 || type == 6) {
        return;
    }
    if (lead->target == 0) {
        return;
    }
    opp = lead->target;
    chance = (lead->body->z <= 0) ? 245 : 160;
    if (opp->unk_36 == 0) {
        if (opp->body->z == 0) {
            chance *= 5;
        } else {
            chance -= chance / 3;
        }
    }
    if (opp->unk_64 == 0x1F) {
        chance /= 3;
    }
    if (lead->unk_64 == 0x32) {
        delta.x = opp->body->x - lead->body->x;
        delta.y = opp->body->y - lead->body->y;
        victim = 0;
        dir = func_800B9208(&delta);
        dir = ((func_800C157C(lead) - dir + 0x100) >> 9) & 7;
        if (lead->unk_65 == 1) {
            dir = abs(2 - dir);
            if (dir == 0) {
                chance *= 3;
                victim = opp;
            } else if (dir == 1) {
                chance *= 2;
            }
        } else if (lead->unk_65 == 2) {
            dir = abs(6 - dir);
            if (dir == 0) {
                chance *= 3;
                victim = opp;
            } else if (dir == 1) {
                chance *= 2;
            }
        }
        if (victim != 0) {
            rate = opp->unk_18 - lead->unk_17 + 400;
            if (rate < 8) {
                rate = 8;
            }
            if (func_80031A1C(rate >> 2) == 0) {
                object_mode_transition_finalize(victim);
                lead->unk_30 /= 2;
            }
        }
    }
    roll = 40 - (lead->unk_17 >> 3) - (lead->unk_8 >> 4) + (opp->unk_18 >> 4) + (opp->unk_8 >> 4);
    if (lead->unk_28 & 1) {
        roll += 2;
    } else {
        roll -= 4;
    }
    if (roll <= 0) {
        roll = 1;
    }
    if (func_80031A1C(chance) > (u16)roll) {
        return;
    }
    if (!(D_80080C10 & 0x4000) || D_800857F0 != 0) {
        return;
    }
    if (D_800876F6 > 0) {
        limit = (lead->unk_F >> 4) + (39 - D_800876F6 - lead->unk_30);
        if (limit < 2) {
            limit = 2;
        }
        if (lead->body->z != 0) {
            limit /= 2;
        }
        if (opp->unk_64 == 0x1F) {
            limit /= 2;
        }
        if (limit < 2) {
            limit = 2;
        }
        if (func_80031A1C(limit) == 0) {
            D_80080C10 |= 0x40000;
            func_80041BDC(0, 30);
            func_800C7368(lead);
            D_800876F6 = 0;
            func_800C6330(D_80084F6E);
            if (D_8008A5B2 == 6) {
                func_800C1368();
                func_800C77F0();
            }
        } else {
            k = D_80086178->y;
            if (k - D_80084F34 > 0xA00000) {
                if (D_80084F6E == 3) {
                    if (k < 0x3200000) {
                        if (func_80041BDC(11, 20) == 0) {
                            func_80041BDC(10, 20);
                        }
                    }
                }
            }
            func_800C2DA0();
        }
    } else {
        allow = 1;
        if (D_80089320 != 0) {
            base = (D_8008A058->unk_10 >> 2) + 120 - D_8008A058->unk_30;
            limit = base;
            if (opp->unk_64 == 0x1F) {
                limit = base - base / 4;
            }
            switch (D_80087A68) {
            case 1:
                limit -= 8;
                break;
            case 3:
                limit -= 5;
                break;
            }
            if (limit < 10) {
                limit = 10;
            }
            if (lead->unk_2C.word == 0x7000D || lead->unk_2C.word == 0x7000E || lead->unk_2C.word == 0x7000F ||
                lead->unk_2C.word == 0x70010) {
                allow = 0;
            }
            if (func_80031A1C(limit) == 0 && allow == 1) {
                lead = D_8008A058;
                func_800C6330(6);
                D_80086178->z = 0x100000;
                func_800C747C(lead);
                func_800C77F0();
                if (func_80041BDC(1, 50) == 0) {
                    func_800B7DD8(2, 16, 0, 0, 0);
                }
                D_80086178->vx *= 2;
                D_80086178->vy *= 2;
                D_80086178->x += D_80086178->vx * 8;
                D_80086178->y += D_80086178->vy * 8;
            }
        }
    }
    if (opp->unk_64 == 0x1F && func_80031A1C(100) < 50) {
        object_mode_transition_finalize(lead);
    } else {
        func_800C12B4(lead, opp);
    }
    func_80021078(lead, opp);
    func_8009CFAC(opp);
    if (D_80088AE4 == 0 && lead->body->y - D_80084F34 < 0) {
        func_80041E54(12);
    }
    if (D_8008A5B2 == 0) {
        if (D_8008A058 != 0) {
            D_8008A058->body->flags &= ~0x200;
            if (D_8008A058->unk_30 >= 61) {
                func_80041BDC(0, 40);
            }
        }
        func_8009CA5C(0x2D, 0xD2);
        func_800C1838();
    }
}
