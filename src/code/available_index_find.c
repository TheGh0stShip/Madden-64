#include "types.h"

extern u16 func_8003A21C(u16 index);

u16 func_8003A1D0(void) {
    u16 index = 0;

    while (func_8003A21C(index) != 0xFFFF) {
        index++;
    }
    return index;
}
