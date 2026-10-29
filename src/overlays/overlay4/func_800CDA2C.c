#include "types.h"

typedef struct { u8 pad0[0x40]; s32 unk40; s32 unk44; s16 unk48; s16 unk4A; s16 unk4C; s16 unk4E; } SPl;
extern SPl *D_80085040[][22];
extern s16 D_8008B65C;

void func_800CDA2C(void) {
    s16 i;
    for (i = 0; i < 11; i++) {
        D_80085040[0][i]->unk40 = 0;
        D_80085040[0][i]->unk44 = 0;
        D_80085040[0][i]->unk48 = 0;
        D_80085040[0][i]->unk4C = 0;
        D_80085040[0][i]->unk4A = 0x7000;
        D_80085040[0][i]->unk4E = 0;
        D_80085040[1][i]->unk40 = 0;
        D_80085040[1][i]->unk44 = 0;
        D_80085040[1][i]->unk48 = 0;
        D_80085040[1][i]->unk4C = 0;
        D_80085040[1][i]->unk4A = 0x7000;
        D_80085040[1][i]->unk4E = 0;
    }
    D_8008B65C = 0;
}
