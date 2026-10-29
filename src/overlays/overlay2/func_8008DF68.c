#include "types.h"

extern u8 D_800C509E[];
s32 func_8003A7B8(u16);

s32 func_8008DF68(s16 id) {
    s32 key;

    if (id < 30) {
        key = D_800C509E[id];
    } else {
        key = (u16)id;
    }
    return func_8003A7B8(key) + 1;
}
