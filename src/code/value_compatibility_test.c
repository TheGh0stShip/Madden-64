#include "types.h"

extern u8* D_8006AA58[];

s32 func_8003BEE4(u8 primary, u8 value) {
    u8* accepted;

    if ((u8)(value - 23) < 2) {
        return 1;
    }
    primary &= 0x3F;
    if (primary == (value & 0x3F)) {
        return 1;
    }
    accepted = D_8006AA58[primary];
    while (*accepted != 0xFF) {
        if (value == *accepted) {
            return 1;
        }
        accepted++;
    }
    return 0;
}
