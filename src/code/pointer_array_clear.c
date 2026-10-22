#include "types.h"

void func_80008E6C(u32* array) {
    s32 count = array[0];

    while (count-- != 0) {
        array[count + 1] = 0;
    }
}
