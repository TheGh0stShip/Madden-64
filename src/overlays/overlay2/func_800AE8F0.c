#include "types.h"

typedef struct {
    u8 pad00[0x48];
    s32 unk48;
} Game;

extern u16 D_80084F40;
extern s32 D_800C48B8[];

Game *func_800DD634(void);
s32 func_80016FD4(void);
void func_80016FC4(u16);
void func_80092B98(void);
void func_80017C24(s32);
void func_80017B80(s32);
void func_8001F25C(s32, s16, s32);

void func_800AE8F0(void *arg0) {
    Game *game;
    u8 *state;
    s32 saved;
    s32 old;
    s32 value;

    game = func_800DD634();
    state = *(u8 **)((u8 *)arg0 + 0x60);
    saved = func_80016FD4();
    func_80016FC4(D_80084F40);
    old = game->unk48;
    game->unk48 = 0;
    func_80092B98();
    func_80092B98();
    func_80017C24(old);
    value = D_800C48B8[*(u16 *)(state + state[0x14] * 2 + 4)];
    game->unk48 = value;
    func_80017B80(value);
    func_80016FC4(saved);
    func_8001F25C(0, *(s16 *)(state + state[0x14] * 2 + 4), 0);
}
