#include "types.h"

extern u8* D_80073438;

s32 func_8003A21C(u16 index) {
    s32 result = index;

    if (D_80073438 == 0) {
        result = 0xFFFF;
    } else {
        result = *(u16*)(D_80073438 + 0xCE4 + result * 2);
    }
    return result;
}
