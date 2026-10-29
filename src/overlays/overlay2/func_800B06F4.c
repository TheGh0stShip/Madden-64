#include "types.h"

typedef struct {
    u16 slot[55];
    u8 players[1];
} Team;

typedef struct {
    u8 pad00[0x60];
    s16 *count;
} Screen;

extern Team D_80080CFC;

s16 *func_80032E00(s32, s32);
u16 func_8003A584(u16);
void func_8003AE80(Team *, u8 *);

void func_800B06F4(Screen *screen) {
    s16 *count;
    u16 id;
    u16 n;
    u16 i;

    count = func_80032E00(0, 2);
    id = 0;
    n = 0;
    *count = 0;
    screen->count = count;
    while ((id = func_8003A584(id)) != 0) {
        D_80080CFC.slot[n] = id;
        n++;
    }
    *count = n;
    for (i = n; i < 55; i++) {
        D_80080CFC.slot[i] = 0xFFFF;
    }
    func_8003AE80(&D_80080CFC, D_80080CFC.players);
}
