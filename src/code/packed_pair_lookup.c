#include "types.h"

extern u8* D_800869EC;

void func_800221E8(s32 row, s32 column, s16* output) {
    u32 row_value;
    u32 offset;
    u32 entry;
    u8* base;

    do {
        row_value = (u16)row;
    } while (0);
    entry = (u16)column;
    do {
        base = D_800869EC;
    } while (0);
    entry <<= 1;
    offset = row_value * 25;
    offset += (u32)base;
    entry += offset;

    output[0] = (s8)((u8*)entry)[0];
    output[1] = ((u8*)entry)[1] & 0x3F;
}
