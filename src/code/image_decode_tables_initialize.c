#include "types.h"

typedef struct ImageTableContext ImageTableContext;

typedef struct ImageTableAllocator {
    void *(*allocate)(ImageTableContext *context, u32 count, u32 size);
} ImageTableAllocator;

typedef struct ImageDecodeTables {
    void (*entry)(void);
    void (*handler)(void);
    s32 *table0;
    s32 *table1;
    s32 *table2;
    s32 *table3;
} ImageDecodeTables;

struct ImageTableContext {
    u32 field0;
    ImageTableAllocator *allocator;
    u8 pad08[0x1BC];
    ImageDecodeTables *tables;
};

void func_8005F868(ImageTableContext *context)
{
    register ImageTableContext *saved_context __asm__("$16") = context;
    register ImageDecodeTables *tables __asm__("$17") = context->tables;
    register s32 index __asm__("$7");
    register u32 value0 __asm__("$8");
    register u32 value1 __asm__("$9");
    register u32 value2 __asm__("$10");
    register u32 value3 __asm__("$11");
    register s32 *last_table __asm__("$2");

    tables->table0 = saved_context->allocator->allocate(saved_context, 1, 0x400);
    tables->table1 = saved_context->allocator->allocate(saved_context, 1, 0x400);
    tables->table2 = saved_context->allocator->allocate(saved_context, 1, 0x400);
    last_table = saved_context->allocator->allocate(saved_context, 1, 0x400);
    index = 0;
    value3 = 0x002C8D00;
    value2 = 0x005B6900;
    value1 = 0xFF1DAF00;
    value0 = 0xFF4D0B80;
    tables->table3 = last_table;

    do {
        register u32 offset __asm__("$4") = index * 4;
        register u32 value2_step __asm__("$6") = 0xFFFF492E;
        register u32 value1_step __asm__("$5") = 0x1C5A2;
        register u32 value0_step __asm__("$3") = 0x166E9;

        __asm__("" : "=r"(offset) : "0"(offset));
        index++;
        __asm__("" : "=r"(index) : "0"(index));
        *(s32 *)(offset + (u32)tables->table0) = (s32)value0 >> 16;
        *(s32 *)(offset + (u32)tables->table1) = (s32)value1 >> 16;
        value1 += value1_step;
        *(s32 *)(offset + (u32)tables->table2) = value2;
        value0 += value0_step;
        value2 += value2_step;
        *(s32 *)(offset + (u32)tables->table3) = value3;
        value3 -= 0x581A;
    } while (index < 0x100);
}
