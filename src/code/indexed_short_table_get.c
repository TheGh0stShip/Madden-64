#include "types.h"

extern s16 D_80088B44[][108];

s32 func_80016B70(s16 row, u8 column) {
    s16 *entry;
    s16 *table;
    s32 offset;
    u32 index;

    do {
        offset = row * 216;
    } while (0);
    index = column;
    table = &D_80088B44[0][0];
    entry = table + index;
    entry = (s16 *)((u8 *)entry + offset);
    return *entry;
}
