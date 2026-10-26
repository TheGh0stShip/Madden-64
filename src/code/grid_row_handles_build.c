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
    register u16 saved_group __asm__("$19");
    register u16 current __asm__("$17");
    register u16 index __asm__("$16");
    register GridRow *entry __asm__("$18");
    register u32 offset __asm__("$2");
    register u32 store_value __asm__("$3");
    register u8 *base __asm__("$3");
    register u16 argument __asm__("$5");

    saved_group = group;
    __asm__ volatile("" : "=r"(saved_group) : "0"(saved_group));
    current = start;
    __asm__ volatile("" : "=r"(current) : "0"(current));
    offset = row * 44;
    __asm__ volatile("" : "=r"(offset) : "0"(offset));
    store_value = current;
    __asm__ volatile("" : "=r"(store_value) : "0"(store_value));
    index = 0;
    *(volatile u32 *)((u8 *)D_8007A8E8 + offset + 0x28) = store_value;
    __asm__ volatile("" :
                     : "m"(*(volatile u32 *)
                           ((u8 *)D_8007A8E8 + offset + 0x28)));
    base = (u8 *)D_8007A8E8;
    entry = (GridRow *)(offset + (u32)base);
    __asm__ volatile("" : : : "$5");
    argument = current;
    __asm__ volatile("" : "=r"(argument) : "0"(argument));
    do {
        current++;
        entry->handles[index] = func_80035D7C(saved_group, argument);
        index++;
        argument = current;
    } while (index < 8);
}
