#include "types.h"

void func_800AEA9C(s32 enabled);

void func_800B36AC(void) {
    if (*(s32*)0x800854A4 != 0) {
        func_800AEA9C(1);
    }
}
