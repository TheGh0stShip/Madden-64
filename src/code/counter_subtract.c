#include "types.h"

extern u16 D_80088AEE;
extern u16 D_80087A60;

void func_800297DC(void) {
    u16* counter = &D_80088AEE;
    *counter = *counter - D_80087A60;
}
