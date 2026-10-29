#include "types.h"

typedef struct { u8 pad[0x28]; s32 unk28; } S79D0b;
typedef struct { u8 pad[8]; S79D0b *unk8; } S79D0;
extern s32 D_80069AB8;
extern s32 D_80069AE8;
extern S79D0 *D_80087B54;
extern S79D0 *func_8000D740(s32, s32, s32);
extern void func_80033B20(S79D0 *, s32);
extern void func_80095104(S79D0 *);

void func_800C79D0(s32 arg0, s32 arg1) {
    S79D0 *p;
    D_80069AE8 = D_80069AB8;
    p = func_8000D740(arg0, 0xB, arg1);
    D_80087B54 = p;
    p->unk8->unk28 = 0x180;
    func_80033B20(p, 1);
    func_80095104(D_80087B54);
}
