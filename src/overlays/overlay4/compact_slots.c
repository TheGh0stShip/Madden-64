#include "types.h"

void func_800E6144(u8* object) {
    u16 index;

    for (index = 1; index < 10; index++) {
        u8* destination = object + (index - 1) * 4;
        u8* source;

        if (destination[0x64] == 0) {
            break;
        }
        source = object + index * 4;
        destination[0x64] = source[0x64];
        destination[0x65] = source[0x65];
        destination[0x66] = source[0x66];
        destination[0x67] = source[0x67];
    }
    object[0x88] = 0;
}
