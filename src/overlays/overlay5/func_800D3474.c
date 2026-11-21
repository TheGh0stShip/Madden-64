#include "types.h"

char *func_80022A3C(u16 player, u16 team);
s32 func_80022A88(u16 player, u16 team);
s32 func_80022AD8(u16 player, u16 team);
s32 func_80022B3C(u16 player, u16 team, u16 stat);
char *func_8002E65C(char *dst, char *src);
void func_800167FC(s16 value, char *dst);
extern char *D_800E6B78[];

void func_800D3474(u16 team, u16 player, s16 stat, char *name, char *number, char *position, char *value0,
                   char *value1, char *value2, char *value3, char *value4) {
    func_8002E65C(name, func_80022A3C(player, team));
    func_800167FC((u8)func_80022A88(player, team), number);
    func_8002E65C(position, D_800E6B78[func_80022AD8(player, team) & 0x3F]);
    if (stat == 0) {
        func_800167FC(func_80022B3C(player, team, stat), value0);
    } else {
        func_800167FC((u16)func_80022B3C(player, team, stat) * 100 / 253, value0);
    }
    func_800167FC((u16)func_80022B3C(player, team, stat + 1) * 100 / 253, value1);
    func_800167FC((u16)func_80022B3C(player, team, stat + 2) * 100 / 253, value2);
    func_800167FC((u16)func_80022B3C(player, team, stat + 3) * 100 / 253, value3);
    func_800167FC((u16)func_80022B3C(player, team, stat + 4) * 100 / 253, value4);
}
