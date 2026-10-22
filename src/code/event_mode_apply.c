#include "types.h"

extern u32 D_80080C10;
extern s16 D_800857B4;

void func_80037AFC(u8* event) {
    if ((event[0] & 0x7F) == 11) {
        D_800857B4 = event[1];
        D_80080C10 |= 0x80;
    }
}
