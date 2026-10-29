#include "types.h"

typedef struct { u8 pad[0x28]; u16 unk28; } Plr800DDE00;
typedef struct { Plr800DDE00 *p[22]; } Team800DDE00;
extern Team800DDE00 D_80085040[];
extern s16 D_800886E0;

s32 func_800DDE00(void) {
    s32 i;
    Team800DDE00 *t = D_80085040;
    for (i = 0; i < 11; i++) {
        if (!(t[D_800886E0].p[i]->unk28 & 0x80)) {
            return 0;
        }
    }
    return 1;
}
