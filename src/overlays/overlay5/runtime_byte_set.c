#include "types.h"

extern u8* D_80072380;

void func_800DD648(u8 value) {
    D_80072380[0x13] = value;
}
