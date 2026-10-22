#include "types.h"

u16 func_800BA4AC(u16 value) {
    value++;
    if (value == 0x250) {
        value = 0;
    }
    return value;
}
