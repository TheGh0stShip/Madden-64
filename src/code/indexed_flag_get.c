#include "types.h"

extern s8 D_80086DE4[];
extern u32 D_8008B660[];

u32 func_800318E0(s16 index) {
    return D_8008B660[D_80086DE4[index]] & 1;
}
