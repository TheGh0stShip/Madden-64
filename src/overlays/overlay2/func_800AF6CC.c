#include "types.h"

typedef struct {
    u8 pad00[0x6E];
    u8 players[0x214C - 0x6E];
} Team;

typedef struct {
    u8 pad00[0x14];
    u8 team;
} Owner;

typedef struct {
    u8 pad00[0x60];
    Owner *owner;
} Context;

extern Team D_80080CFC[];

void func_800AFA50(u8 *players, u16 id, s32 arg, s32 kind);

void func_800AF6CC(u16 id, s32 arg, Context *ctx) {
    func_800AFA50(D_80080CFC[ctx->owner->team].players, id, arg, 8);
}
