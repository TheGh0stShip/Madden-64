#include "types.h"

extern u8 D_800C509E[];
extern s16 D_800892B4;

void func_80093FD8(void) {
    u8 i;

    for (i = 0; i < 30; i++) {
        if (D_800C509E[i] == D_800892B4) {
            return;
        }
    }
    D_800892B4 = D_800C509E[0];
}
