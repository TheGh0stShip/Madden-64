#include "types.h"

typedef struct Obj { u8 pad[0x64]; u8 unk64; u8 unk65; } Obj;
typedef struct { Obj *p[22]; } Team;
extern Team D_80085040[];
extern s16 D_800886E0;

s32 func_800DDF18(s16 a) {
    switch (a) {
    case 0:
    case 2:
    case 3:
        return 1;
    case 1:
    case 8:
    case 9:
    case 10:
        return 0;
    default:
        return 2;
    }
}

s32 func_800DDF5C(s32 id) {
    s32 i;
    Team *tbl = D_80085040;
    for (i = 0; i < 11; i++) {
        if (tbl[D_800886E0].p[i]->unk64 == 0x19 && tbl[D_800886E0].p[i]->unk65 == id) {
            return 1;
        }
    }
    return 0;
}
