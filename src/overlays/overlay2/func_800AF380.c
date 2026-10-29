#include "types.h"

typedef struct {
    u16 slot[55];
    u8 rest[0x214C - 110];
} RosterTeam;

extern RosterTeam D_80080CFC[];
extern char *D_800E6B78[];

u8 *func_8003AA28(u16);
void func_8002E65C(char *, char *);

void func_800AF380(u16 arg0, char *arg1, void *arg2) {
    func_8002E65C(arg1, D_800E6B78[func_8003AA28(D_80080CFC[(*(u8 **)((u8 *)arg2 + 0x60))[0x14]].slot[arg0])[0xE] & 0x3F]);
}
