#include "types.h"

extern u32 D_80080C10;

s32 func_800C0218(u8 *object) {
    if (object[0x20] == 0 && (D_80080C10 & 0x40)) {
        return 1;
    }
    return 0;
}
