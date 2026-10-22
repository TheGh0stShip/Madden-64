#include "types.h"

void func_800DDABC(u8* value) {
    u32 first = value[2];
    u32 second = value[3];

    first -= 0x80;
    first = -first;
    value[2] = first & 0x7F;
    if (second < 10) {
        value[3] = second - 9;
    }
}
