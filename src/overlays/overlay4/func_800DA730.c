#include "types.h"

typedef struct { u8 pad[0x14]; s32 unk14; u8 pad18[0x2C-0x18]; s32 unk2C; s32 unk30; u8 pad34[0x3C-0x34]; u16 unk3C; u16 unk3E; } Sub;
typedef struct Obj { u8 pad[0xC]; s16 unkC; u8 padE[0x24-0xE]; Sub *unk24; u16 unk28; u8 pad2A[0x65-0x2A]; u8 unk65; } Obj;
extern void func_800C0018(Obj *, s32, s32);

s32 func_800DA730(Obj *a0) {
    func_800C0018(a0, a0->unk65 << 4, 0);
    a0->unk24->unk3E = a0->unk24->unk3C;
    if (a0->unk24->unk14 & 0x20000) {
        return 0;
    }
    a0->unk24->unk3E = 0;
    a0->unk28 &= ~0x10;
    a0->unk24->unk14 &= ~0x10000;
    if (a0->unkC < 0x50) {
        a0->unkC = 0;
    } else {
        a0->unkC -= 0x50;
    }
    a0->unk24->unk2C /= 2;
    a0->unk24->unk30 /= 2;
    return 1;
}
