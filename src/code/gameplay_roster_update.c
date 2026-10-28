#include "types.h"

typedef struct {
    u8 unk00[0xE];
    u8 position;  /* low 6 bits: position id; 0x80/0x40: special-team flags */
    u8 ratings[0x28 - 0xF];
} RosterPlayer;

typedef struct {
    u8 injury;
    u8 unk01[2];
} RosterStatus;

typedef struct {
    u16 slot[55];
    RosterPlayer players[55];
    RosterStatus status[55];
    u8 unk9AB[0x214C - 0x9AB];
} RosterTeam;

extern RosterTeam D_80080CFC[];

typedef struct {
    RosterStatus entry[55];
    u8 unkA5[0x214C - 0xA5];
} RosterStatusBlock;

/* The status entries of D_80080CFC[team], addressed through their own symbol. */
extern RosterStatusBlock D_80081602[];
extern u8 D_80074808;
extern u8 *D_8006AA58[];
extern u8 D_8006AABC[];

s16 func_8002209C(u16 team, u16 index, u16 arg2);
s32 func_8003C6B4(u16, u16);
s32 func_8003C708(u16, u16);
s16 func_8003FC94(s16 team, s16 index);

s32 gameplay_roster_update(s16 team, u16 arg1, u16 arg2) {
    u16 pos;
    u16 depth;
    u16 count;
    u16 i;
    u8 *alt;  /* alternate-position list in pass 2, then the ratings of players[i] */
    u16 rating;
    RosterPlayer *players;
    u8 best_value;
    u16 best;
    count = 0;
    pos = (u8)func_8003C6B4(arg1, arg2);
    depth = (u8)func_8003C708(arg1, arg2);
    players = D_80080CFC[(u16)team].players;

    for (i = 0; i < 55; i++) {
        if (D_80080CFC[(u16)team].slot[i] != 0xFFFF) {
            switch (pos) {
            case 23:
                if (players[i].position & 0x80) {
                    count++;
                    if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i) &&
                        (D_80074808 == 0 || D_80081602[(u16)team].entry[i].injury < 25)) {
                        return i;
                    }
                }
                break;
            case 24:
                if (players[i].position & 0x40) {
                    count++;
                    if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i) &&
                        (D_80074808 == 0 || D_80081602[(u16)team].entry[i].injury < 25)) {
                        return i;
                    }
                }
                break;
            default:
                if (pos == (players[i].position & 0x3F)) {
                    count++;
                    if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i) &&
                        (D_80074808 == 0 || D_80081602[(u16)team].entry[i].injury < 25)) {
                        return i;
                    }
                }
                break;
            }
        }
    }

    alt = D_8006AA58[pos];
    if ((u16)(pos - 23) < 2) {
        depth = 4;
    }
    for (; *alt != 0xFF; alt++) {
        for (i = 0; i < 55; i++) {
            if (D_80080CFC[(u16)team].slot[i] != 0xFFFF) {
                switch (*alt) {
                case 23:
                    if (players[i].position & 0x80) {
                        count++;
                        if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i) &&
                            (D_80074808 == 0 || D_80081602[(u16)team].entry[i].injury < 25)) {
                            return i;
                        }
                    }
                    break;
                case 24:
                    if (players[i].position & 0x40) {
                        count++;
                        if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i) &&
                            (D_80074808 == 0 || D_80081602[(u16)team].entry[i].injury < 25)) {
                            return i;
                        }
                    }
                    break;
                default:
                    if (*alt == (players[i].position & 0x3F)) {
                        count++;
                        if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i) &&
                            (D_80074808 == 0 || D_80081602[(u16)team].entry[i].injury < 25)) {
                            return i;
                        }
                    }
                    break;
                }
            }
        }
    }

    best = 0xFFFF;
    rating = D_8006AABC[pos];
    best_value = 0;
    for (i = 0; i < 55; i++) {
        if (D_80080CFC[(u16)team].slot[i] != 0xFFFF) {
            alt = players[i].ratings;
            if (func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i) &&
                (D_80074808 == 0 || D_80081602[(u16)team].entry[i].injury < 25)) {
                if (best_value < alt[rating]) {
                    best_value = alt[rating];
                    best = i;
                }
            }
        }
    }
    if (best != 0xFFFF) {
        return best;
    }

    for (i = 0; i < 55; i++) {
        if (D_80080CFC[(u16)team].slot[i] != 0xFFFF) {
            switch (pos) {
            case 23:
                if (players[i].position & 0x80) {
                    count++;
                    if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i)) {
                        return i;
                    }
                }
                break;
            case 24:
                if (players[i].position & 0x40) {
                    count++;
                    if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i)) {
                        return i;
                    }
                }
                break;
            default:
                if (pos == (players[i].position & 0x3F)) {
                    count++;
                    if (count > depth && func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i)) {
                        return i;
                    }
                }
                break;
            }
        }
    }

    rating = D_8006AABC[pos];
    best = 0xFFFF;
    best_value = 0;
    for (i = 0; i < 55; i++) {
        if (D_80080CFC[(u16)team].slot[i] != 0xFFFF) {
            alt = players[i].ratings;
            if (func_8002209C(team, i, arg1) == -1 && func_8003FC94(team, i)) {
                if (best_value < alt[rating]) {
                    best_value = alt[rating];
                    best = i;
                }
            }
        }
    }
    return best;
}
