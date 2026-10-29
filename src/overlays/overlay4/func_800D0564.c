#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; } Sub;
typedef struct Obj {
    u8 pad0[0x1E]; u8 x1E; u8 pad0c[0x24 - 0x1F]; Sub *sub;
    u8 pad2[0x65 - 0x28]; u8 x65;
} Obj;
typedef struct Team { Obj *players[22]; } Team;

s32 func_800D3C10(Obj *, Obj *);
extern Team D_80085040[];
extern Obj *D_8008A058;

s32 func_800D0564(Obj *arg0) {
    if (arg0 != D_8008A058) {
        return 1;
    }
    if (arg0->sub->flags & 0x40000) {
        func_800D3C10(arg0, (D_80085040 + arg0->x1E)->players[arg0->x65 & 0x7F]);
        arg0->sub->flags &= ~0x10000;
        return 1;
    }
    return 0;
}
