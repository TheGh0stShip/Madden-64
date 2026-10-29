#include "types.h"

extern u16 D_80086DA8;
extern s32 D_80089490[];

u16 func_800A67F4(void) {
    u16 count = 0;
    u16 i;

    for (i = 0; i < D_80086DA8; i++) {
        if (D_80089490[i] == -1) {
            break;
        }
        count++;
    }
    return count;
}
