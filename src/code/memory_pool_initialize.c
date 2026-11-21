#include "types.h"

typedef struct MemoryBlock {
    u32 address;
    u32 size;
    u16 flags;
    u16 pad;
    struct MemoryBlock *next;
    struct MemoryBlock *previous;
    struct MemoryBlock *free_next;
    struct MemoryBlock *free_previous;
} MemoryBlock;

extern u16 D_8007A3F0[];
extern u32 D_8007A3F4[];
extern u32 D_8007A3F8[];
extern MemoryBlock *D_8007A400[];
extern u16 *D_8007A404[];
extern u16 *D_8007A408[];
extern MemoryBlock *D_8007A40C[];
extern MemoryBlock *D_8007A410[];
extern MemoryBlock *D_8007A414[];
extern void func_80033534(MemoryBlock *block);

void memory_pool_initialize(s16 pool)
{
    MemoryBlock *block;
    MemoryBlock *block_end;
    u16 *index;
    u16 count;
    u16 value;

    block = D_8007A400[pool];
    D_8007A410[pool] = block;
    D_8007A40C[pool] = block;
    D_8007A414[pool] = block;
    block->address = D_8007A3F4[pool];
    block->size = D_8007A3F8[pool];
    block->flags = 1;
    block->next = block->previous = block->free_next = block->free_previous = (MemoryBlock *)-1;

    block_end = D_8007A400[pool];
    while (++block < block_end) {
        func_80033534(block);
    }

    index = D_8007A404[pool];
    *index = 0xFFFF;
    count = D_8007A3F0[pool];
    value = 1;
    while (value < count) {
        index++;
        *index = value;
        value++;
    }
    D_8007A408[pool] = index;
}
