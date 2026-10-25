#include "types.h"

extern u16 func_80031A1C(s32 limit);
extern void func_80041BB4(u16 owner);

s32 func_80041BDC(u16 owner, u16 threshold) {
    threshold += (100 - threshold) >> 1;
    if (func_80031A1C(100) < threshold) {
        func_80041BB4(owner);
        return 1;
    }
    return 0;
}
