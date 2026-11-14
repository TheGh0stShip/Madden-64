#include "types.h"

typedef struct GridRow {
    void *handles[8];
    u8 pad20[8];
    u32 start;
} GridRow;

extern GridRow D_8007A8E8[];
extern void *func_80035D7C(u16 group, u16 index);

void grid_row_handles_build(u16 group, u16 start, u16 row)
{
    u16 saved_group = group;
    u16 current = start;
    u32 offset = row * 44;
    u32 store_value = current;
    {
        u16 index;
        GridRow *entry;
        u8 *base;

        *(volatile u32 *)((u8 *)D_8007A8E8 + offset + 0x28) = store_value;
        base = (u8 *)D_8007A8E8;
        index = 0;
        entry = (GridRow *)(offset + (u32)base);
        do {
            entry->handles[index] = func_80035D7C(saved_group, current++);
            index++;
        } while (index < 8);
    }
}
