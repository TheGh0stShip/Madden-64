#include "types.h"

typedef struct {
    u8 pad00[0xC];
    u16 home;
    u16 away;
} Game;

typedef struct {
    u8 pad00[0xC];
    s32 handle;
} Node;

typedef struct {
    u8 pad00[4];
    char *line1;
    char *line2;
    char *score;
    char *line3;
} Texts;

typedef struct {
    u8 pad00[0x24];
    Node *node;
    u8 pad28[0x14];
    s32 list;
    u8 pad40[0x20];
    Game *game;
    u8 pad64[0x10];
    Texts texts;
} Item;

typedef struct {
    u8 pad00[0x24];
    u8 hi;
    u8 lo;
} Player;

extern s16 D_80073D68;
extern u16 D_80080CFC[];
extern char D_800C3024[];
extern char D_800C302C[];
extern s16 D_800E7A90;

void func_8001EC20(s32, s32);
void func_8001F2B4(s32, Player *);
s32 func_80022B3C(s32, u16, s32);
char *func_8002E65C(char *, const char *);
Player *func_8003AA28(u16);
void func_800945D8(u16, char *);
s32 func_800AF1D4(s32);
void func_800B4078(Game *);
void func_800D5290(s16, s32);
void func_800DB44C(s32, s32 *, u32 *, s32 *);

/* Fills a game-summary panel: score strings, then the featured player's name and id (or blanks). */
void func_800B5DBC(Item *item) {
    Game *game = item->game;
    s32 list = item->list;
    s32 handle = item->node->handle;
    Texts *texts;
    Player *player;
    s32 a;
    u32 index;
    s32 b;
    s16 id;

    func_800B4078(game);
    texts = &item->texts;
    func_800945D8(game->home, item->texts.score);
    if (game->away >= 0x6EF && D_80073D68 != 0) {
        func_8002E65C(item->texts.line3, D_800C302C);
    } else {
        func_800945D8(game->away, texts->line3);
    }
    func_8001EC20(list, 3);
    func_8001EC20(list, 4);
    func_800DB44C(handle, &a, &index, &b);
    if (index < (u16)func_800AF1D4(0)) {
        player = func_8003AA28(D_80080CFC[index]);
        func_8002E65C(texts->line1, (char *)player);
        func_800945D8(func_80022B3C(0, (u16)index, 0x13), texts->line2);
        func_8001EC20(list, 2);
        func_8001EC20(list, 1);
        id = player->lo | (player->hi << 8);
        D_800E7A90 = id;
        func_800D5290(id, 0);
        func_8001F2B4(0, player);
        return;
    }
    func_8002E65C(texts->line1, D_800C3024);
    func_8002E65C(texts->line2, D_800C3024);
    func_8001EC20(list, 1);
    func_8001EC20(list, 2);
    D_800E7A90 = 0;
    func_800D5290(0, 0);
}
