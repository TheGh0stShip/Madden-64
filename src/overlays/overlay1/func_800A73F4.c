#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern u8 *D_8008A724[];

void func_800A73F4(u8 *obj) {
    s16 i;

    for (i = 0; i < 1; i++) {
        if (D_8008A724[i] == NULL) {
            D_8008A724[i] = obj;
            break;
        }
    }
    *(s32 *)(obj + 0xB0) = 0xFDF00000;
    *(s32 *)(obj + 0xB4) = 0x02100000;
    *(s32 *)(obj + 0xB8) = 0xFC000000;
    *(s16 *)(obj + 0x84) = 0;
    *(s16 *)(obj + 0xA) = 0;
    *(s32 *)(obj + 0x3C) = 0;
    *(s32 *)(obj + 0x40) = 0;
    *(s32 *)(obj + 0x44) = 0;
    *(s32 *)(obj + 0xBC) = 0x04000000;
}
