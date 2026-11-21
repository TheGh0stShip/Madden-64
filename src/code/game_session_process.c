#include "types.h"

typedef struct SessionTeam {
    u8 grid[40][11];
    u8 pad[0x214C - 40 * 11];
} SessionTeam;

extern SessionTeam D_800816A7[];
extern u16 gameplay_roster_update(u16 team, u16 row, u16 column);
extern void func_8002212C(u16 team, u16 value, u16 row, u16 column);

void game_session_process(u16 team)
{
    u16 row;
    u16 column;

    for (row = 0; row < 40; row++) {
        for (column = 0; column < 11; column++) {
            D_800816A7[team].grid[row][column] = 0xFF;
        }
        if (row == 5) {
            func_8002212C(team, gameplay_roster_update(team, 5, 5), 5, 5);
        }
        for (column = 0; column < 11; column++) {
            if (D_800816A7[team].grid[row][column] == 0xFF) {
                func_8002212C(team, gameplay_roster_update(team, row, column), row, column);
            }
        }
    }
}
