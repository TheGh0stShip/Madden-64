#include "types.h"

void func_8003FF14(u8* source, u8* destination) {
    *(u16*)destination = *(u16*)source;
    destination[2] = source[2];
    destination[3] = source[3];
}
