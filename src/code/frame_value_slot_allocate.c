#include "types.h"

extern u16 func_8003A21C(u16 index);
extern u8* D_80073438;

s32 func_8003A248(u16 value) {
    u16 index = 0;

    while (func_8003A21C(index) != 0xFFFF) {
        index++;
    }
    if (index < 128) {
        *(u16*)(D_80073438 + 0xCE4 + index * 2) = value;
        return 1;
    }
    return 0;
}
