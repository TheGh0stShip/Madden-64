#include "types.h"

typedef struct SDE64 {
    u8 pad0[0x24];
    void *unk24;
    u8 pad28[0x40 - 0x28];
    struct SDE64 *unk40;
    u8 pad44[4];
    s16 unk48;
    s16 unk4A;
    s16 unk4C;
} SDE64;
extern u8 D_80074824[];
extern void func_800B96C0(void *, void *);

void func_800CDEBC(SDE64 *arg0) {
    if (arg0->unk48 != 0) {
        arg0->unk48 = 0;
        if (--arg0->unk40->unk4C == 0) {
            func_800B96C0(arg0->unk40->unk24, D_80074824);
        }
        arg0->unk40->unk40 = 0;
    }
}
