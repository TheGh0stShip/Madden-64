#include "types.h"

typedef struct ByteRow {
    u8 bytes[0x214C];
} ByteRow;

extern ByteRow D_80082D7E[];

u32 func_800280FC(u16 row, u16 column) {
    return D_80082D7E[row].bytes[column];
}
