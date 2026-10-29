#include "types.h"

extern s8 D_800C509C;
extern u8 D_800C3A00;

u8 func_800951B0(s32, u8);

u8 func_8009629C(s32 arg0) {
    if (D_800C509C >= 2) {
        if (func_800951B0(arg0, D_800C509C - 1) == 1) {
            return D_800C3A00;
        }
    }
    return 0;
}
