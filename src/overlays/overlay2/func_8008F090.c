#include "types.h"

typedef struct {
    u8 count;
    u8 ids[30];
    u8 slots[30];
} Team;

extern u8 D_800C509E[];

s16 func_80031A1C(s32);
void func_8008F27C(u8 *home, u8 *away, u8 *ids, u8 count);

void func_8008F090(Team *team) {
    u8 home[3][30];
    u8 away[3][30];
    u16 order[5];
    u8 buf[32];
    u32 i;
    u32 j;
    s16 ok;
    u32 k;
    s16 r;

    func_8008F27C(home[0], away[0], D_800C509E, team->count);
    for (i = 0; i < 5; i++) {
        do {
            r = func_80031A1C(5);
            ok = 1;
            for (j = 0; j < 5; j++) {
                if (j != i && order[j] == (u16)r) {
                    ok = 0;
                    break;
                }
            }
        } while (ok == 0);
        order[i] = r;
    }
    for (k = 0; k < 3; k++) {
        for (j = 0; j < 5; j++) {
            buf[home[k][order[j] + 1]] = D_800C509E[home[k][j + 1]];
            team->slots[home[k][order[j] + 1]] = home[k][j + 1];
        }
    }
    for (k = 0; k < 3; k++) {
        for (j = 0; j < 5; j++) {
            buf[away[k][order[j] + 1]] = D_800C509E[away[k][j + 1]];
            team->slots[away[k][order[j] + 1]] = away[k][j + 1];
        }
    }
    for (j = 0; j < team->count; j++) {
        team->ids[j] = buf[j];
    }
}
