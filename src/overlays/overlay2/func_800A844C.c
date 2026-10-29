#include "types.h"

extern s16 D_8006B9E0;
extern s16 D_8006B9E4[];
extern u8 D_800C509E[];

void func_800A844C(void) {
    u32 i;

    for (i = 0; i < 30; i++) {
        D_8006B9E4[i] = D_800C509E[i];
    }
    D_8006B9E0 = 30;
}
