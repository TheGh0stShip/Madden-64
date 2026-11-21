#include "types.h"

typedef struct {
    u8 pad00[0x60];
    s32 *unk_60;
} StatContext;

extern s32 *D_8007A394;
extern u8 D_80081602[];
extern s8 D_80084FA8;
extern char *D_800E6B78[];
extern u8 func_80022A88(u16 team, u16 player);
extern char *func_80022A3C(u16 team, u16 player);
extern s32 func_80022AD8(u16 team, u16 player);
extern u16 func_80022B3C(u16 team, u16 player, u16 stat);
extern void func_8002E65C(char *dst, char *src);
extern void func_8003E850(u16 value, char *dst);
extern void func_800167FC(s16 value, char *dst);

void func_800CE27C(u16 index, u32 kind, char *dst, StatContext *context)
{
    s32 player;
    u32 rating;
    s32 *table;

    player = D_8007A394[index];
    switch (kind) {
    case 0:
        func_800167FC(func_80022A88(D_80084FA8, player), dst);
        break;
    case 1:
        func_8002E65C(dst, func_80022A3C(D_80084FA8, player));
        break;
    case 2:
        rating = D_80081602[D_80084FA8 * 0x214C + player * 3];
        table = context->unk_60;
        if (rating >= 50) {
            rating = 49;
        }
        *(s32 *)dst = table[rating / 5];
        break;
    case 3:
        func_8002E65C(dst, D_800E6B78[func_80022AD8(D_80084FA8, player) & 0x3F]);
        break;
    case 4:
        func_800167FC(func_80022B3C(D_80084FA8, player, 0), dst);
        break;
    case 5:
        func_8003E850(func_80022B3C(D_80084FA8, player, 1), dst);
        break;
    default:
        func_800167FC(func_80022B3C(D_80084FA8, player, kind - 4) * 100 / 253, dst);
        break;
    }
}
