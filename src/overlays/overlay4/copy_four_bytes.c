#include "types.h"

void func_800E6120(u8* destination, u8* source) {
    destination[0x64] = source[0];
    destination[0x65] = source[1];
    destination[0x66] = source[2];
    destination[0x67] = source[3];
}
