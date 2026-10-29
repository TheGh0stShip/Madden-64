#include "types.h"

typedef struct { u8 pad[0x20]; s32 unk20; u8 pad24[0xC]; s32 unk30; } S6178;
extern S6178 *D_80086178;
extern u8 D_80087AB0;
extern void func_800C5F80(void);
extern void func_8009CA5C(s32, s32);
extern void func_8003CF78(s32, s32);

void func_800C9F14(void) {
    S6178 *p;
    D_80087AB0 = 0x11;
    func_800C5F80();
    func_8009CA5C(0x2D, 0xD2);
    p = D_80086178;
    p->unk30 = -p->unk30;
    p->unk20 += p->unk30;
    func_8003CF78(0x16, 0xA);
}
