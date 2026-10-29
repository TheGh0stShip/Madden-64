#include "types.h"

extern u8 D_800C509E[];
u32 func_8008E040(u8 id);

u8 func_8008E008(u8 id) {
    u32 pos;

    pos = func_8008E040(id); if (pos != 0) { pos--; } else { pos = 29; } return D_800C509E[pos];
}
