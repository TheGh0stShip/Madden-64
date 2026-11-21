#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 home_score;
    u8 away_score;
    u8 played;
    s8 state;
} Slot;

typedef struct {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
    u8 unk_8;
    u16 unk_A;
    u16 unk_C;
} Entry14;

typedef struct {
    u16 unk_00[18];
    u16 unk_24[18][5];
    u8 unk_D8[18];
    u16 unk_EA[18];
} Table5A60;

extern u16 D_800BD8C8[];
extern u16 D_800C5098;
extern s16 D_800C509A;
extern s8 D_800C509C;
extern s8 D_800C509D;
extern u8 D_800C509E[];
extern Slot D_800C50DA[22][15];
extern Entry14 D_800C5896[];
extern s8 D_800C5A5E;
extern Table5A60 D_800C5A60;
extern s16 D_800C5C34;
extern s16 D_8006B9E0;
extern u16 D_8006B9E4[];
extern s16 D_80073446;

void func_80024694(void);
void func_80024E9C(void);
void func_80024EDC(s32);
void func_80025114(void);
void func_80039850(s32, s32);
void func_8003A600(s32, s32);
void func_8003E980(void);
void func_8003EB2C(void);

void func_8008D1B0(s16 arg0) {
    u16 *src;
    s16 week;
    s16 game;
    s16 i;

    src = D_800BD8C8;
    D_800C509A = arg0;
    D_800C509D = 1;
    for (week = 0; week < 22; week++) {
        for (game = 0; game < 15; game++) {
            D_800C50DA[week][game].away = *src++;
            D_800C50DA[week][game].home = *src++;
            D_800C50DA[week][game].home_score = 0;
            D_800C50DA[week][game].away_score = 0;
            D_800C50DA[week][game].played = *src++ << 4;
            D_800C50DA[week][game].state = 0;
        }
    }
    for (i = 0; i < 30; i++) {
        D_800C5896[i].unk_0 = 0;
        D_800C5896[i].unk_1 = 0;
        D_800C5896[i].unk_2 = 0;
        D_800C5896[i].unk_6 = 0;
        D_800C5896[i].unk_7 = 0;
        D_800C5896[i].unk_8 = 0;
        D_800C5896[i].unk_3 = 0;
        D_800C5896[i].unk_4 = 0;
        D_800C5896[i].unk_5 = 0;
        D_800C5896[i].unk_A = 0;
        D_800C5896[i].unk_C = 0;
    }
    D_800C509C = 0;
    D_800C5098 = 0xA55A;
    for (i = 0; i < 30; i++) {
        D_8006B9E4[i] = D_800C509E[i];
    }
    D_8006B9E0 = 30;
    for (i = 0; i < 18; i++) {
        D_800C5A60.unk_00[i] = D_800C5A60.unk_EA[i] = 0xFFFF;
    }
    D_800C5C34 = 0;
    if (D_80073446 == 0) {
        func_80024694();
        func_80039850(1, 1);
        func_80024E9C();
    }
    func_8003A600(1, 1);
    func_8003EB2C();
    func_8003E980();
    D_800C5A5E = 0;
    func_80024EDC(1);
    func_80025114();
}
