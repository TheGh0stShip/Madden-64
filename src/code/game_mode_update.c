#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Body;

typedef struct {
    u8 pad00[0x1E];
    u8 team;
    u8 pad1F[5];
    Body *body;
} Player;

typedef struct {
    Player *players[22];
} Team;

typedef struct {
    s32 x;
    s32 y;
} Point;

extern s16 D_80089320;
extern s32 D_80084F34;
extern Player *D_80085040[][22];
extern s16 D_80085112[];
extern Point D_80087A70;
extern Body *D_80086178;

s32 func_8001FA38(s32);
u16 func_80031A1C(u16);
void func_800C9090(Player *);
void menu_player_update(s32, Player *, s32, s32);

int abs(int);

void game_mode_update(Player *player) {
    Body *body;
    s32 sum;
    s16 i;
    s32 dx;
    s32 dy;

    if (D_80089320 != 0 && func_80031A1C(func_8001FA38(9) + 5) != 0) {
        dx = abs(player->body->x);
        if (dx <= 0x500000 && player->body->y < D_80084F34) {
            func_800C9090(player);
            sum = 0;
            for (i = 0; i < 8; i++) {
                sum += D_80085112[i];
            }
            if (sum < -8) {
                for (i = 1; i < 6; i++) {
                    body = D_80085040[player->team][i]->body;
                    dx = D_80087A70.x - body->x;
                    if (dx < 0) {
                        dx = -dx;
                    }
                    dy = D_80087A70.y - body->y;
                    if (dy < 0) {
                        dy = -dy;
                    }
                    if (dx < dy) {
                        dx = dy + dx / 2;
                    } else {
                        dx += dy / 2;
                    }
                    if (dx <= 0x600000) {
                        break;
                    }
                }
                if (i == 6) {
                    menu_player_update(9, player, player->body->y, D_80086178->y);
                }
            }
        }
    }
}
