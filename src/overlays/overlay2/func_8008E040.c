#include "types.h"

extern u8 D_800C509E[];

u32 func_8008E040(u8 id) {
    u32 i;

    for (i = 0; i < 30; i++) {
        if (D_800C509E[i] == id) {
            break;
        }
    }
    return i;
}
