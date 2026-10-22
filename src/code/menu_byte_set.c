#include "types.h"

extern s8 D_80069FB8[];

void func_8001FA50(u16 index, s8 value) {
    D_80069FB8[index] = value;
}
