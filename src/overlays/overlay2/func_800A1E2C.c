#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern s8 D_800C4EEA;
extern s8 D_800C4EEB;

s32 func_800A1E2C(void) {
    s32 var_a0;

    var_a0 = 0;
    switch (D_800C4EEB) {                           /* irregular */
    case 8:
        if (D_800C4EEA >= 4) {
            var_a0 = 1;
        }
        if (D_800C4EEA == 6) {
            var_a0 = 2;
        }
        break;
    case 16:
        if (D_800C4EEA >= 8) {
            var_a0 = 1;
        }
        if (D_800C4EEA >= 0xC) {
            var_a0 = 2;
        }
        if (D_800C4EEA >= 0xE) {
            var_a0 = 3;
        }
        break;
    }
    return var_a0;
}
