#include "types.h"

s32 func_800B2230(void);
void func_800DD514(void* resource);
extern u8 D_800720D8;

s32 func_800C8B4C(void) {
    if ((s16)func_800B2230() == 1) {
        func_800DD514(&D_800720D8);
    }
    return 25;
}
