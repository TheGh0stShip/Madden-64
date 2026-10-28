#include "types.h"

extern u8* D_80072468;

void func_800E0E84(s32 value);

u8 func_800E0E58(void) {
    func_800E0E84(0);
    return D_80072468[8];
}
