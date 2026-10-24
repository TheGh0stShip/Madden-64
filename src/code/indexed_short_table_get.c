#include "types.h"

extern s16 D_80088B44[][108];

s32 func_80016B70(s16 row, u8 column) {
    register s32 offset __asm__("$2");
    register u32 index __asm__("$5");
    register s16* table __asm__("$3");

    offset = row * 216;
    index = column;
    table = &D_80088B44[0][0];
    index = (u32)table + index * 2;
    index += offset;
    __asm__ volatile("" : "=r"(index) : "0"(index));
    return *(s16*)index;
}
