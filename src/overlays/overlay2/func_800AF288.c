#include "types.h"

typedef struct {
    u16 slot[55];
    u8 rest[0x214C - 110];
} RosterTeam;

extern RosterTeam D_80080CFC[];

u8 *func_8003AA28(u16);
void func_800167FC(u8, s32);

void func_800AF288(u16 arg0, s32 arg1, void *arg2) {
    func_800167FC(func_8003AA28(D_80080CFC[(*(u8 **)((u8 *)arg2 + 0x60))[0x14]].slot[arg0])[0xD], arg1);
}
