#include "types.h"

typedef struct MemoryTable {
    u16 count;
    u16 type;
    u16 stride;
    u16 pad06;
    void *data;
    u16 sentinel;
    u16 indices[1];
} MemoryTable;

extern u16 D_8007A3FC[];
extern void *func_80032E00(u32 owner, u32 size);
extern void *func_800337CC(s32 owner, u32 size, s32 source);

MemoryTable *memory_table_create_with_data(s32 type, u16 count, s32 alignment, s32 source)
{
    s16 kind;
    u32 unit;
    u32 n;
    u32 stride;
    MemoryTable *table;
    u32 i;

    kind = type;
    unit = D_8007A3FC[kind];
    n = count;
    alignment--;
    stride = alignment + unit;
    stride &= -unit;
    table = func_80032E00(0, n * 2 + 0x10);
    i = 1;
    table->count = count;
    table->type = type;
    table->stride = stride;
    table->data = func_800337CC(kind, n * stride, source);
    table->sentinel = 0xFFFF;
    if (n != 0) {
        u32 last = n;
        do {
            table->indices[i - 1] = i - 1;
            i++;
        } while (last >= i);
    }
    return table;
}
