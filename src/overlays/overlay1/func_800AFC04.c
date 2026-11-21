#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 homeScore;
    u8 awayScore;
    u8 flags;
    s8 done;
} SeasonGame;

typedef struct {
    u8 unk_00[4];
    s8 week;
    u8 unk_05[0x3D];
    SeasonGame games[1][15];
} Season;

typedef struct {
    s32 i;
    void *items[5];
} SeasonList;

typedef struct {
    u8 unk_00[0x28];
} SeasonLabel;

typedef struct {
    u8 name[6];
} SeasonTeam;

extern char D_80000F10[];
typedef struct {
    s32 unk_00;
    s32 unk_04;
} SeasonState;

extern SeasonState D_8006B968;
extern SeasonList D_8006B98C;
extern s16 D_8006B9BE;
extern s32 D_80080C10;
extern s16 D_800857C0;
extern s16 D_800857C4;
extern s16 D_800857C6;
extern s16 D_800857C8;
extern s16 D_800857CA;
extern u8 D_800857CC;
extern SeasonLabel D_80085A58[3];
extern s16 D_80086C6C;
extern s16 D_800876DC;
extern s16 D_80087748;
extern s16 D_80087758;
extern s32 D_8008798C;
extern s16 D_80087AAC;
extern u16 D_80088AE4;
extern s16 D_80089320;
extern SeasonTeam D_800893C0[];
extern s16 D_800894FA;
extern s16 D_8008A5B0;
void func_800167FC(s16, SeasonLabel *);
void func_8001AEA8(SeasonState *);
s16 func_800280FC(u16, u16);
s32 func_80031964(void);
Season *func_80037108(char *, s32);
s16 func_800AACE8(s32, SeasonList *, s32);
void func_800ABBE0(void);
s16 func_800AD78C(u16, u16, u16);
s16 func_800ADA5C(u16, u16, u16);
s16 func_800AEFF8(s32, s16, SeasonList *, s32);
void func_800AF104(void);
void func_800B7DD8(s32, s32, u8, s16, s16);

void func_800AFC04(void) {
    char labels[36] = "????1ST 1ST 2ND 3RD 4TH OT  F   F   ";
    Season *season;
    s16 *mode;
    SeasonGame *games;
    SeasonGame *game;
    s32 sum;
    u16 i;
    u16 j;
    s32 diff;

    if (D_80089320 == -1) {
        return;
    }
    if (!(D_80080C10 & 0x100) && D_80087758 >= 11) {
        mode = &D_800857C0;
        if (*mode == 4) {
            if (D_8008A5B0 != 1) {
                *mode = 0;
            } else {
                season = func_80037108(D_80000F10, 1);
                if (season->week == 0 || season->week == 0x15) {
                    *mode = 0;
                }
            }
        }
        if (D_800857C0 == 1) {
            if (D_800857C8 == 3) {
                if ((func_80031964() & 0xC00) == 0xC00) {
                    sum = 0;
                    for (i = 0; i < 6; i++) {
                        sum += func_800280FC(D_80088AE4, i);
                    }
                    if (sum >= 5) {
                        D_800857C0 = 2;
                    }
                }
            }
            goto state;
        }
        if (D_800894FA == 2 && D_800876DC != D_80087748) {
            D_800894FA = 0;
        }
        if (D_800894FA == 0 && D_8008A5B0 == 1) {
            if ((D_800876DC == 2 || D_800876DC == 4) && D_80087AAC < 0x79) {
                D_800894FA = 1;
                D_80087748 = D_800876DC;
                D_80086C6C = 1;
            }
            if (D_800876DC == 3 && D_80087AAC < 0x79) {
                D_800894FA = 1;
                D_80087748 = D_800876DC;
                D_80086C6C = 1;
            }
        }
        if (D_800894FA != 1) {
            goto state;
        }
        if (D_800876DC != D_80087748) {
            D_800894FA = 2;
            goto done;
        }
        season = func_80037108(D_80000F10, 1);
        games = season->games[season->week];
        for (j = 0, i = 0; j < 15; j++) {
            game = &games[j];
            if (game->home != 0xFF && (game->flags & 0xF) && game->done == 0) {
                if (D_800876DC == 3) {
                    if (game->homeScore > game->awayScore) {
                        diff = game->homeScore - game->awayScore;
                    } else {
                        diff = game->awayScore - game->homeScore;
                    }
                    if (diff >= 4) {
                        goto check;
                    }
                }
                i++;
            check:
                if (i == D_80086C6C) {
                    goto found;
                }
            }
        }
        i = 0xFFFF;
    found:
        if (i != 0xFFFF) {
            D_8006B98C.i = 6;
            D_8006B98C.items[0] = &D_800893C0[game->away];
            D_8006B98C.items[1] = &D_800893C0[game->home];
            func_800167FC(game->awayScore, &D_80085A58[0]);
            func_800167FC(game->homeScore, &D_80085A58[1]);
            D_8006B98C.items[2] = &D_80085A58[0];
            D_8006B98C.items[3] = &D_80085A58[1];
            D_80085A58[2].unk_00[0] = labels[(game->flags & 0xF) * 4 + 0];
            D_80085A58[2].unk_00[1] = labels[(game->flags & 0xF) * 4 + 1];
            D_80085A58[2].unk_00[2] = labels[(game->flags & 0xF) * 4 + 2];
            D_80085A58[2].unk_00[3] = 0;
            D_8006B98C.items[4] = &D_80085A58[2];
            D_8006B968.unk_04 = D_8008798C;
            func_8001AEA8(&D_8006B968);
            D_8006B9BE = func_800AACE8(0x30, &D_8006B98C, 3);
            D_800857C0 = 3;
            D_800857CA = 0xB4;
            D_80086C6C++;
            goto done;
        }
        D_800894FA = 2;
        D_80087748 = D_800876DC;
    } else {
        D_800857C0 = 0;
    }
state:
    if (D_800857C0 != 0) {
        switch (D_800857C0) {
        case 1:
            D_8006B9BE = func_800AD78C(D_800857C8, D_800857C4, D_800857C6);
            break;
        case 4:
            D_8006B9BE = func_800ADA5C(D_800857C8, D_800857C4, D_800857C6);
            break;
        case 2:
            D_8006B98C.i = 6;
            for (i = 0; i < 6; i++) {
                D_8006B98C.items[i] = &D_80085A58[i];
                func_800167FC(func_800280FC(D_80088AE4, i), &D_80085A58[i]);
            }
            D_8006B9BE = func_800AEFF8(0x90, D_80088AE4, &D_8006B98C, 0);
            break;
        }
        D_800857CA = 0xB4;
        if (D_800857CC != 0) {
            func_800B7DD8(2, 0x17, D_800857CC, D_800857C4, D_800857C6);
        }
    } else {
        func_800AF104();
    }
done:
    func_800ABBE0();
}
