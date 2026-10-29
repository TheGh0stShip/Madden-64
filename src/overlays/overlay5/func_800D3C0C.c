#include "types.h"

void func_800D3C0C(u8* data, u16 value) {
    u16 work;

    work = value;
    work >>= 8;
    data += 0xF;
    data[0] = value;
    data[1] = work;
}
