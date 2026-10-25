#include "types.h"

typedef struct GridHalfwords {
    u16 values[4262];
} GridHalfwords;

extern GridHalfwords D_80082D22[];

void func_800259E4(u16 row, s32 column, s32 amount) {
    s32 index = (u16)column;

    if (index < 27) {
        if (index >= 23) {
            return;
        }
    }
    D_80082D22[row].values[index] += amount;
}
