#include "types.h"

extern u8 FLAG;
u16 func_8009EC0C(void);
void func_800DD514(void *resource);

s32 overlay5_conditional_null_dispatch(void) {
    if (func_8009EC0C()) {
        FLAG = 1;
        func_800DD514(0);
    }
    return 25;
}
