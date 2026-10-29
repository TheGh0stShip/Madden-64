#include "types.h"

typedef struct {
    u8 pad00[4];
    s16 unk04[8];
    u8 pad14_[0];
} StateHead;

extern u8 D_80080C90[];

void func_8003A7DC(u16, void *);
void func_8003A8CC(u16, void *);
void func_8003AE80(void *, void *);
void func_800AEF84(void *);
void func_800AE8F0(void *, u16);
void func_8001F25C(s32, s16, s32);

void func_800AE734(void *arg0, s16 arg1) {
    u8 *state;
    u8 *teams;
    s32 offset;
    u16 id;

    state = *(u8 **)((u8 *)arg0 + 0x60);
    *(s16 *)(state + state[0x14] * 2 + 4) = arg1;
    id = arg1;
    func_8003A7DC(id, D_80080C90 + state[0x14] * 0x214C);
    teams = D_80080C90 + 0x6C;
    func_8003A8CC(id, teams + state[0x14] * 0x214C);
    offset = state[0x14] * 0x214C;
    func_8003AE80(teams + offset, D_80080C90 + 0xDA + offset);
    func_800AEF84(state);
    func_800AE8F0(arg0, id);
    func_8001F25C(0, *(s16 *)(state + state[0x14] * 2 + 4), 0);
}
