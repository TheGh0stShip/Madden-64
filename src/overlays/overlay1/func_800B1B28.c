#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8003E23C(s32 *);                   /* extern */
s32 func_800AADA8(s16);                         /* extern */
s32 func_800AE700();                            /* extern */
extern s32 D_8006B948;
extern s16 D_8006B9BE;
extern s16 D_800857C0;

void func_800B1B28(void) {
    if (D_8006B9BE != -1) {
        func_800AADA8(D_8006B9BE);
        D_8006B9BE = -1;
        func_8003E23C(&D_8006B948);
        D_800857C0 = 0;
        func_800AE700();
    }
}
