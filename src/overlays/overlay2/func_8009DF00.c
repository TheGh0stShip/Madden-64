#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80024EDC(s32);                     /* extern */
s32 func_80024F5C();                            /* extern */
s32 func_80028224();                                /* extern */
s32 func_8009F60C();                            /* extern */
s32 func_800DD514(s32 *);                   /* extern */
extern u8 D_800724F8;
extern u8 D_800724F9;
extern s32 D_80072500;
extern s32 D_80072558;
extern s32 D_8007258C;

s32 func_8009DF00(void) {
    s32 *var_a0;

    func_8009F60C();
    if ((func_80028224() & 0xFFFF) != 3) {
        func_80024F5C();
    }
    func_80024EDC(2);
    if (D_800724F8 == 0) {
        var_a0 = &D_80072500;
    } else {
        var_a0 = &D_8007258C;
        if (D_800724F9 == 0) {
            var_a0 = &D_80072558;
        }
    }
    func_800DD514(var_a0);
    return 0x19;
}
