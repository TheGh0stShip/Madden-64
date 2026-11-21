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

typedef struct {
    u8 count;
    u8 ids[30];
    u8 slots[30];
} Team;

extern u16 D_800BD8C8[];
extern u16 D_800C5098;
extern s16 D_800C509A;
extern s8 D_800C509C;
extern u8 D_800C509E[];
extern u8 D_800C50BC[];
extern Slot D_800C50DA[22][15];
extern Entry14 D_800C5896[];
extern s8 D_800C5A5E;
extern Table5A60 D_800C5A60;
extern s16 D_800C5C34;
extern s16 D_8006B9E0;
extern u16 D_8006B9E4[];

void func_80024EDC(s32);
void func_80024F5C(void);
void func_80025114(void);
void func_8003E980(void);
void func_8008F090(Team *);
void func_8008F3DC(Team *);

void func_8008D480(s16 arg0) {
    Team team;
    u8 buf[32];
    u16 *src;
    u32 i;
    u32 j;
    u32 week;
    u32 game;

    func_80024F5C();
    src = D_800BD8C8;
    team.count = 30;
    D_800C509A = arg0;
    for (i = 0; i < 30; i++) {
        D_800C50BC[i] = 0;
    }
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
    for (j = 0; j < team.count; j++) {
        D_800C5896[j].unk_0 = 0;
        D_800C5896[j].unk_1 = 0;
        D_800C5896[j].unk_2 = 0;
        D_800C5896[j].unk_6 = 0;
        D_800C5896[j].unk_7 = 0;
        D_800C5896[j].unk_8 = 0;
        D_800C5896[j].unk_3 = 0;
        D_800C5896[j].unk_4 = 0;
        D_800C5896[j].unk_5 = 0;
        D_800C5896[j].unk_A = 0;
        D_800C5896[j].unk_C = 0;
    }
    D_800C509C = 0;
    D_800C5098 = 0xA55A;
    func_8008F090(&team);
    func_8008F3DC(&team);
    for (i = 0; i < team.count; i++) {
        buf[i] = D_800C509E[team.slots[i]];
    }
    for (i = 0; i < team.count; i++) {
        D_800C509E[i] = buf[i];
        D_8006B9E4[i] = buf[i];
    }
    D_8006B9E0 = 30;
    for (i = 0; i < 18; i++) {
        D_800C5A60.unk_00[i] = D_800C5A60.unk_EA[i] = 0xFFFF;
    }
    D_800C5C34 = 0;
    func_8003E980();
    D_800C5A5E = 0;
    func_80024EDC(1);
    func_80025114();
}
