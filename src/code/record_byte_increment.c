#include "types.h"

typedef struct ByteRow {
    u8 bytes[0x214C];
} ByteRow;

extern ByteRow D_80082D7E[];

void func_800280B0(u16 row, u16 column) {
    D_80082D7E[row].bytes[column]++;
}
