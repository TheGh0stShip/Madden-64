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

MemoryTable *memory_table_create_with_data(s32 type, s32 count,
                                            s32 alignment, s32 source)
{
    register s32 saved_type __asm__("$18") = type;
    register s32 saved_count __asm__("$20") = count;
    register s32 work_s1 __asm__("$17") = (s16)saved_type;
    register s32 saved_source __asm__("$19") = source;
    register u32 normalized_count __asm__("$22");
    u32 unit;
    register u32 stride __asm__("$16");
    MemoryTable *table;
    register u32 index __asm__("$21");

    unit = D_8007A3FC[work_s1];
    normalized_count = saved_count & 0xFFFF;
    stride = alignment - 1;
    stride += unit;
    stride &= -unit;
    work_s1 = (s32)func_80032E00(0, normalized_count * 2 + 0x10);
    table = (MemoryTable *)work_s1;
    index = 1;

    table->count = saved_count;
    table->type = saved_type;
    table->stride = stride;
    table->data = func_800337CC((s16)saved_type,
                                normalized_count * stride, saved_source);
    table->sentinel = 0xFFFF;
    if (normalized_count != 0) {
        register u32 loop_count __asm__("$5") = normalized_count;
        u16 *cursor = (u16 *)((u8 *)table + 2);

        do {
            cursor[6] = index - 1;
            index++;
            cursor++;
        } while (loop_count >= index);
    }
    return table;
}
