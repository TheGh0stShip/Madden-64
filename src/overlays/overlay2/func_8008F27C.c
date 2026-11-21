#include "types.h"

typedef struct {
    u8 pad00[0x60];
    u8 side;
    u8 unit;
} Player;

u16 func_80028A58(u8);
Player *func_8003A7B8(u16);

void func_8008F27C(u8 *home, u8 *away, u8 *ids, u8 count) {
    u8 *list;
    Player *player;
    u32 i;

    home[0] = 0;
    home[count] = 0;
    home[count * 2] = 0;
    away[0] = 0;
    away[count] = 0;
    away[count * 2] = 0;
    for (i = 0; i < count; i++) {
        player = func_8003A7B8(func_80028A58(ids[i]));
        if (player->side == 0) {
            list = home;
        } else if (player->side == 1) {
            list = away;
        }
        switch (player->unit) {
        case 2:
            list[++list[0]] = i;
            break;
        case 1:
            list[count + ++list[count]] = i;
            break;
        case 0:
            list[count * 2 + ++list[count * 2]] = i;
            break;
        }
    }
}
