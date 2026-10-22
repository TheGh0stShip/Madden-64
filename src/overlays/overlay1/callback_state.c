#include "types.h"

void func_800BC184(s32 value, u8 mode) {
    *(u8*)0x8007A274 = mode;
    *(s32*)0x8007A270 = value;
}
