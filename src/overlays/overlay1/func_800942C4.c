#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8002FFEC(s32 *);                   /* extern */
s32 func_8008F414();                                /* extern */
s32 func_8008F504();                                /* extern */
s32 func_8008F58C();                                /* extern */
s32 func_800BEE28();                            /* extern */
extern s32 *D_80086DD8;
extern s32 D_8008FBA0;
extern s32 D_800DECA0;

void func_800942C4(void) {
    if (((func_8008F414() << 0x10) == 0) && ((func_8008F504() << 0x10) == 0) && ((func_8008F58C() << 0x10) == 0)) {
        func_8002FFEC(&D_8008FBA0);
        func_800BEE28();
        D_80086DD8 = &D_800DECA0;
    }
}
