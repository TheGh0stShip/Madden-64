#include "types.h"

typedef struct {
    u8 data[0x28];
} Player;

typedef struct {
    s16 *ids;
    Player *players;
} Roster;

typedef struct {
    u8 pad00[8];
    Roster *roster;
} Screen;

u16 func_8003A1D0(void);
s16 func_8003A21C(u16);
void func_8003AD2C(u16, Player *);

void func_800B446C(Screen *screen) {
    u16 count = func_8003A1D0();
    Roster *roster;
    u16 i;
    s16 id;

    if (count != 0) {
        roster = screen->roster;
        for (i = 0; i < count; i++) {
            id = func_8003A21C(i);
            roster->ids[i] = id;
            func_8003AD2C(id, &roster->players[i]);
        }
    }
}
