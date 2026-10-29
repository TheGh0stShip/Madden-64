#include "types.h"

typedef struct { s32 x; s32 y; s32 z; } Vec2i;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; } Sub;
typedef struct Obj { u8 pad[0x1E]; u8 unk1E; u8 pad1F[0x24-0x1F]; Sub *unk24; u8 pad28[0x65-0x28]; u8 unk65; u8 pad66[0x8C-0x66]; s32 unk8C; u8 pad90[0x98-0x90]; s32 unk98; s32 unk9C; } Obj;
typedef struct { Obj *p[22]; } Team;
extern Team D_80085040[];
extern s8 D_800884A3[];

s32 func_800DC418(Obj *a0) {
    Vec2i v;
    s32 dx;
    Team *tbl = D_80085040;
    Obj *t = tbl[a0->unk1E ^ 1].p[D_800884A3[a0->unk65]];
    v.x = t->unk24->unk1C - a0->unk24->unk1C;
    v.y = t->unk24->unk20 - a0->unk24->unk20;
    dx = v.x;
    if (dx < 0) {
        dx = -dx;
    }
    if (dx > 0x400000) {
        return 0;
    }
    if (v.y > 0) {
        return 0;
    }
    if (a0->unk8C >= 0x2E) {
        return 0;
    }
    a0->unk98 = (v.x < 0) ? 0xF00 : 0xFF;
    a0->unk9C = 0x6666;
    return 1;
}
