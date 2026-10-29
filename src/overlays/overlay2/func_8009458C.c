#include "types.h"

extern u8 D_80087960;
extern s32 D_80089490;
extern s32 D_800BF2AC;
void func_800DD514(s32 *);

s32 func_8009458C(void) {
    if (D_80087960 != 0 && D_80089490 != -1) {
        func_800DD514(&D_800BF2AC);
    } else {
        func_800DD514(0);
    }
    return 0x19;
}
