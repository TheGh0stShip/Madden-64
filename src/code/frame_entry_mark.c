#include "types.h"

extern u8* D_8007343C;

void func_8003A55C(u16 index) {
    D_8007343C[(index & 0x7FFF) * 40 + 0xD] = 0xFF;
}
