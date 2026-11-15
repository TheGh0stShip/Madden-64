#include "types.h"

extern s16 D_80086190[];
extern s8 D_800C4EEB;

s16 func_800A1F3C(s16 value) {
    s16 i;
    s8 *count = &D_800C4EEB;
    s32 key;
    s16 *values;
    s8 *c;

    i = 0;
    if (*count > 0) {
        key = value;
        values = D_80086190;
        c = count;
        do {
            if (key == (u16)values[i]) {
                i--;
                if (i < 0) {
                    i = *c - 1;
                }
                return values[i];
            }
            i++;
        } while (i < *(count = &D_800C4EEB));
    }
}
