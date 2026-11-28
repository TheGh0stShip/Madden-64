typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16;
typedef signed int s32; typedef unsigned int u32;

typedef struct Step {
    s8 x;
    s8 y;
} Step;

typedef struct Game {
    Step *steps;
    s32 timer;
    s16 count;
    u16 index;
    u16 rating[2];
    u16 ratingScaled[2];
    u16 speed[2];
    u16 speedScaled[2];
    s32 stat1C[2];
    s32 stat24[2];
    s32 stat2C[2];
    s32 stat34[2];
    s16 unk3C[2];
    s16 unk40[2];
    s16 unk44;
    s16 unk46;
    u16 unk48[2];
    u16 score[2];
    u16 unk50;
    u16 unk52;
    u16 unk54;
    u16 unk56;
    s16 unk58;
    s16 unk5A;
    u8 pad5C[4];
} Game;

typedef struct Team {
    u8 pad00[0x12];
    u8 rating;
    u8 speed;
    u8 pad14[0x71];
    u8 records[0x214C - 0x85];
} Team;

extern s16 D_8006B9E4[];
extern Team D_80080CE5[];
extern s8 D_800C509C;

void func_8003E510(s16, s16, s32, s32);
void func_800374B0(void);
void func_8002619C(void);
void func_80021EE0(u16);
u16 func_8003B3A0(void *);
u16 func_8003B02C(void *);
void func_800C79F4(Game *);
void func_800C7A0C(Game *);
void func_800C7CC0(Game *);
s16 func_800C7F28(Game *);
void overlay5_object_flags_toggle(Game *);
u16 func_80031A1C(u16);
u16 func_80022538(s32, s32, s32, s32);
void func_80025A4C(s32, u16, s32, s32);
u16 func_80022188(u16, s32, u16);
void func_8003EC7C(s16, u16);
void func_800259E4(u16, s32, s16);
void func_8002514C(void);
void func_8003EBC8(void);

/*
 * func_800C7FF8: simulate a game between teams[0] and teams[1] without playing it.  Each side's
 * offence/defence ratings are derived from the team record bytes and roster
 * (func_8003B3A0/func_8003B02C), the drive simulation (func_800C79F4 .. func_800C7F28) runs
 * four quarters, a tie gets a field goal for the home side, and the per-side statistics are
 * then posted through func_800259E4.
 */
void func_800C7FF8(u8 *teams, Step *steps) {
    Game game;
    s16 i;
    s16 j;
    u16 kicker;
    s16 value;

    func_8003E510(D_8006B9E4[teams[0]], D_8006B9E4[teams[1]], 0, 0);
    func_800374B0();
    func_8002619C();
    game.steps = steps;
    for (i = 0; i < 2; i++) {
        func_80021EE0(i);
        game.rating[i] = (D_80080CE5[i].rating * 100 / 253 + func_8003B3A0(D_80080CE5[i].records) * 2) / 3;
        game.ratingScaled[i] = game.rating[i] * 253 / 100;
        game.speed[i] = (D_80080CE5[i].speed * 100 / 253 + func_8003B02C(D_80080CE5[i].records) * 2) / 3;
        game.speedScaled[i] = game.speed[i] * 253 / 100;
        game.unk48[i] = 0;
        game.score[i] = 0;
        game.stat2C[i] = 0;
        game.stat24[i] = 0;
        game.stat34[i] = 0;
        game.stat1C[i] = 0;
        game.unk3C[i] = 0;
        game.unk40[i] = 0;
        game.unk5A = 0;
    }
    game.unk52 = 1;
    game.unk50 = 0;
    game.count = 0;
    game.timer = 0x348;
    game.index = 0;
    do {
        func_800C79F4(&game);
        while (game.unk54 < 5) {
            func_800C7A0C(&game);
            func_800C7CC0(&game);
            if (func_800C7F28(&game) != 0) {
                break;
            }
        }
        overlay5_object_flags_toggle(&game);
    } while (game.count < 4);
    if (game.score[0] == game.score[1]) {
        func_80031A1C(100);
        kicker = func_80022538(0, 1, 0x15, 0);
        func_80025A4C(0, kicker, 0x17, 1);
        func_80025A4C(0, kicker, 0x18, 1);
        game.steps[3].x += 3;
    }
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 11; j++) {
            func_8003EC7C(i, func_80022188(i, 0, j));
            func_8003EC7C(i, func_80022188(i, 3, j));
        }
    }
    value = func_80031A1C(6) + 2;
    func_800259E4(0, 8, value);
    func_800259E4(0, 9, (func_80031A1C(value / 2) + value) * 5);
    value = func_80031A1C(6) + 2;
    func_800259E4(1, 8, value);
    func_800259E4(1, 9, (func_80031A1C(value / 2) + value) * 5);
    func_800259E4(0, 0xB, game.stat1C[0]);
    func_800259E4(1, 0xB, game.stat1C[1]);
    func_800259E4(0, 1, game.stat24[0]);
    func_800259E4(1, 1, game.stat24[1]);
    func_800259E4(0, 2, game.stat2C[0]);
    func_800259E4(1, 2, game.stat2C[1]);
    func_800259E4(0, 0, game.stat24[0] + game.stat2C[0]);
    func_800259E4(1, 0, game.stat24[1] + game.stat2C[1]);
    func_800259E4(0, 0xA, game.stat24[0] + game.stat2C[0] + game.stat34[1]);
    func_800259E4(1, 0xA, game.stat24[1] + game.stat2C[1] + game.stat34[1]);
    if (D_800C509C < 17) {
        func_8002514C();
    }
    func_8003EBC8();
}
