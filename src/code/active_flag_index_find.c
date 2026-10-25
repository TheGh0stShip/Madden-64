#include "types.h"

extern s16 D_80086DA8;
extern s32 func_80030B54(s16 index);

u8 func_8003E3E0(s32 mask) {
    s16 index;

    for (index = 0; index < D_80086DA8; index++) {
        if (func_80030B54(index) & mask) {
            return index;
        }
    }
    return 0;
}
