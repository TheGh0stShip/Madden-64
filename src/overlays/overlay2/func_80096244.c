#include "types.h"

extern s8 D_800C509C;
extern u8 D_800C39F8;

u8 func_800951B0(s32, u8);

u8 func_80096244(s32 arg0) {
    if (D_800C509C >= 2) {
        if (func_800951B0(arg0, D_800C509C - 1) == 0) {
            return D_800C39F8;
        }
    }
    return 0;
}
