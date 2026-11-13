#include "types.h"

typedef struct {
    u8 pad00[0xC];
    u16 home;
    u16 away;
} GameB45D0;

typedef struct {
    u8 pad00[0xC];
    s32 handle;
} NodeB45D0;

typedef struct {
    u8 pad00[4];
    char* score;
    char* line3;
    char* line1;
    u8 pad10[0x194];
    char* line2;
} TextsB45D0;

typedef struct {
    u8 pad00[0x24];
    NodeB45D0* node;
    u8 pad28[0x14];
    s32 list;
    u8 pad40[0x20];
    GameB45D0* game;
    u8 pad64[0x10];
    TextsB45D0 texts;
} ItemB45D0;

typedef struct {
    u8 pad00[0x22];
    u8 code;
    u8 pad23;
    u8 hi;
    u8 lo;
} PlayerB45D0;

extern s16 D_80073D68;
extern char D_800C3024[];
extern char D_800C302C[];

extern void func_8001EC20(s32, s32);
extern void func_8001F2B4(s32, PlayerB45D0*);
extern char* func_8002E65C(char*, const char*);
extern u16 func_8003A1D0(void);
extern u16 func_8003A21C(u16);
extern PlayerB45D0* func_8003AA28(u16);
extern void func_800945D8(u16, char*);
extern void func_800AE6E0(s16, s32);
extern void func_800B4078(GameB45D0*);
extern void func_800DB44C(s32, s32*, u32*, s32*);

void func_800B45D0(ItemB45D0* item) {
    GameB45D0* game = item->game;
    s32 list = item->list;
    s32 handle = item->node->handle;
    TextsB45D0* texts;
    PlayerB45D0* player;
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
    func_8001EC20(list, 1);
    func_8001EC20(list, 2);
    func_800DB44C(handle, &a, &index, &b);
    if (index < func_8003A1D0()) {
        player = func_8003AA28(func_8003A21C((u16)index));
        id = player->lo | (player->hi << 8);
        func_800AE6E0(id, 1);
        func_8002E65C(texts->line1, (char*)player);
        func_8001EC20(list, 3);
        func_800945D8(player->code, texts->line2);
        func_8001EC20(list, 0x69);
        func_8001F2B4(0, player);
        return;
    }
    func_800AE6E0(0, 0);
    func_8002E65C(texts->line1, D_800C3024);
    func_8001EC20(list, 3);
    func_8002E65C(texts->line2, D_800C3024);
    func_8001EC20(list, 0x69);
}
