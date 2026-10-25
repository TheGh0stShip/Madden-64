#include "types.h"

extern s16 D_80086DA8;
extern s8 D_80086DE4[];

s32 func_80030EA0(s16 value) {
    s32 index = D_80086DA8;
    s32 count = index;

    index--;
    if (count != 0) {
        do {
            if (D_80086DE4[index] == value) {
                return index;
            }
        } while (index-- != 0);
    }
    return -1;
}
