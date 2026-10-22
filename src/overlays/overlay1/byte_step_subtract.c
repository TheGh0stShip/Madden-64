#include "types.h"

void func_800C5910(u8* object, s16 amount) {
    u8 previous = object[0x1A];

    if (previous != 0xFF) {
        object[0x1A] -= amount / 16;
        if (previous < object[0x1A]) {
            object[0x1A] = 0;
        }
    }
}
