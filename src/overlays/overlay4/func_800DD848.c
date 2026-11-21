#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Pos;

typedef struct {
    u8 pad00[0x24];
    Pos *pos;
} Player;

typedef struct {
    Player *players[22];
} Lineup;

extern Lineup D_80085040[];
extern Pos *D_80086178;
extern s16 D_800886E0;
extern s8 D_80089550[];
extern s8 D_8008B310[];
extern s8 D_8008B320[];

void func_800DD848(void) {
    s32 dist[11];
    s32 i;
    s16 swapped;
    s32 tmp;
    s32 dx;
    s32 dy;
    s32 ady;
    Player **players;

    swapped = 1;
    for (i = 0; i < 11; i++) {
        D_8008B310[i] = D_8008B320[i] = i;
    }
    players = D_80085040[D_800886E0].players;
    while (swapped == 1) {
        swapped = 0;
        for (i = 0; i < 10; i++) {
            if (players[D_8008B310[i]]->pos->x < players[D_8008B310[i + 1]]->pos->x) {
                swapped = 1;
                tmp = D_8008B310[i];
                D_8008B310[i] = D_8008B310[i + 1];
                D_8008B310[i + 1] = tmp;
            }
        }
    }
    swapped = 1;
    while (swapped == 1) {
        swapped = 0;
        for (i = 0; i < 10; i++) {
            if (players[D_8008B320[i]]->pos->y < players[D_8008B320[i + 1]]->pos->y) {
                swapped = 1;
                tmp = D_8008B320[i];
                D_8008B320[i] = D_8008B320[i + 1];
                D_8008B320[i + 1] = tmp;
            }
        }
    }
    for (i = 0; i < 11; i++) {
        dx = D_80086178->x - players[i]->pos->x;
        dy = D_80086178->y - players[i]->pos->y;
        if (dx < 0) {
            dx = -dx;
        }
        ady = dy;
        if (ady < 0) {
            ady = -ady;
        }
        if (dx < ady) {
            dist[i] = ady + dx / 2;
        } else {
            dist[i] = dx + ady / 2;
        }
        D_80089550[i] = i;
    }
    swapped = 1;
    while (swapped == 1) {
        swapped = 0;
        for (i = 0; i < 10; i++) {
            if (dist[i] > dist[i + 1]) {
                tmp = D_80089550[i];
                D_80089550[i] = D_80089550[i + 1];
                D_80089550[i + 1] = tmp;
                tmp = dist[i];
                swapped = 1;
                dist[i] = dist[i + 1];
                dist[i + 1] = tmp;
            }
        }
    }
}
