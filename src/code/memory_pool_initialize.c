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

void memory_pool_initialize(s32 pool)
{
    register MemoryBlock *block __asm__("$16");
    register MemoryBlock *block_end __asm__("$17");
    register s32 saved_pool __asm__("$18") = pool;
    s32 pool_index = (s16)pool;
    u16 *index;
    u16 count;
    u16 value;

    block = D_8007A400[pool_index];
    D_8007A410[pool_index] = block;
    D_8007A40C[pool_index] = block;
    D_8007A414[pool_index] = block;
    block->address = D_8007A3F4[pool_index];
    block->flags = 1;
    block->free_next = (MemoryBlock *)-1;
    block->free_previous = (MemoryBlock *)-1;
    block->previous = (MemoryBlock *)-1;
    block->next = (MemoryBlock *)-1;
    block->size = D_8007A3F8[pool_index];

    block_end = D_8007A400[pool_index];
    while (++block < block_end) {
        func_80033534(block);
    }

    index = D_8007A404[(s16)saved_pool];
    *index = 0xFFFF;
    count = D_8007A3F0[(s16)saved_pool];
    value = 1;
    while (value < count) {
        index++;
        *index = value;
        value++;
    }
    D_8007A408[(s16)saved_pool] = index;
}
