#include "types.h"

extern u8* D_800869EC;

void func_800221E8(s32 row, s32 column, s16* output) {
    register u32 row_value __asm__("$4");
    register u32 offset __asm__("$2");
    register u32 entry __asm__("$5");
    register u8* base __asm__("$3");

    row_value = (u16)row;
    __asm__ volatile("" : "=r"(row_value) : "0"(row_value));
    entry = (u16)column;
    __asm__ volatile("" : "=r"(entry) : "0"(entry));
    base = D_800869EC;
    __asm__ volatile("" : "=r"(base) : "0"(base));
    entry <<= 1;
    offset = row_value << 1;
    offset += row_value;
    offset <<= 3;
    offset += row_value;
    offset += (u32)base;
    entry += offset;
    __asm__ volatile("" : "=r"(entry) : "0"(entry));

    output[0] = (s8)((u8*)entry)[0];
    output[1] = ((u8*)entry)[1] & 0x3F;
}
