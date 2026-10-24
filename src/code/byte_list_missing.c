#include "types.h"

extern u8 D_8006AFA0[];

s32 func_800393E0(u8 value) {
    u8* entry = D_8006AFA0;

    while (*entry != 0xFF) {
        if (*entry == value) {
            return 0;
        }
        entry++;
    }
    return 1;
}
