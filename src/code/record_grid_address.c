#include "types.h"

typedef struct GridCell {
    u8 bytes[40];
} GridCell;

typedef struct GridRow {
    GridCell cells[213];
    u8 rest[4];
} GridRow;

extern GridRow D_80080D6A[];

GridCell* func_80022A3C(u16 row, u16 column) {
    GridRow* selected = &D_80080D6A[row];

    __asm__ volatile ("" : : "r"(selected));
    return &selected->cells[column];
}
