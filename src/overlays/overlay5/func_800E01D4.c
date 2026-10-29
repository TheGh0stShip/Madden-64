#include "types.h"

s32 func_800E01D4(s32 value) {
    s16 narrowed = value;

    if (narrowed < 4) {
        if (narrowed >= 0) {
            return 1;
        }
    }
    return 0;
}
