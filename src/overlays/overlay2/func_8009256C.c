#include "types.h"

typedef struct {
    u16 words[0xB9E / 2];
} SeasonSave;

typedef struct {
    u8 home;
    u8 away;
    u8 home_score;
    u8 away_score;
    u8 flags;
} Game;

typedef struct {
    u8 pad[4];
    u8 unk4;
} Hdr;

extern SeasonSave D_800C5098;
extern SeasonSave D_800C3D00;
extern Hdr *D_8008934C;
extern s8 D_800C509C;
extern s8 D_800C509D;
extern u8 D_800C509E[];
extern s16 D_800892B4[2];
extern u8 D_80082DDC[];
extern s16 D_80087A68;
extern s16 D_80087A92;
extern s16 D_8008A5B0;
extern u8 D_80082E3E;
extern u8 D_80082E40;
extern u8 D_80082E41;
extern u8 D_80082E42;
extern u8 D_800BF2EC[];

s16 func_8008E074(Game *, s16);
void func_8008E444(void);
void func_8008E6EC(void);
void func_800DD514(void *);
void func_8003A7DC(u16, u8 *);
u16 func_80031A1C(u16);
void func_800A3E7C(void);

/* Starts the scheduled game for a week: snapshots the season save, sets the two
 * teams, then picks the weather/condition from the game flags and random rolls.
 * Its switch jump table lives in resident low_rodata (D_80001998). */
void func_8009256C(s16 week) {
    Game game;
    s16 found;
    s8 *mode;

    found = func_8008E074(&game, week);
    D_800C3D00 = D_800C5098;
    if (found == 0) {
        func_8008E444();
        func_8008E6EC();
        if (D_800C509C != 20) {
            func_800DD514(D_800BF2EC);
        }
        return;
    }
    D_8008934C->unk4 &= 0xF0;
    D_8008934C->unk4 |= 1;
    D_800892B4[0] = D_800C509E[game.away];
    D_800892B4[1] = D_800C509E[game.home];
    if (D_800C509C == 21) {
        D_800892B4[0] = 0x74;
        D_800892B4[1] = 0x75;
    }
    func_8003A7DC(D_800892B4[1], D_80082DDC);
    D_80087A68 = 0;
    switch (game.flags >> 4) {
    case 3:
    case 4:
    case 7:
    case 13:
    case 14:
        D_80087A68 = 4;
        break;
    default:
        mode = &D_800C509C;
        if (*mode >= 3) {
            if (func_80031A1C(255) < D_80082E41) {
                D_80087A68 = 1;
            }
            if (*mode >= 6) {
                if (func_80031A1C(255) < D_80082E42) {
                    D_80087A68 = 3;
                }
            }
        }
        if (D_80087A68 == 0) {
            if (func_80031A1C(255) < D_80082E40) {
                D_80087A68 = 2;
            }
        }
        break;
    }
    D_8008A5B0 = 1;
    D_80087A92 = D_80082E3E;
    if (D_800C509C == 20) {
        if (D_800C509D != 0) {
            D_80087A92 = 0x21;
        } else {
            D_80087A92 = 0x25;
        }
        D_80087A68 = 0;
    }
    if (D_800C509C == 21) {
        D_80087A92 = 0x1E;
        D_80087A68 = 0;
    }
    func_800A3E7C();
}
