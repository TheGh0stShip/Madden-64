#include "types.h"

typedef struct SDE64 {
    u8 pad0[0x24];
    void *unk24;
    u8 pad28[0x40 - 0x28];
    struct SDE64 *unk40;
    u8 pad44[4];
    s16 unk48;
    s16 unk4A;
    u16 unk4C;
} SDE64;
extern u8 D_80074830[];
extern void func_800B96C0(void *, void *);

void func_800CDE64(SDE64 *arg0, s16 arg1) {
    arg0->unk48 = arg1;
    arg0->unk40->unk4C++;
    arg0->unk4A = 0;
    arg0->unk40->unk4A = 0;
    arg0->unk40->unk40 = arg0;
    func_800B96C0(arg0->unk40->unk24, D_80074830);
}
