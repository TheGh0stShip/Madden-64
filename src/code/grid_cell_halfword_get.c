#include "types.h"

typedef struct GridCell {
    u8 bytes[40];
} GridCell;

typedef struct GridRow {
    GridCell cells[213];
    u8 rest[4];
} GridRow;

extern GridRow D_80080D6A[];

u16 func_800397C8(u16 row, u16 column) {
    GridRow* selected = &D_80080D6A[row];
    GridCell* cell;

    __asm__ volatile ("" : : "r"(selected));
    cell = &selected->cells[column];

    return (cell->bytes[36] << 8) | cell->bytes[37];
}
