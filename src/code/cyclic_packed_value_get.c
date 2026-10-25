#include "types.h"

typedef struct PackedValue {
    u8 bytes[4];
} PackedValue;

typedef struct PackedValueTable {
    u8 current;
    PackedValue values[30];
} PackedValueTable;

extern PackedValueTable D_80088AFA;

void func_80029954(u8 offset, PackedValue* destination) {
    s32 index = (D_80088AFA.current + offset) % 30;

    *destination = D_80088AFA.values[index];
}
