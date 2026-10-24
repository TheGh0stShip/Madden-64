#include "types.h"

typedef struct GridCell {
    u8 bytes[40];
} GridCell;

typedef struct GridRow {
    GridCell cells[213];
    u8 rest[4];
} GridRow;

extern GridRow D_80080D6A[];

u32 func_80022A88(u16 row, u16 column) {
    return D_80080D6A[row].cells[column].bytes[13];
}
