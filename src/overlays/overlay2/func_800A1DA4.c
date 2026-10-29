#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern s8 D_800C4EEA;
extern s8 D_800C4EEB;

s32 func_800A1DA4(void) {
    s32 var_v1;

    var_v1 = 3;
    switch (D_800C4EEB) {                           /* irregular */
    case 8:
        if (D_800C4EEA >= 4) {
            var_v1 = 5;
        }
        if (D_800C4EEA == 6) {
            var_v1 = 6;
        }
        break;
    case 16:
        var_v1 = 7;
        if (D_800C4EEA >= 8) {
            var_v1 = 0xB;
        }
        if (D_800C4EEA >= 0xC) {
            var_v1 = 0xD;
        }
        if (D_800C4EEA >= 0xE) {
            var_v1 = 0xE;
        }
        break;
    }
    return var_v1;
}
