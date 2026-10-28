#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000BF08();                            /* extern */
s32 func_80030050();                            /* extern */
s32 func_80030110();                            /* extern */
extern u16 D_80087914;

void func_800B31F4(void) {
    if (D_80087914 == 1) {
        do {
            func_80030110();
            func_80030050();
            func_8000BF08();
        } while (D_80087914 == 1);
    }
}
