#include "types.h"

void func_800AE87C(s32 index);

void func_800B3008(void) {
    func_800AE87C(0);
    func_800AE87C(1);
}

void func_800B3030(void) {
    *(s16*)0x80087752 = 0;
    *(s16*)0x8008B8D0 = 0;
}
