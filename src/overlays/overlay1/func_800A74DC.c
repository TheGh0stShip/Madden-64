#include "types.h"

extern s32 D_8008A724[];

void func_800A2DB8(s32 arg0) {
    s16 i;

    for (i = 0; i < 1; i++) {
        if (D_8008A724[i] == arg0) {
            D_8008A724[i] = 0;
            return;
        }
    }
}
