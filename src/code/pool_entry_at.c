#include "types.h"

extern s32 D_80064BB0;
extern u8 D_80064BC0[];

u8* func_8000E02C(u8 index) {
    u8* entry = D_80064BC0 + D_80064BB0 * 120;

    entry += index * 16;
    return entry;
}
