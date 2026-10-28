#include "types.h"

extern s32 D_80089490[];
extern s16 D_80089598[];

s32 func_80097940(s16 id) {
    s32 found = 0;
    s16 i;

    for (i = 0; i < 4; i++) {
        if (D_80089490[i] == -1) {
            break;
        }
        if (D_80089598[D_80089490[i]] == id) {
            found = 1;
            break;
        }
    }
    return found;
}
