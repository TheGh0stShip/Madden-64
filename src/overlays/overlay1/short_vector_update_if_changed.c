#include "types.h"

void func_800A75D8(u8* object, s16* vector) {
    if (vector[0] == *(s16*)(object + 0x64) &&
        vector[1] == *(s16*)(object + 0x66) &&
        vector[2] == *(s16*)(object + 0x68)) {
        return;
    }
    *(u16*)(object + 0x64) = vector[0];
    *(u16*)(object + 0x66) = vector[1];
    *(u16*)(object + 0x68) = vector[2];
    *(u16*)(object + 0x84) |= 0x21;
}
