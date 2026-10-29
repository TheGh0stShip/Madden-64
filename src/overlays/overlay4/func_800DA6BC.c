#include "types.h"

typedef struct { u8 pad[0x14]; s32 unk14; } Sub800DA6BC;
typedef struct { u8 pad[0xC]; u16 unkC; u8 padE[0x24-0xE]; Sub800DA6BC *unk24; u16 unk28; } Obj800DA6BC;
extern u16 func_800C0D00(Obj800DA6BC *, s32);
extern void func_800C0BBC(Obj800DA6BC *, s32);

s32 func_800DA6BC(Obj800DA6BC *a0) {
    if (!func_800C0D00(a0, 0x1A)) {
        func_800C0BBC(a0, 0x1A001D);
    }
    a0->unk24->unk14 |= 0x10000;
    a0->unk28 |= 0x10;
    a0->unkC += 0x50;
    return 0;
}
