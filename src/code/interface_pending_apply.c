#include "types.h"

extern u8 D_80086C64;
extern void func_8003D0C4(s32);

void func_800418F8(void) {
    if (D_80086C64 != 0) {
        func_8003D0C4(11);
        D_80086C64 = 0;
    }
}
