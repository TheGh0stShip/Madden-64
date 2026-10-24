#include "types.h"

extern s32 func_800356C4(s32 first, s32 second);
extern s16 D_80085BF8;
extern s32 D_8008A700;

void func_80016E80(s32 unused, s32 first, s32 second) {
    D_80085BF8 = func_800356C4(first, second);
    D_8008A700 = 0;
}
