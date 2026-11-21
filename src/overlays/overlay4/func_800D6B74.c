#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 z;
} Body;

typedef struct {
    u8 pad00[0x24];
    Body *body;
} Player;

typedef struct {
    Player *players[22];
} Team;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 z;
    u8 pad24[8];
    s32 unk_2C;
} Ball;

typedef struct {
    s32 unk_00;
    s32 unk_04;
} LineMark;

extern s8 D_800808C4;
extern u32 D_80080C10;
extern s32 D_80084F30;
extern Team D_80085040[];
extern s8 D_80085A48[];
extern u16 D_80085BFC;
extern Ball *D_80086178;
extern s8 D_800869CC;
extern LineMark D_80087A70;
extern s16 D_800886E0;
extern s16 D_80089320;
extern s8 D_80089550[];
extern Player *D_8008A058;
extern u16 D_8008A5B4;
extern s8 D_8008B310[];
extern s8 D_8008B320[];
extern void func_800DBFA8(Team *teams);
extern void func_800DC604(void);
extern void func_800DC654(void);
extern s16 func_800DC678(s8 index);

void func_800D6B74(void)
{
    Team *team;
    s32 i;
    s32 first;
    s32 last;
    s32 order;
    s32 found;

    if (!(D_80080C10 & 0x4000)) {
        return;
    }
    func_800DC604();
    D_80085BFC -= D_8008A5B4;
    if ((s16)D_80085BFC >= 0) {
        return;
    }
    D_80085BFC = 10;
    team = &D_80085040[D_800886E0];
    if (D_800869CC == 0) {
        func_800DBFA8(D_80085040);
        if (D_8008A058 == 0) {
            first = 0;
            last = 0;
            if (D_80086178->unk_2C >= 0) {
                D_800808C4 = 0;
            } else {
                D_800808C4 = 10;
            }
            func_800DC654();
            for (i = 0; i < 11; i++) {
                if (func_800DC678(D_8008B310[i]) == 2) {
                    first = D_8008B310[i];
                    i = 11;
                }
            }
            for (i = 10; i >= 0; i--) {
                if (func_800DC678(D_8008B310[i]) == 2) {
                    last = D_8008B310[i];
                    i = -1;
                }
            }
            if (D_800808C4 == 0) {
                D_80085A48[first] = 4;
                D_80085A48[last] = 5;
            } else {
                D_80085A48[first] = 5;
                D_80085A48[last] = 4;
            }
            for (i = 0; i < 11; i++) {
                if (func_800DC678(D_80089550[i]) == 1 && D_80085A48[D_80089550[i]] == 0) {
                    D_80085A48[D_80089550[i]] = 6;
                }
            }
        } else if (D_80086178->z < team->players[D_8008B320[2]]->body->z) {
            first = 0;
            last = 0;
            if (D_80084F30 + 0x300000 < D_8008A058->body->x) {
                D_800808C4 = 0;
            } else if (D_8008A058->body->x < D_80084F30 - 0x300000) {
                D_800808C4 = 10;
            }
            func_800DC654();
            for (i = 0; i < 11; i++) {
                if (func_800DC678(D_8008B310[i]) == 2) {
                    first = D_8008B310[i];
                    i = 11;
                }
            }
            for (i = 10; i >= 0; i--) {
                if (func_800DC678(D_8008B310[i]) == 2) {
                    last = D_8008B310[i];
                    i = -1;
                }
            }
            if (D_800808C4 == 0) {
                D_80085A48[first] = 4;
                D_80085A48[last] = 5;
            } else {
                D_80085A48[first] = 5;
                D_80085A48[last] = 4;
            }
            order = 1;
            found = 0;
            for (i = 0; i < 11; i++) {
                if (found < func_800DC678(D_80089550[i]) && D_80085A48[D_80089550[i]] == 0) {
                    D_80085A48[D_80089550[i]] = order;
                    if (func_800DC678(D_80089550[i]) == 1) {
                        found = 1;
                    }
                    order++;
                    if (order >= 4) {
                        i = 11;
                    }
                }
            }
            for (i = 0; i < 11; i++) {
                if (func_800DC678(D_80089550[i]) != 0 && D_80085A48[D_80089550[i]] == 0) {
                    D_80085A48[D_80089550[i]] = 6;
                }
            }
            for (i = 10; i >= 0; i--) {
                if (func_800DC678(D_80089550[i]) == 0) {
                    D_80085A48[D_80089550[i]] = 4;
                }
            }
        } else {
            D_80085BFC = 30;
            for (i = 2; i < 11; i++) {
                D_80085A48[D_8008B320[i]] = 9;
            }
            D_80085A48[D_80089550[0]] = D_80085A48[D_80089550[1]] = 0;
            D_80085A48[D_80089550[2]] = 7;
            D_80085A48[D_8008B320[0]] = D_80085A48[D_8008B320[1]] = 0;
        }
    } else {
        func_800DBFA8(D_80085040);
        func_800DC654();
        if (D_80086178->x >= 0) {
            D_800808C4 = 0;
        } else {
            D_800808C4 = 10;
        }
        if (D_80089320 == -1) {
            if (D_8008A058 == 0) {
                for (i = 0; i < 11; i++) {
                    D_80085A48[i] = 8;
                }
            } else {
                for (i = 0; i < 11; i++) {
                    if (D_8008A058->body->z + 0x1400000 < team->players[D_8008B320[i]]->body->z) {
                        D_80085A48[D_8008B320[i]] = 8;
                    }
                }
            }
        } else if (D_8008A058 == 0) {
            for (i = 0; i < 11; i++) {
                if (D_80087A70.unk_00 != 0x7FFFFFFF &&
                    D_80087A70.unk_04 + 0x1400000 < team->players[D_8008B320[i]]->body->z) {
                    D_80085A48[D_8008B320[i]] = 8;
                }
            }
        } else {
            for (i = 0; i < 11; i++) {
                if (D_8008A058->body->z + 0x1400000 < team->players[D_8008B320[i]]->body->z) {
                    D_80085A48[D_8008B320[i]] = 8;
                }
            }
        }
    }
}
