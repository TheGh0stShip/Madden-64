#include "types.h"

void func_800E0CFC(void);

void func_800E245C(void) {
    if (*(u16*)0x800717F2 != 0) {
        func_800E0CFC();
    }
    *(s32*)0x800717F0 = 0;
}
