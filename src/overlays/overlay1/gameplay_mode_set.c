#include "types.h"

void func_800AEA9C(s32 enabled);

void func_800B181C(void) {
    func_800AEA9C(1);
    *(s16*)0x800876DC = 8;
}
