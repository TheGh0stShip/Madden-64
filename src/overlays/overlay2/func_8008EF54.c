#include "types.h"

#ifndef NULL
#define NULL 0
#endif

u8 *func_8008DC10(s16, s16);                        /* extern */

s16 func_8008EF54(s16 arg0) {
    s16 temp_v0;
    s16 var_s0;
    s16 var_s1;

    var_s1 = 0;
    var_s0 = 0;
    do {
        if (*func_8008DC10(arg0, var_s0) != 0xFF) {
            var_s1 += 1;
        }
        temp_v0 = var_s0 + 1;
        var_s0 = temp_v0;
    } while (temp_v0 < 0xF);
    return var_s1;
}
