#include "types.h"

extern s32 func_80022AD8(u16 first, u16 second);

s32 func_8003E388(u16 first, u16 second) {
    s32 value = func_80022AD8(first, second) & 0x3F;
    s32 result;

    if (value < 0) {
        goto no;
    }
    if (value < 10) {
        goto yes;
    }
    if (value >= 23) {
        goto no;
    }
    if (value < 21) {
        goto no;
    }
yes:
    result = 1;
    goto done;
no:
    result = 0;
done:
    return result;
}
