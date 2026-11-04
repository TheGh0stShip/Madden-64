#include "types.h"

typedef struct WorkerD54E4 {
    u8 pad00[8];
    s32 index;
} WorkerD54E4;

extern u8 D_8000042C;
extern u16 D_800E7B7C;
extern s32 D_800721D4;
extern s32 D_800721D0;
extern u16 D_800E7A74;
extern void *D_800E7A78[];
extern s16 D_800E7A90[];
extern s16 D_800E7B88[];
extern s16 D_800E7A98[];
extern WorkerD54E4 *D_800E7B80[];

extern u16 func_80035674(void *data);
extern u16 func_800356C4(void *data, s32 size);
extern void *func_80032E00(s32 pool, s32 size);
extern WorkerD54E4 *func_8002FEA4(void *callback, s32 count, s32 zero);
extern void func_800D533C(void);

void func_800D54E4(u16 count) {
    u16 i;

    D_800E7B7C = count;
    D_800721D4 = 0;
    D_800E7A74 = func_80035674(&D_8000042C);
    if (D_800E7A74 == 0xFFFF) {
        D_800E7A74 = func_800356C4(&D_8000042C, 0x21C);
        D_800721D4 = 1;
    }
    D_800721D0 = 1;
    for (i = 0; i < count; i++) {
        D_800E7A78[i] = func_80032E00(0, 0x2000);
        D_800E7A90[i] = 0;
        D_800E7B88[i] = 0;
        D_800E7A98[i] = -1;
        D_800E7B80[i] = func_8002FEA4(func_800D533C, 4, 0);
        D_800E7B80[i]->index = i;
    }
}
