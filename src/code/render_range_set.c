#include "types.h"

extern s32 D_800724E4;
extern s32 D_800724E8;

void func_80036464(s32 start, s32 end) {
    D_800724E4 = end;
    D_800724E8 = start;
}
