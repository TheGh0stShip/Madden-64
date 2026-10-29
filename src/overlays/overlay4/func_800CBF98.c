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
extern void func_800CA7A8(SDE64 *);
extern u32 D_80080C10;
extern SDE64 *D_80085040[][22];
extern s16 D_80088AE4;

void func_800CBF98(void) {
    s16 i;
    SDE64 *p;
    if (D_80080C10 & 0x4000) {
        for (i = 0; i < 11; i++) {
            p = D_80085040[D_80088AE4][i];
            if (p->unk40 != 0 && p->unk48 != 0) {
                func_800CA7A8(p);
            }
        }
    }
}
