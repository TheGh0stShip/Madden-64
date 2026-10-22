#include "types.h"

extern s32 D_80073508;
extern s32 D_800740D8;

void func_8003CB98(u16 value) {
    D_80073508 = value;
    D_800740D8 = value * 2;
}
