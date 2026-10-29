#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern s8 D_800C4EEA;
extern s8 D_800C4EEB;

s32 func_800A1D20(void) {
    s32 var_a0;

    var_a0 = 0;
    switch (D_800C4EEB) {                           /* irregular */
    case 8:
        if (D_800C4EEA >= 4) {
            var_a0 = 4;
        }
        if (D_800C4EEA == 6) {
            var_a0 = 6;
        }
        break;
    case 16:
        if (D_800C4EEA >= 8) {
            var_a0 = 8;
        }
        if (D_800C4EEA >= 0xC) {
            var_a0 = 0xC;
        }
        if (D_800C4EEA >= 0xE) {
            var_a0 = 0xE;
        }
        break;
    }
    return var_a0;
}
