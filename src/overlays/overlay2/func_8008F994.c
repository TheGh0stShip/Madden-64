#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s16 func_8008F994(s16 arg0) {
    s16 var_v0;

    var_v0 = 0x73;
    if (arg0 < 0x1E) {
        var_v0 = arg0;
    }
    return var_v0;
}
