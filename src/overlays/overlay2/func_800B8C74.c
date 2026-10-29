#include "types.h"

extern u8 D_800C509E[];

s32 func_800B8C74(s16 value) {
    s16 i;

    for (i = 0; i < 0x1E; i++) {
        if (value == D_800C509E[i]) {
            return 1;
        }
    }
    return 0;
}
