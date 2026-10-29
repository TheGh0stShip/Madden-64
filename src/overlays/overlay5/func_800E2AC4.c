#include "types.h"

extern void func_800E2A5C(void* object, s16 index, u16 enabled);

void func_800E2AC4(void* object, s16 index, s32 count, s32 bits) {
    s16 remaining = count - 1;

    if ((s16)count != 0) {
        do {
            u16 current = bits;

            if (current == 0) {
                break;
            }
            func_800E2A5C(object, index, bits & 1);
            bits = current >> 1;
            index++;
        } while (remaining-- != 0);
    }
}
