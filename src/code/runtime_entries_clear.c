#include "types.h"

extern s16 D_80086DA8;
extern void* D_80089358;
extern u32 D_80087F90[];

void func_8003190C(void* context) {
    s32 i;

    D_80089358 = context;
    for (i = 0; i < D_80086DA8; i++) {
        D_80087F90[i] = 0;
    }
}
