#include "types.h"

typedef struct { u8 pad[0x2C]; s32 unk2C; s32 unk30; } SB7F8b;
typedef struct { u8 pad[0x24]; SB7F8b *unk24; u16 unk28; } SB7F8;
extern u32 D_80080C10;
extern void func_800C0BBC(SB7F8 *, s32);
extern void func_800ABCA0(s32, s32);

void func_800CB7F8(SB7F8 *arg0) {
    SB7F8b *p;
    D_80080C10 |= 0x04000000;
    arg0->unk28 &= ~1;
    p = arg0->unk24;
    p->unk30 = 0;
    p->unk2C = 0;
    func_800C0BBC(arg0, 0x402);
    func_800ABCA0(0xB, 0xB4);
}
