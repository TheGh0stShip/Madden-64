#include "types.h"

void func_800BC2BC(void) {
    s32 value = *(s32*)0x80088620;

    *(s32*)0x8008929C = 0;
    *(s32*)0x8008B788 = value;
}
