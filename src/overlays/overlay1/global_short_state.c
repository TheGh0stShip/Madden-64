#include "types.h"

void func_800B31C0(s16 value) {
    *(s16*)0x8008B8D0 = value;
}

s16 func_800B31D0(void) {
    return *(s16*)0x8008B8D0;
}

s32 func_800B31E0(void) {
    return *(s16*)0x8006B9BC != -1;
}
