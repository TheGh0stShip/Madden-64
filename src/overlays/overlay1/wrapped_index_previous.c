#include "types.h"

u16 func_800BA4CC(u16 value) {
    if (value != 0) {
        goto nonzero;
    }
    value = 0x24F;
    goto done;

nonzero:
    value--;

done:
    return value;
}
