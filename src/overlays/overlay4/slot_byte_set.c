#include "types.h"

void func_800DD040(u8* slots, u8 value) {
    s32 index;

    for (index = 0; index < 10; index++) {
        if (slots[index * 4 + 0x64] == 0) {
            break;
        }
        if (slots[index * 4 + 0x64] == 30) {
            slots[index * 4 + 0x65] = value;
        }
    }
}
