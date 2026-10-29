#include "types.h"

typedef struct { u8 pad[0x20]; s32 unk20; u8 pad24[8]; s32 unk2C; s32 unk30; } Sub;
typedef struct Obj { u8 pad[0xA]; u8 unkA; u8 padB; s16 unkC; u8 padE[0x24-0xE]; Sub *unk24; u16 unk28; u8 pad2A[0x8C-0x2A]; s32 unk8C; s32 unk90; s32 unk94; s32 unk98; } Obj;
extern s32 D_80080C10;
extern Obj *D_80080C2C;

s32 func_800DA804(Obj *a0) {
    Sub *s = a0->unk24;
    D_80080C2C = a0;
    s->unk30 = 0;
    s->unk2C = 0;
    if (!(D_80080C10 & 0x10000000)) {
        a0->unk8C = a0->unk24->unk20 + 0x300000;
    } else {
        D_80080C10 |= 0x01000000;
        a0->unk8C = a0->unk24->unk20 - 0x300000;
    }
    a0->unk90 = 0;
    a0->unk94 = 0;
    a0->unk98 = 0;
    if (D_80080C10 & 0x2000) {
        a0->unk28 |= 1;
    }
    if (!(D_80080C10 & 0x10000000)) {
        a0->unkC = 0x130;
        a0->unkA = 0xFF;
    } else {
        a0->unkC = -0x28;
        a0->unkA = 0;
    }
    return 0;
}
