#include "types.h"

typedef struct RosterTeam {
    u16 slot[55];
    u8 pad6E[0xB7A - 0x6E];
    s16 stats[55][47];
    u8 pad1FAC[0x214C - 0x1FAC];
} RosterTeam;

typedef struct LeagueTeam {
    u8 id;
    u8 pad01[0x214C - 1];
} LeagueTeam;

typedef struct Entry {
    u8 pad00[12];
} Entry;

typedef struct Config {
    u8 pad00[10];
} Config;

typedef struct Leader {
    u16 player[17];
    u16 value;
    Config config[18];
    u8 team[18];
} Leader;

typedef struct Game {
    s8 week;
    u8 pad001[0x9C4 - 1];
    Leader leader[2];
} Game;

extern u16 D_8006B9D8;
extern Entry *D_8006B9DC;
extern LeagueTeam D_80080C90[];
extern RosterTeam D_80080CFC[];
extern u16 D_800855D4;
extern Game D_800C509C;

void gameplay_state_update(void);
u16 func_8002C304(u16 owner);
void top_bits_dispatch(Entry *entry, s16 *stats);
void team_secondary_stats_accumulate(s32 team);
s32 frame_identifier_find(u32 identifier);
void frame_resource_update(s32 id, s32 slot, s32 kind, s32 a, s32 b, s32 c);
u32 league_best_player_find(void);
s32 func_8002AA8C(void);
u8 func_80024B90(u16 id);
u8 func_80024BD4(u16 id);
u32 gameplay_selection_update(s32 team, u8 index);
void gameplay_interface_configure(s32 team, s16 index, Config *config);
void func_80024E9C(void);

void gameplay_state_render(void)
{
    s16 i;
    s16 j;
    u16 id;
    s32 first;
    s32 second;
    s32 firstTeam;
    s32 secondTeam;
    u32 firstValue;
    u32 secondValue;
    s32 week;
    s32 firstFlag;
    s32 secondFlag;

    for (i = 0; i < 55; i++) {
        for (j = 0; j < 47; j++) {
            switch (j) {
                case 5:
                case 10:
                case 14:
                    break;
                default:
                    if (D_80080CFC[0].stats[i][j] < 0) {
                        D_80080CFC[0].stats[i][j] = 0;
                    }
                    if (D_80080CFC[1].stats[i][j] < 0) {
                        D_80080CFC[1].stats[i][j] = 0;
                    }
                    break;
            }
        }
    }
    gameplay_state_update();
    for (i = 0; i < 55; i++) {
        if (D_80080CFC[0].slot[i] != 0xFFFF) {
            top_bits_dispatch(&D_8006B9DC[func_8002C304(D_80080CFC[0].slot[i])], D_80080CFC[0].stats[i]);
        }
    }
    for (i = 0; i < 55; i++) {
        if (D_80080CFC[1].slot[i] != 0xFFFF) {
            top_bits_dispatch(&D_8006B9DC[func_8002C304(D_80080CFC[1].slot[i])], D_80080CFC[1].stats[i]);
        }
    }
    team_secondary_stats_accumulate(0);
    team_secondary_stats_accumulate(1);
    for (j = 0; j < 2; j++) {
        id = frame_identifier_find(D_80080C90[j].id);
        for (i = 0; i < 55; i++) {
            if (D_80080CFC[j].slot[i] != 0xFFFF) {
                frame_resource_update(id, D_80080CFC[j].slot[i], 0x21, D_80080CFC[j].stats[i][33],
                                      D_80080CFC[j].stats[i][34], D_80080CFC[j].stats[i][35]);
                frame_resource_update(id, D_80080CFC[j].slot[i], 0x24, D_80080CFC[j].stats[i][36],
                                      D_80080CFC[j].stats[i][37], D_80080CFC[j].stats[i][38]);
            }
        }
    }
    if (D_8006B9D8 == 1) {
        D_8006B9D8 = 0;
        secondFlag = 0;
        firstFlag = 0;
        first = league_best_player_find();
        second = func_8002AA8C();
        firstTeam = func_80024B90(first) != D_80080C90[0].id;
        firstValue = gameplay_selection_update(firstTeam, func_80024BD4(first));
        secondTeam = func_80024B90(second) != D_80080C90[0].id;
        secondValue = gameplay_selection_update(secondTeam, func_80024BD4(second));
        week = D_800C509C.week;
        if (D_800C509C.leader[0].player[week] == 0xFFFF) {
            firstFlag = 1;
            secondFlag = 1;
        } else {
            if (D_800C509C.leader[0].value < firstValue) {
                firstFlag = 1;
            }
            if (D_800C509C.leader[1].value < secondValue) {
                secondFlag = 1;
            }
        }
        if (firstFlag == 1) {
            D_800C509C.leader[0].player[week] = first;
            D_800C509C.leader[0].team[week] = D_80080C90[firstTeam].id;
            D_800C509C.leader[0].value = firstValue;
            for (i = 0; i < 55; i++) {
                if (D_80080CFC[firstTeam].slot[i] == first) {
                    break;
                }
            }
            gameplay_interface_configure(firstTeam, i, &D_800C509C.leader[0].config[week]);
        }
        if (secondFlag == 1) {
            D_800C509C.leader[1].player[week] = second;
            D_800C509C.leader[1].team[week] = D_80080C90[secondTeam].id;
            D_800C509C.leader[1].value = secondValue;
            for (i = 0; i < 55; i++) {
                if (D_80080CFC[secondTeam].slot[i] == second) {
                    break;
                }
            }
            gameplay_interface_configure(secondTeam, i, &D_800C509C.leader[1].config[week]);
        }
        D_8006B9D8 = 1;
    }
    func_80024E9C();
    D_800855D4 = 1;
}
