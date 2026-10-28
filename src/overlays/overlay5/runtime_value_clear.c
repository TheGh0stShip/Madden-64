#include "types.h"

extern s32 D_80085018;

void func_80032F3C(s32 slot, s32 value);

void func_800E1E48(s32 unused, s32 value) {
    if (value != 0) {
        func_80032F3C(0, value);
    }
    D_80085018 = 0;
}
