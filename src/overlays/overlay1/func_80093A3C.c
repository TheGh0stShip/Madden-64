#include "types.h"

extern s16 D_800857F0;
extern s16 D_80086CF2;
extern s16 D_80089320;
extern s16 D_80089518;
extern s32 D_8008A054;
extern u16 D_8008A5B2;

s16 func_8008F414(void);
s16 func_8008F504(void);
s16 func_8008F600(void);
s32 func_800DC560(void);

s32 func_80093A3C(void) {
    if (D_8008A5B2 == 1) {
        if (D_8008A054 != 0) {
            return 0;
        }
        if (D_800857F0 != 0) {
            return 0;
        }
        if (D_80089320 == -1) {
            if (func_8008F504() != 0) {
                return 0;
            }
            if (func_8008F600() != 0) {
                return 0;
            }
        } else if (func_800DC560() == 0) {
            return 0;
        }
        if (D_80086CF2 != 6) {
            if (D_80089518 == -1) {
                if (func_8008F414() != 0) {
                    goto fail;
                }
                goto ok;
            }
            if (func_8008F414() < 2) {
            ok:
                return 1;
            }
        }
    }
fail:
    return 0;
}
