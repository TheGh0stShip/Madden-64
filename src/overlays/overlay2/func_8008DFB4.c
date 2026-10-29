#include "types.h"

extern u8 D_800C509E[];
u32 func_8008E040(u8 id);

u8 func_8008DFB4(u8 id) {
    s32 next = (func_8008E040(id) + 1) % 30;

    return D_800C509E[next];
}
